;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname spd1-f-p3-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/exl/spd1-f/spd1-f-p3)

(@cwl nicholashopewell@gmail.com)   ;replace ??? with your email address
;            ;as you have done for problem sets

(@problem 1) ;this is actually problem 4 - DO NOT EDIT OR DELETE THIS LINE!


;; You are given the following data definitions for Solid and ListOfSolid:

(@htdd Solid)
(define-struct solid (w h d))
;; Solid is (make-solid Number Number Number)
;; interp. the width, height, and depth of a 3 dimensional rectangular solid
(define SLD1 (make-solid 2 3 4))
(define SLD2 (make-solid 2.3 6 1.1))

(@dd-template-rules compound)

(define (fn-for-solid s)
  (... (solid-w s)
       (solid-h s)
       (solid-d s)))

(@htdd ListOfSolid)
;; ListOfSolid is one of:
;; - empty
;; - (cons Solid ListOfSolid)
;; interp. a list of 3 dimensional rectangular solids

(define LOS0 empty)
(define LOS1 (cons (make-solid 2 3 4) empty))
(define LOS2 (cons (make-solid 1 1 1)
                   (cons (make-solid 1.1 1.2 1.3)
                         (cons (make-solid 10 20 30) empty))))

(@dd-template-rules one-of          ; 2 cases
                    atomic-distinct ; empty
                    compound        ; cons
                    ref             ; Solid
                    self-ref)       ; ListOfSolid

(define (fn-for-los l)
  (cond [(empty? l) (...)]
        [else
         (... (fn-for-solid (first l))
              (fn-for-los (rest l)))]))


;;
;; Design a function called count-larger that takes a ListOfSolid and a
;; number and produces the number of solids in the list whose volume
;; is >= the given number.
;; Reminder:  the volume of a rectangular solid is given by:
;;    volume = width * height * depth
;;
(@htdf get-volume)
(@signature Solid -> Number)

(@template Solid)


(check-expect (get-volume SLD1) 24)
(check-expect (get-volume SLD2) 15.18)


(define (get-volume s)
  (* (solid-w s)
       (solid-h s)
       (solid-d s)))


;;;
(@htdf count-larger)
(@signature ListOfSolid Number -> Natural)



(check-expect (count-larger LOS0 10) 0)
(check-expect (count-larger LOS1 10) 1)
(check-expect (count-larger LOS1 30) 0)
(check-expect (count-larger LOS2 1) 3)
(check-expect (count-larger LOS2 1.1) 2)
(check-expect (count-larger LOS2 10) 1)


(@template ListOfSolid)

(define (count-larger l num)
  (cond [(empty? l) 0]
        [else
         (if (>= (get-volume (first l)) num)
             (+ 1 (count-larger (rest l) num))
              (count-larger (rest l) num))]))








