;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname spd1-f-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/exl/spd1-f/spd1-f-p5)

(@cwl nicholashopewell@gmail.com)   ;replace ??? with your email address
;            ;as you have done for problem sets

(@problem 1) ;this is actually problem 6 - DO NOT EDIT OR DELETE THIS LINE!

;; Find and repair all the errors in the designs of the following functions.
;; There are no errors in the data definition for Shape, so solutions that
;; give changes to the data defintion will receive no marks.  All the errors
;; are in the design of the two functions shape->image and next.  Also
;; remember than when you fix a bug in code your goal is to make the minimal
;; change that fixes the bug.

(define DELTA 2)

(@htdd Shape)
(define-struct shape (type width height direction))

;;Shape is (make-shape String Number Number String)
;; interp. A shape that has:
;;    a type of either "ellipse" or "rectangle"
;;    a width height in pixels
;;    a direction in which it gets larger
;;       "x" means it gets wider (but not taller)
;;       "y" means it gets taller (but not wider)
(define S1 (make-shape "ellipse" 20 20 "y"))
(define S2 (make-shape "rectangle" 30 10 "x"))

(@dd-template-rules compound)

(define (fn-for-shape s)
  (... (shape-type s)
       (shape-width s)
       (shape-height s)
       (shape-direction s)))


(@htdf shape->image)
(@signature Shape -> Image)
;; produce an image of the shape
(check-expect (shape->image S1) (ellipse 20 20 "solid" "blue"))
(check-expect (shape->image S2) (rectangle 30 10 "solid" "blue"))

;(define (shape->image s) empty-image) ; stub

(@template Shape)

(define (shape->image s)
  (if (string=? (shape-type s) "ellipse")
      (ellipse (shape-width s) (shape-height s) "solid" "blue")
      (rectangle (shape-width s) (shape-height  s) "solid" "blue")))



;(define S1 (make-shape "ellipse" 20 20 "y"))
;(define S2 (make-shape "rectangle" 30 10 "x"))


(@htdf next)
(@signature Shape -> Shape)
;; produce a shape grown by DELTA in the direction it gets larger
(check-expect (next S1) (make-shape "ellipse" 20 22 "y"))
(check-expect (next S2) (make-shape "rectangle" 32 10 "x"))

;(define (next s) s) ; stub

(@template Shape)

(define (next s)
  (make-shape (shape-type s)
              (if (string=? (shape-direction s) "x")
                  (+ (shape-width s) DELTA)
                  (shape-width s))
              (if (string=? (shape-direction s) "y")
                  (+ (shape-height s) DELTA)
                  (shape-height s))
              (shape-direction s)))
