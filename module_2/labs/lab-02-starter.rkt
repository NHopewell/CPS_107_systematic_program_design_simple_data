;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab-02-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment labs/lab-02)

;; If you are:
;;   - A 110 or 107 student replace the first set of '???'s with your cwl.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   - A UBC Extended Learning student, replace the first set of ??? with
;;     the your email address as confirmed in the email you received from
;;     extended learning.  The handin password is also in that email.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   
(@cwl nicholashopewell@gmail.com)

;; HtDF Lab, Problem 1

;; PROBLEM:
;;
;; Design a function called square? that consumes an image and determines 
;; whether the image's height is the same as the image's width.
(@problem 1)
(@htdf square?) ;!!!UNCOMMENT this line when you start on this function
(@signature Image -> Boolean)

(define S1 (square 20 "solid" "black"))
(define S2 (rectangle 20 10 "solid" "black"))

(check-expect (square? S1) true)
(check-expect (square? S2) false)

; (define (square? s) false)       ; this is the stub

(@template Image)

(define (square? s)
  (= (image-height s) (image-width s)))





;; HtDF Lab, Problem 2

;; PROBLEM:
;; 
;; Design a function named underline that consumes an image 
;; and produces that image underlined by a black line of the same width. 
;; 
;; 
;; For example, 
;; 
;;   (underline (circle 20 "solid" "green"))
;; 
;; should produce
;;
;;   (above (circle 20 "solid" "green")
;;          (rectangle 40 2 "solid" "black"))
(@problem 2)
(@htdf underline) ;!!!UNCOMMENT this line when you start on this function
(@signature Image -> Image)

(define S1_ (square 20 "solid" "black"))
(define S2_ (rectangle 20 10 "solid" "black"))

(define S1-underlined (above S1_
           (rectangle 40 2 "solid" "black")))
(define S2-underlined (above S2_
           (rectangle 40 2 "solid" "black")))

(check-expect (underline S1) S1-underlined)
(check-expect (underline S2) S2-underlined)

; (define (underline s) S1)       ; this is the stub

(@template Image)

(define (underline s)
  (above s
         (rectangle 40 2 "solid" "black")))



;; HtDF Lab, Problem 3

;; PROBLEM:
;; 
;; A (much too) simple scheme for pluralizing words in English is to add an 
;; s at the end unless the word already ends in s.
;; 
;; Design a function that consumes a string, and adds s to the end unless 
;; the string already ends in s.
(@problem 3)
(@htdf pluralize) ;!!!UNCOMMENT this line when you start on this function
(@signature String -> String)

(check-expect (pluralize "bike") "bikes")
(check-expect (pluralize "runners") "runners")
(check-expect (pluralize "s") "s")
(check-expect (pluralize "a") "as")
(check-expect (pluralize "") "s")

; (define (pluralize s) "word")

(@template String)

(define (pluralize s)
  (if (>= (string-length s) 1)
      (if (string=? (string-ith s (- (string-length s) 1)) "s")
          s
          (string-append s "s"))
      "s"))



;; HtDF Lab, Problem 4

;; PROBLEM:
;; 
;; Design a function called nth-char-equal? that consumes two strings 
;; and a natural and produces true if the strings both have length greater 
;; than n and have the same character at position n.
;; 
;; 
;; Note, the signature for such a function is:
;; 
;; (@signature String String Natural -> Boolean)
;; 
;; 
;; The tag and template for such a function are:
;; 
;; (@template String)
;; 
;; (define (nth-char-equal? s1 s2 n)
;;   (... s1 s2 n))
(@problem 4)
(@htdf nth-char-equal?) ;!!!UNCOMMENT this line when you start on this function
(@signature String String Natural -> Boolean)

(@template String)

(check-expect (nth-char-equal? "bikes" "bikes" 3) true)
(check-expect (nth-char-equal? "bikes" "yikes" 2) true)
(check-expect (nth-char-equal? "bikes" "tractors" 7) false)
(check-expect (nth-char-equal? "bikes" "trikes" 1) false)

;; (define (nth-char-equal? s1 s2 n)
;;   (... s1 s2 n))

(define (nth-char-equal? s1 s2 n)
  (if (and (<= n (string-length s1)) (<= n (string-length s2)))
      (if (string=? (string-ith s1 n) (string-ith s2 n))
          (and (> (string-length s1) n) (> (string-length s2) n))
          false)
      false))





