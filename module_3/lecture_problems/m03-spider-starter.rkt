;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m03-spider-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)

(@assignment lectures/m03-spider)

(@cwl nicholashopewell@gmail.com) ;replace ??? with your cwl


(@problem 1)
#|
PROBLEM:

Design a world program in which a spider starts at the top of the screen
and slowly drops down it. The spider should stop when it reaches the bottom
of the screen.

You can improve your spider by re-running the HtDW recipe to add these
features. 


  - Draw a line from the BOT of the screen to the spider, this is the thread 
    it is hanging from. You will need to use add-line for this. Look in the
    DrRacket help desk to see how add-line works.  [NOTE that adding this
    functionality will cause the autograder to complain, the autograder is
    just designed to grade the original problem.]
    
  - Arrange for pressing the space key to reset the spider to the BOT of 
    the screen.
|#



;; My world program  (make this more specific)

(@htdw Spider)
(define WIDTH 600)
(define BOT 400)
(define TOP 0)

(define CTR-X (/ WIDTH 2))
(define MTS (empty-scene WIDTH BOT))

(define SPIDER-IMAGE (rectangle 20 10 "solid" "red"))
(define SPEED 5)


;; =================
;; Data definitions:
(@htdd Spider)
;; Spider is Number
;; interp: x position of spider on screen coordinates
(define C1 BOT)              ;spider on top of screen
(define C2 (/ BOT 2))         ;spider in middle
(define C3 TOP)                    ;spider at bottom

(@dd-template-rules atomic-non-distinct)   ; Natural

(define (fun-for-spider s)
  (... s))


;; =================
;; Functions:

(@htdf main)
(@signature Spider -> Spider)
;; start the world with ...
;;

(@template htdw-main)

(define (main s)
  (big-bang s                   ; Spider
            (on-tick   move-spider)     ; Spider -> Spider
            (to-draw   draw-spider)   ; Spider -> Image
            (on-key    handle-key)))    ; Spider KeyEvent -> Spider




;....................
(@htdf move-spider)
(@signature Spider -> Spider)
;; produce the next ...

(check-expect (move-spider BOT) BOT)
(check-expect (move-spider TOP) (+ TOP 1))
(check-expect (move-spider 100) 101)

(@template Spider)

(define (move-spider s)
  (if (= s BOT)
      s
      (+ s 1)))



;....................
(@htdf draw-spider)
(@signature Spider -> Image)
;; draw-spider ...

(check-expect (draw-spider 10) (place-image SPIDER-IMAGE CTR-X 10 MTS))
(check-expect (draw-spider 100) (place-image SPIDER-IMAGE CTR-X 100 MTS))
(check-expect (draw-spider 0) (place-image SPIDER-IMAGE CTR-X 0 MTS))

(@template Spider)

(define (draw-spider s)
  (place-image SPIDER-IMAGE CTR-X s MTS))


;....................

(@htdf handle-key)
(@signature Spider KeyEvent -> Spider)
;; reset spider to left edge when space key is pressed
(check-expect (handle-key 10 " ") TOP)  
(check-expect (handle-key 10 "a") 10)
(check-expect (handle-key 0 " ") TOP)
  
;(define (handle-key c key-event) 0)     ; -> stub

(@template KeyEvent)

(define (handle-key s ke)
  (cond [(key=? ke " ") TOP]
        [else s]))























