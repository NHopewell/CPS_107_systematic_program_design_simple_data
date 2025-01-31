;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab-03-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)
(require 2htdp/universe)

(@assignment labs/lab-03)

;; If you are:
;;   - A 110 or 107 student replace the first set of '???'s with your cwl.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   - A UBC Extended Learning student, replace the first set of ??? with
;;     the your email address as confirmed in the email you received from
;;     extended learning.  The handin password is also in that email.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   
(@cwl nicholashopewell@gmail.com)

; Balloon popping

(@htdw Balloon)
;; CONSTANTS ==========================

(define WIDTH 500)
(define HEIGHT 500)
(define MTS (empty-scene WIDTH HEIGHT))

(define BALLOON-COLOR "red")
(define POP-IMAGE
  (overlay (text "POP!" 80 "black")
           (radial-star 30 (/ WIDTH 10) (/ WIDTH 2) "solid" "yellow")))

(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))

(define SPEED 2)

(define MAX-SIZE (/ WIDTH 2))

(define (draw-circle size)
  (circle size "solid" BALLOON-COLOR))





;; DATA DEFINITIONS ============================
 
(@problem 1)

(@htdd Balloon)
;; Balloon is one of:
;;  - Number
;;  - "popped"
;; interp. number is radius of balloon.
;; Popped is when balloon expands past radius.

(define B1 200)
(define B2 "popped") 

(@dd-template-rules one-of                ;2 cases
                    atomic-non-distinct   ;number 
                    atomic-distinct)      ;string


(define (fn-for-balloon b)
  (cond [(number? b) (... b)]
        [else (...)]))





;; FUNCTIONS ====================================
(@problem 2)
(@htdf main)
(@signature Balloon -> Balloon)  ;
;; starts the world program with a balloon
; no examples for main function

(@template htdw-main)
(define (main b)
  (big-bang b              ; WS
            (on-tick tick)   ; WS -> WS
            (to-draw render) ; WS -> Image
;           (stop-when ...)  ; WS -> Boolean
;           (on-mouse ...)   ; WS Integer Integer MouseEvent -> WS
;           (on-key ...)     ; WS KeyEvent -> WS
            ))

(@problem 3)
(@htdf tick)
(@signature Balloon -> Balloon) ;
;; produce the next Baloon image
(check-expect (tick 200) (+ 200 SPEED))
(check-expect (tick MAX-SIZE) "popped")

(@template Balloon)

(define (tick b)
  (cond [(<= (+ b SPEED) MAX-SIZE) (+ b SPEED)]
      [else "popped"]))




(@problem 4)
(@htdf render)
(@signature Balloon -> Image) ;
;; render next size of balloon
(check-expect (render 200) (draw-circle 200))
(check-expect (render "popped") POP-IMAGE)

(@template Balloon)
(define (render b)
    (cond [(number? b) (draw-circle b)]
      [else POP-IMAGE]))

