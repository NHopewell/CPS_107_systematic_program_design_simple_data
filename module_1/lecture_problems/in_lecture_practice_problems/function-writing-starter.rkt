;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname function-writing-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment bank/bsl-p15)
(@cwl nicholashopewell@gmail.com)

(@problem 1)
;; Write a function that consumes two numbers and produces the larger
;; of the two.

(define (get_largest num_one num_two)
  (if (> num_one num_two)
      num_one
      num_two))

(get_largest 5 10)
(get_largest 11 10)
