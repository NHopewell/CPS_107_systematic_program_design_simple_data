;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m02-grade-standing-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment lectures/m02-grade-standing)

(@cwl nicholashopewell@gmail.com)

;;
;; YOU MUST CONSULT THE m02-grade-standing-documents.rkt
;; starter file which has documents you will need.  But do all your
;; actual work in this starter file.
;;
;; We want to design a program to operate on submitted grades. For now 
;; JUST FOCUS ON THE % GRADE AND STANDING.  AFTER designing a representation
;; for this information, you must design two functions:
;;
;;  - A fn that consumes grade/standing and produces true if
;;    the grade/standing is >= 90.  Call this function excellent?
;;
;;  - A fn that consumes grade/standing and produces strings
;;    like  "90%"  "75%" "P" "F". Call this function grade->string


(@problem 1)
;; Data definition goes here:
(@htdd GradeStanding)
; interp: a students grade in a course
; - from 0 to 100
; their standing can be one of
; - H, P, F, or T

; Itemization with real numbers and chars
(@dd-template-rules one-of
                    atomic-non-distinct  ; 0 - 100
                    atomic-distinct      ; H P F or T
                    atomic-distinct
                    atomic-distinct
                    atomic-distinct)

(define (fun-for-grade-standing g)
  (cond [(number? g) (... g)]
        [(string=? g "H")(...)]
        [(string=? g "P")(...)]
        [(string=? g "F")(...)]
        [else (...)]))                     ; final conda = else clause


(@htdf excellent?)
(@signature GradeStanding -> Boolean)

(check-expect (excellent? 60) false)
(check-expect (excellent? 90) true)
(check-expect (excellent? 98) true)
(check-expect (excellent? "H") false)
(check-expect (excellent? "P") false)
(check-expect (excellent? "F") false)
(check-expect (excellent? "T") false)


; (define (excellent? g) false)       -> this is the stub

(@template GradeStanding)

(define (excellent? g)
  (cond [(number? g) (>= g 90)]
        [(string=? g "H") false]
        [(string=? g "P") false]
        [(string=? g "F") false]
        [else false]))                   ; final conda = else clause


(@problem 2)

(@htdf grade->string)
(@signature GradeStanding -> String)

(check-expect (grade->string 60) "60%")
(check-expect (grade->string 90) "90%")
(check-expect (grade->string 98) "98%")
(check-expect (grade->string "H") "H")
(check-expect (grade->string "P") "P")
(check-expect (grade->string "F") "F")
(check-expect (grade->string "T") "T")

; (define (grade->string g) "hello")      ;  -> this is the stub
(@template GradeStanding)

(define (grade->string g)
  (cond [(number? g) (string-append (number->string g) "%")]
        [else g]))