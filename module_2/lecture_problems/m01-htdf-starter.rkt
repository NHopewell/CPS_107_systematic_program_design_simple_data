;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m01-htdf-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require spd/tags)

(@assignment lectures/m01-htdf)

(@cwl nicholashopewell@gmail.com) ;replace ??? by your CWL


;; *****************************************************************************
;; NOTE:
;;  For lecture starters we want you to submit to handin several times during
;;  the lecture.  Submit your file even if pressing the "Run" or  "Check Syntax"
;;  buttons  produces an error.  For lecture we want to see the progression of
;;  your work.
;;
;;  But for problem sets, labs, and exams you should not submit your file if
;;  Check Syntax produces an error.  Fix the error first, then submit.
;; *****************************************************************************


(@problem 1)
;;
;; Design a function, called topple, that takes an image and rotates it 
;; by 90 degrees.
;;

(@htdf topple)
(@signature Image -> Image)
;; produces the image rotated 90 degrees
(define RECT (rectangle 20 20 "solid" "red"))
(define ROTATED_RECT (rotate 90 RECT))

(define TRI (triangle 20 "solid" "blue"))
(define ROTATED_TRI (rotate 90 TRI))
  
(check-expect (topple RECT) ROTATED_RECT)
(check-expect (topple TRI) ROTATED_TRI)
 
;; (define (topple img) RECT)    ;; this is the stub

(@template Image)
;; (define (topple img)          ;; this is the template
;;   (... img))

(define (topple img)        
  (rotate 90 img))



(@problem 2)
;;
;; Design a function that consumes the name of something and produces a
;; "checkbox line" image that allows someone to check off that item.  For 
;; example (checkbox-line "apples") would produce an image with a small
;; check box next to the word apples.
;;

(@htdf checkbox-line)
(@signature String -> Image)
;; Consumes a word and produces an checkbox image next to that word

(define test_case_one "Bananas")
(define expected_one
  (beside (add-line (square 40 "outline" "black") -10 50 50 -10 "maroon")
          (text "Bananas" 16 "black")))

(check-expect (checkbox-line test_case_one) expected_one)

;;(define (checkbox-line word) 0)         ;; this is the stub

(@template String)
;; (define (checkbox-line word)           ;; this is the template
;;  (... word))

(define (checkbox-line word)           
  (beside (add-line (square 40 "outline" "black") -10 50 50 -10 "maroon")
          (text word 16 "black")))



(@problem 3)
;;
;; Design a function, that consumes an image and determines whether it is tall.
;;

(@htdf tall?)
(@signature Image -> Boolean)
;; Consumes an image and determines whether it is tall
;; (whether its height is greater than its width
(check-expect (tall? (rectangle 20 40 "solid" "red")) true)
(check-expect (tall? (rectangle 30 20 "solid" "red")) false)
(check-expect (tall? (rectangle 20 20 "solid" "red")) false)

;; (define (tall? img) false)     this is the stub

(@template Image)
;; (define (tall? img)
 ;;  (... img))

(define (tall? img)
  (> (image-height img) (image-width img)))



(@problem 4)
;;
;; Design a function, called image>, that takes two images and determines 
;; whether the first is larger than the second.
;;

(@htdf image>)
(@signature Image Image -> Boolean)

;; Given two images, determines if the first is larger than the second

(define small_square (square 10 "solid" "black"))
(define big_square (square 20 "solid" "black"))

(check-expect (image> small_square big_square) false)
(check-expect (image> big_square small_square) true)
(check-expect (image> small_square small_square) false)


;; (define (image> img1 img2) false)     -> this is the stub

(@template Image)           
;; (define (image> img1 img2)            -> this is the template
;;   (... img1 img2))


(define (image> img1 img2)
  (> (* (image-height img1) (image-width img1))
     (* (image-height img2) (image-width img2))))







