;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m05-raining-eggs-v-2-5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)
(@assignment lectures/m05-raining-eggs)

(@cwl nicholashopewell@gmail.com)

;;  Yoshi Eggs
(@htdw ListOfEgg)

;; Constants:
(@problem 1)
(define WIDTH 400)
(define HEIGHT 600)

(define MARIO
  (bitmap/url "https://cs110.students.cs.ubc.ca/lectures/gk/lec07-mario.png"))

(define MTS
  (place-image MARIO
               (/ WIDTH 2)
               (- HEIGHT (/ (image-height MARIO) 2) 5)
               (empty-scene WIDTH HEIGHT)))

(define YOSHI-EGG 
  (bitmap/url "https://cs110.students.cs.ubc.ca/lectures/gk/lec07-egg.png"))

(define FALL-SPEED 5) ;pixels  per tick
(define SPIN-SPEED 5) ;degrees per tick


;; Data Definitions:

(@htdd Egg)

(define-struct egg (x y r))
;; Egg is (make-egg Number Number Number)
;; interp. the x, y position of an egg in scren coordinates (pixels),
;;         and rotation angle in degrees

(define E1 (make-egg 100 50 23))
(define E2 (make-egg 20 30 50))

(@dd-template-rules compound) ;3 fields


(define (fn-for-egg e)
  (... (egg-x e)    ;Number
       (egg-y e)    ;Number
       (egg-r e)))  ;Number


(@htdd ListOfEgg)
;; ListOfEgg is one of:
;; - empty
;; - (cons Egg ListOfEgg)
;; interp. a list of eggs
(define LOE1 empty)
(define LOE2 (cons E1 empty))
(define LOE3 (cons E1 (cons E2 empty)))

(@dd-template-rules one-of           ;2 cases
                    atomic-distinct  ;empty
                    compound         ;cons
                    ref              ;(first loe) is Egg
                    self-ref)        ;(rest loe) is ListOfEgg

(define (fn-for-loe loe)
  (cond [(empty? loe)(...)]
        [else
         (... (fn-for-egg (first loe))
              (fn-for-loe (rest loe)))]))


;;===================================================

;; Functions:

(@htdf main)
(@signature ListOfEgg -> ListOfEgg)
;; start the world with (main empty)

(@template htdw-main)

(define (main loe)
  (big-bang loe           ;ListOfEgg
    (state true)
    (on-tick next-eggs)    ;ListOfEgg -> ListOfEgg
    (to-draw render-eggs)  ;ListOfEgg -> Image
    (on-mouse lay-egg)     ;ListOfEgg Integer Integer MouseEvent -> Image
    (on-key   handle-key))); ListOfEgg KeyEvent -> ListOfEgg


(@htdf next-eggs)
(@signature ListOfEgg -> ListOfEgg)
;; produce the next eggs at appropriate locations and angles
(check-expect (next-eggs empty) empty)
(check-expect (next-eggs (cons (make-egg 10 20 30)
                               (cons (make-egg 110 120 130)
                                     empty)))
              (cons (make-egg 10 (+ 20 FALL-SPEED) (+ 30 SPIN-SPEED))
                    (cons (make-egg 110 (+ 120 FALL-SPEED) (+ 130 SPIN-SPEED))
                    empty)))

; (define (next-eggs loe) loe) ;stub


(define (next-eggs loe)
  (cond [(empty? loe) empty]
        [else
         (cons (next-egg (first loe))
               (next-eggs (rest loe)))]))



(@htdf next-egg)
(@signature Egg -> Egg)
;; produce next egg
(check-expect (next-egg E1)
              (make-egg
                       (egg-x E1)
                       (+ (egg-y E1) FALL-SPEED)
                       (+ (egg-r E1) SPIN-SPEED)))

(check-expect (next-egg E2)
              (make-egg
                       (egg-x E2)
                       (+ (egg-y E2) FALL-SPEED)
                       (+ (egg-r E2) SPIN-SPEED)))


; (define (next-egg) e)

(@template Egg) 

(define (next-egg e)
  (make-egg (egg-x e)
            (+ (egg-y e) FALL-SPEED)
            (+ (egg-r e) SPIN-SPEED)))













(@htdf render-eggs)
(@signature ListOfEgg -> Image)
;; Place EGG at appropriate location and rotation on MTS for each egg in loe

(check-expect (render-eggs empty) MTS)
(check-expect (render-eggs (cons (make-egg 10 20 30)
                                 empty))
              (place-image (rotate 30 YOSHI-EGG) 10 20
                           MTS))
(check-expect (render-eggs (cons (make-egg 110 120 130)
                                 (cons (make-egg 10 20 30)
                                       empty)))
              (place-image (rotate 130 YOSHI-EGG) 110 120
                           (place-image (rotate 30 YOSHI-EGG) 10 20
                                        MTS)))


(@template ListOfEgg)
(define (render-eggs loe)
  (cond [(empty? loe) MTS]
        [else
         (place-egg (first loe)
                    (render-eggs (rest loe)))]))


(@htdf place-egg)
(@signature Egg Image -> Image)
;; place Egg on MTS

(check-expect (place-egg E1 MTS)
              (place-image YOSHI-EGG (egg-x E1) (egg-y E1) MTS))
(check-expect (place-egg E2 MTS)
              (place-image YOSHI-EGG (egg-x E2) (egg-y E2) MTS))

; (define (place-egg egg) MTS)   -> stub



(@template Egg)
(define (place-egg e img)
  (place-image (rotate  (egg-r e) YOSHI-EGG)
               (egg-x e)
               (egg-y e)
               img))
























(@htdf lay-egg)
(@signature ListOfEgg Integer Integer MouseEvent -> ListOfEgg)
;; add and egg at x, y with rotation 0 when the mouse is clicked
(check-expect (lay-egg empty 10 40 "button-down")
              (cons (make-egg 10 40 0) empty))

(check-expect (lay-egg empty 90 100 "drag") empty)

;(define (lay-egg loe x y me) loe) ;stub

(@template MouseEvent)

(define (lay-egg loe x y me)
  (cond [(mouse=? me "button-down") (cons (make-egg x y 0) loe)]
        [else loe]))

(@htdf handle-key)
(@signature ListOfEgg KeyEvent -> ListOfEgg)
;; on space reset to zero eggs
(check-expect (handle-key (cons E1 (cons E2 empty)) " ") empty)
(check-expect (handle-key (cons E1 empty) "a") (cons E1 empty))

;(define (handle-key loe ke) loe) ;stub

(@template KeyEvent)

(define (handle-key loe ke)
  (cond [(key=? ke " ") empty]
        [else loe]))
