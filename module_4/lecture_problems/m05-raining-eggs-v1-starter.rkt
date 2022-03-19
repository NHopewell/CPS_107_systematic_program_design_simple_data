;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m05-raining-eggs-v1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)
(@assignment lectures/m05-raining-eggs)

(@cwl nicholashopewell@gmail.com)


;;
;; In the raining eggs program, the program starts with an arbitrary number of
;; eggs that are falling down straight and spinning. When you click mouse a
;; new egg appears where you click. Mario stands in the scene, hoping no eggs
;; drop on his head. (All eggs magically pass Mario.) Eggs disappear off the
;; bottom of the screen. When the space key is pressed, all eggs disappear
;;


;;  Yoshi Eggs
(@htdw Egg)

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
;; fall-speed is how fast (in pixels) the egg is falling down the screen
;; spin-speed is how fast (in pixels) the egg is spinning
(define E1 (make-egg 50 25 25))
(define E2 (make-egg 100 45 35))

(@dd-template-rules compound)

(define (fun-for-egg e)
  (... (egg-x e)
       (egg-y 2)
       (egg-r e)))



(@htdd ListOfEgg)
;; ListOfEgg is one of:
;; - empty
;; - cons Egg ListOfEgg
;; interp. a list of Eggs

(define LOE1 empty)
(define LOE2 (cons E1 empty))
(define LOE3 (cons E1 (cons E2 empty)))


(@dd-template-rules one-of
                    atomic-distinct
                    compound
                    ref
                    self-ref)

(define (fn-for-loe loe)
  (cond [(empty? loe) (...)]
        [else
         (... (fn-for-egg (first loe))
              (fn-for-loe (rest loe)))]))



;; =================
;; Functions:

(@htdf main)
(@signature ListOfEgg -> ListOfEgg)
;; start the world with ...
;;

(@template htdw-main)

(define (main loe)
  (big-bang loe          ; ListOfEgg
    (on-tick   tock)     ; ListOfEgg -> ListOfEgg
    (to-draw   render)   ; ListOfEgg -> Image
    (on-mouse  ...)      ; ListOfEgg Integer Integer MouseEvent -> ListOfEgg
    (on-key    ...)))    ; ListOfEgg KeyEvent -> ListOfEgg





(@htdf tock)
(@signature ListOfEgg -> ListOfEgg)
;; produce the next egg

(check-expect (tock LOE1) empty)
(check-expect (tock LOE2)
              (cons (next-egg E1) empty))

(check-expect (tock LOE3)
              (cons (next-egg E2)
                    (cons (next-egg E1)
                    empty)))

;(define (next-balls lob) empty)   ; -> stub
(@template ListOfEgg)

(define (tock loe)
  (cond [(empty? loe) empty]
        [else
         (cons (next-egg (first loe))
               (tock (rest loe)))]))




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


(@htdf render)
(@signature ListOfEgg -> Image)
;; Place EGG at appropriate location and rotation on MTS for each egg in loe

(check-expect (render empty) MTS)
(check-expect (render (cons (make-egg 10 20 30)
                                 empty))
              (place-image (rotate 30 YOSHI-EGG) 10 20
                           MTS))
(check-expect (render (cons (make-egg 110 120 130)
                                 (cons (make-egg 10 20 30)
                                       empty)))
              (place-image (rotate 130 YOSHI-EGG) 110 120
                           (place-image (rotate 30 YOSHI-EGG) 10 20
                                        MTS)))


(@template ListOfEgg)
(define (render loe)
  (cond [(empty? loe) MTS]
        [else
         (place-egg (first loe)
                    (render (rest loe)))]))


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



(@htdf ...)

(@htdf ...)