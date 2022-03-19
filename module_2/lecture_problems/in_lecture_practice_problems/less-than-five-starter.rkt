;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname less-than-five-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment bank/htdf-p2)
(@cwl nicholashopewell@gmail.com)

(@problem 1)
;; DESIGN a function that consumes a string and determines whether its length is
;; less than 5.  Follow the HtDF recipe and leave behind commented out versions 
;; of the stub and template.

(@htdf less-than-five?)
(@signature String -> Boolean)

(check-expect (less-than-five? "HELLO") false)
(check-expect (less-than-five? "BYE") true)
(check-expect (less-than-five? "ELEPHANT") false)



; (define (less-than-five? str) false)   -> stub

(@template String)
;(define (less-than-five? str)           -> template
;  (... str))

(define (less-than-five? str)
  (< (string-length str) 5))



