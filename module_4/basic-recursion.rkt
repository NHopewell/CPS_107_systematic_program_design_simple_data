;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m04-los-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment lectures/m04-los)

(@cwl nicholashopewell@gmail.com) ;replace ??? with your cwl

(@problem 1)

(@htdd ListOfString)
;; ListOfString is one of:
;;  - empty
;;  - (cons String ListOfString)
;; interp. a list of strings
(define LOS1 empty)
(define LOS2 (cons "Canucks" empty))
(define LOS3 (cons "Leafs" (cons "Canucks" empty)))
(define LOS4 (cons "Canadiens" (cons "Leafs" (cons "Canucks" empty))))

(@dd-template-rules one-of             ;2 cases
                    atomic-distinct    ;empty
                    compound           ;(cons String ListOfString)
                    self-ref)          ;(rest los) is ListOfString


(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)
              (fn-for-los (rest los)))]))

#|
PROBLEM:

Design a function that determines whether "Canucks" appears in a 
list of strings.
|#
(@htdf contains-canucks?)
(@signature ListOfString -> Boolean)

(define L1 empty)
(define L2 (cons "Leafs" (cons "Red Wings" empty)))
(define L3 (cons "Canucks" (cons "Leafs" (cons "Red Wings" empty))))
(define L4 (cons "Leafs" (cons "Canucks" (cons "Red Wings" empty))))

(check-expect (contains-canucks? L1) false)
(check-expect (contains-canucks? L2) false)
(check-expect (contains-canucks? L3) true)
(check-expect (contains-canucks? L4) true)

(@template ListOfString)

(define (contains-canucks? los)
  (cond [(empty? los) false]
        [else
         (if (string=? (first los) "Canucks")
             true
              (contains-canucks? (rest los)))]))

