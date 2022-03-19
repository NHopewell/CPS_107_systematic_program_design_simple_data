;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m01-functions-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require spd/tags)


(@assignment lectures/m01-functions);Do not edit or remove this tag

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


;;
;; Already we can start to build up complex results, such as:
;;

(above (circle 40 "solid" "red")         
       (circle 40 "solid" "yellow")
       (circle 40 "solid" "green"))





(@problem 1)
;; 
;; Write a function that will help eliminate the
;; redundancy in the following expressions:
;; 

(* 3.14 (sqr 3))
(* 3.14 (sqr 6))
(* 3.14 (sqr 2.5))


(define (pi_root num)
  (* 3.14 (sqr num)))



(@problem 2)
;; 
;; Consider this function:
;;

(define (silly x)
  (* 2 (sqr x)))

;;
;; Write out the step-by-step evaluation of: 
;;
(silly (* 1 3))

(silly 3)

(* 2 (sqr 3))

(* 2 9)

18




