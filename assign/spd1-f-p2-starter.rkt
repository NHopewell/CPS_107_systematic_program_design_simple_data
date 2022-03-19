;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname spd1-f-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/exl/spd1-f/spd1-f-p2)

(@cwl nicholashopewell@gmail.com)   ;replace ??? with your email address
;            ;as you have done for problem sets


(@problem 1) ;This is actually exam problem 2 - DO NOT EDIT OR DELETE THIS LINE!


;; 
;; For the following type comment, complete the @dd-template-rules tag and
;; template function definition.  Ensure that you include all required guards,
;; you may simplify cond questions or not at your choice.

(@htdd DeliveryStatus)
;; DeliveryStatus is one of:
;; - "not shipped"
;; - Natural
;; - "delivered"
;; - "lost"
;; interp. The status of a package delivery. If Natural is the remaining
;;         days till delivery. 0 means to be delivered today.
(@dd-template-rules one-of              ; 4 cases
                    atomic-distinct     ; "not shipped"
                    atomic-non-distinct ; Natural
                    atomic-distinct     ; "delivered"
                    atomic-distinct)    ; "lost"

(define (fn-for-delivery-status ds)
  (cond [(and (string? ds) (string=? ds "not shipped"))
         (...)]
        [(number? ds)
         (... ds)]
        [(and (string? ds) (string=? ds "delivered"))
         (...)]
        [else
         (...)]))

(define DS1 "not shipped")
(define DS2 1)  ;will be delivered tomorrow

;;
;; Given the data definition for DeliveryStatus above, design a function called
;; delivered-before-tomorrow? that consumes a DeliveryStatus and returns true if
;; the package has been delivered or is expected to be delivered before the end
;; of day tomorrow.  Be sure to include all HtDF design elements.  Also be sure
;; to follow the rules that require keeping the cond structure of the template
;; intact.
;;
(@htdf delivered-before-tomorrow?)
(@signature DeliveryStatus -> Boolean)

(check-expect (delivered-before-tomorrow? 2) false)
(check-expect (delivered-before-tomorrow? 1) true)
(check-expect (delivered-before-tomorrow? 0) true)
(check-expect (delivered-before-tomorrow? "delivered") true)
(check-expect (delivered-before-tomorrow? "not shipped") false)
(check-expect (delivered-before-tomorrow? "lost") false)
 
(@template DeliveryStatus)

(define (delivered-before-tomorrow? ds)
  (cond [(and (string? ds) (string=? ds "not shipped"))
         false]
        [(number? ds)
         (if (or (= 1 ds) (= 0 ds))
             true
             false)]
        [(and (string? ds) (string=? ds "delivered"))
         true]
        [else
         false]))





