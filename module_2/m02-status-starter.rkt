;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m02-status-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

(require spd/tags)

(@assignment lectures/m02-status)

(@cwl nicholashopewell@gmail.com) ;replace ??? with your cwl

#|

;; Is this function correct?? (ignore the fact that it is commented out)

(define (can-vote? s)
  (= s 1))




;; How about now? Is it correct now?

(@htdf can-vote?)
(@signature Natural -> Boolean)
;; produces true if a person with given status is eligible to vote
(check-expect (can-vote? 0) false)
(check-expect (can-vote? 1) true)

(@template Natural)

(define (can-vote? s)
  (= s 1))


;; What's the problem?

|#
(@problem 1)

; We do not have any way to interpret what the numbers passed
; as actual paramters to can-vote? mean. The function should
; consume a pre-defined VotingStatus data type which has an
; interpretation along with it so we know how to formulate
; tests and the function body itself. We would use a VotingStatus
; template instead of a number.

(@htdd Status)
;; Status is one of: 
;;  - 0
;;  - 1
;; interp. the voting status of a person
;; 0 means they cannot vote (false)
;; 1 means they can vote (true)
;; <examples are redundant for enumerations>

(@dd-template-rules one-of)
#;
(define (fn-for-can-vote status)
  (... status))

(@htdf can-vote?)

(@signature Status -> Boolean)
;; produce the next highest letter grad (no change for A)

(check-expect (can-vote? 0) false)
(check-expect (can-vote? 1) true)


; (define (can-vote? status) false)       -> this is the stub

(@template Status)

(define (can-vote? status)
  (= status 1))
