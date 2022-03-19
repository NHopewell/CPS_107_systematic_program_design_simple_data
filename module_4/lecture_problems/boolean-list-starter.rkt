;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boolean-list-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment bank/self-ref-p3)
(@cwl nicholashopewell@gmail.com)

;; =================
;; Data definitions:

(@problem 1)
;; Design a data definition to represent a list of booleans.
;; Call it ListOfBoolean. 

(@htdd ListOfBoolean)
;; ListOfBoolean is one of
;; - empty
;; - (cons Boolean ListOfBoolean)
;; interp. a list of booleans
(define LOB1 empty)
(define LOB2 (cons true empty))
(define LOB3 (cons true (cons false empty)))
(define LOB4 (cons true (cons true (cons false empty))))

(@dd-template-rules one-of               ;2 cases
                    atomic-distinct      ;empty
                    compound             ;(cons Boolean ListOfBoolean)
                    self-ref)            ;(rest lon) is ListOfNumber

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))



;; =================
;; Functions:

(@problem 2)
;; Design a function that consumes a list of boolean values and produces true 
;; if every value in the list is true. If the list is empty, your function 
;; should also produce true. Call it all-true?
(@htdf all-true?)
(@signature ListOfBoolean -> Boolean)

(check-expect (all-true? LOB1) true)
(check-expect (all-true? LOB2) true)
(check-expect (all-true? LOB3) false)
(check-expect (all-true? LOB4) false)


;(define (all-true? lob) false)  ; stub

(define (all-true? lob)
  (cond [(empty? lob) true]
        [else
         (if (false? (first lob))
             false
             (all-true? (rest lob)))]))
