;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m05-arrange-images-v2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment lectures/m05-arrange-images)
;; arrange-images-starter.rkt (problem statement)
;; arrange-images-v1.rkt      (includes ListOfImage)
;; arrange-images-v2.rkt      (+ arrange-images and 2 wish-list entries)

(@cwl nicholashopewell@gmail.com) ;replace ??? with your cwl





#|

PROBLEM:

In this problem imagine you have a bunch of pictures that you would like to
store as data and present in different ways. We'll do a simple version of that
here, and set the stage for a more elaborate version later.

(A) Design a data definition to represent an arbitrary number of images.

(B) Design a function called arrange-images that consumes an arbitrary number
    of images and lays them out left-to-right in increasing order of size.

|#
(@problem 1)
;; Constants:

(define BLANK (square 0 "solid" "white"))

;; for testing:
(define I1 (rectangle 10 20 "solid" "blue"))
(define I2 (rectangle 20 30 "solid" "red"))
(define I3 (rectangle 30 40 "solid" "green"))


;; Data definitions:

(@htdd ListOfImage)
;; ListOfImage is one of:
;;  - empty
;;  - (cons Image ListOfImage)
;; interp. An arbitrary number of images
(define LOI1 empty)
(define LOI2 (cons I1
                   (cons I2
                         empty)))

(define LOI3 (cons I3 (cons I1( cons I2 empty))))

(@dd-template-rules   one-of             ; 2 cases
                      atomic-distinct    ; empty
                      compound           ; (cons Image ListOfImage)
                      self-ref)          ; (rest ListOfImage) is ListOfImage

(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))






;; Functions

(@htdf arrange-images)
(@signature ListOfImage -> Image)
;; Arrange images in teerms of size, 2 steps
;;  1) sort images in terms of size
;;  2) display them in sorted order

;; Funnction composition - 2 helper functions
;; NOTE: dont need to test base case in function composition functions (drivers)

(check-expect (arrange-images (cons (rectangle 10 20 "solid" "blue")
                                    (cons (rectangle 20 30 "solid" "red")
                                          empty)))
              (beside
                 (rectangle 10 20 "solid" "blue")
                 (rectangle 20 30 "solid" "red")
                 BLANK))

(check-expect (arrange-images (cons (rectangle 20 30 "solid" "red")
                                    (cons(rectangle 10 20 "solid" "blue")
                                          empty)))
              (beside
                 (rectangle 10 20 "solid" "blue")
                 (rectangle 20 30 "solid" "red")
                 BLANK))

(@template ListOfImage)

(define (arrange-images loi)
  (layout-images (sort-images loi)))



;; helpers
(@htdf sort-images)
(@signature ListOfImage -> ListOfImage)
;; Sort a list of images in terms of size in increaing order

(check-expect (sort-images empty) empty)
(check-expect (sort-images LOI2) LOI2)
(check-expect (sort-images
               (cons I3 (cons I1( cons I2 empty))))
              (cons I1 (cons I2 (cons I3 empty))))

(@template ListOfImage)

(define (sort-images loi)
  (cond [(empty? loi) empty]
        [else
         (insert (first loi)  ;; helper insert
              (sort-images (rest loi)))]))



;; recursive helper insert
(@htdf insert)
(@signature Image ListOfImage -> ListOfImage)
;; produce new list with image in proper place in list
;; (increading order in terms of area)

; (define (insert img loi) loi)

(check-expect (insert I1 empty) (cons I1 empty))
(check-expect (insert I1 (cons I2 (cons I3 empty)))
              (cons I1 (cons I2 (cons I3 empty))))
(check-expect (insert I2 (cons I1 (cons I3 empty)))
              (cons I1 (cons I2 (cons I3 empty))))


(@template ListOfImage)

(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]
        [else
         (if (larger? img (first loi))  ;; helper insert
             (cons (first loi) (insert img (rest loi)))
             (cons img loi))]))



;; larger helper
(@htdf larger?)
(@signature Image Image -> Boolean)
;; produces true if img1 is larger than img 2

(check-expect (larger? (rectangle 3 4 "solid" "red")
                       (rectangle 2 6 "solid" "red")) false)
(check-expect (larger? (rectangle 5 4 "solid" "red")
                       (rectangle 2 6 "solid" "red")) true)
(check-expect (larger? (rectangle 3 5 "solid" "red")
                       (rectangle 2 6 "solid" "red")) true)
(check-expect (larger? (rectangle 3 4 "solid" "red")
                       (rectangle 5 6 "solid" "red")) false)
(check-expect (larger? (rectangle 3 4 "solid" "red")
                       (rectangle 2 7 "solid" "red")) false)

;(define (larger? img1 im2) true)

(define (larger? img1 img2)
  (> (* (image-width img1) (image-height img1))
     (* (image-width img2) (image-height img2))))





(@htdf layout-images)
(@signature ListOfImage -> Image)
;; consumes a list of images and displays them beside each other

(check-expect (layout-images empty) BLANK)
(check-expect (layout-images (cons (rectangle 10 20 "solid" "blue")
                                    (cons (rectangle 20 30 "solid" "red")
                                          empty)))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      BLANK))
              

(@template ListOfImage)

(define (layout-images loi)
  (cond [(empty? loi) BLANK]
        [else
         (beside (first loi)
                 (layout-images (rest loi)))]))


