;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname odd-from-n-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment bank/naturals-p3)
(@cwl nicholashopewell@gmail.com)

(@problem 1)
;; Design a function called odd-from-n that consumes a natural number n, and 
;; produces a list of all the odd numbers from n down to 1. 
;; 
;; Note that there is a primitive function, odd?, that produces true
;; if a natural number is odd.
 

(@htdf odd-from-n)
(@template Natural)

#; 
(define (fn-for-natural n)
  (cond [(zero? n)(...)]
        [else
         (... n
              (fn-for-natural (sub1 n)))]))


(check-expect (odd-from-n 6) (cons 5 (cons 3 (cons 1 empty))))
(check-expect (odd-from-n 4) (cons 3 (cons 1 empty)))

(define (odd-from-n n)
  (cond [(zero? n) empty]
        [else
         (if (odd? n)
             (cons n (odd-from-n (- n 1)))
             (odd-from-n (- n 1)))]))