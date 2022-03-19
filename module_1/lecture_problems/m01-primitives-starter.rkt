;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m01-primitives-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require spd/tags)


(@assignment lectures/m01-primitives);Do not edit or remove this tag

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
;; Remember that the equation for the lengths of the sides in a
;; right triangle is:
;; 
;;   a^2 + b^2 = c^2
;; 
;;   c = sqrt ( a^2  +  b ^2) 
;; 
;; Write an expression to compute the length of side c when a is 3
;; and b is 4.  The name of the primitive that computes the square
;; root of a number is sqrt.
;;

(sqrt (+ (sqr 3) (sqr 4)))





(@problem 2)
;; 
;; The background for the Canadian Flag (without the maple leaf) is two
;; red bands on either side of a white band. Write an expression to produce that
;; background. If you want to get the details right, officially the overall flag
;; has proportions 1:2, and the band widths are in the ratio 1:2:1.
;;

(beside
 (rectangle 50 120 "solid" "red")
 (rectangle 100 120 "solid" "white")
 (rectangle 50 120 "solid" "red"))


;; modular way
(define red_band
  (rectangle 50 120 "solid" "red"))

(define white_band
  (rectangle 100 120 "solid" "white"))

(define canadian_flag
  (beside red_band white_band red_band))

canadian_flag
