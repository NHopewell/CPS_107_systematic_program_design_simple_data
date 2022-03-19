;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname spd1-f-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/exl/spd1-f/spd1-f-p1)

(@cwl nicholashopewell@gmail.com)   ;replace ??? with your email address
;            ;as you have done for problem sets

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!


;;
;; Design a function called stack that takes two strings and returns an image
;; with the image of the shorter of the two strings displayed above the
;; image of the longer of the two strings.  If the two strings have the same
;; length, the image of the first should be above the image of the second.
;; Use the provided constants as values for the text size and text colour.
;; Ensure that you follow the complete htdf recipe and include every required
;; element.  Also include a commented out copy of your function template.
;;

(define TEXT-SIZE 30)
(define TEXT-COLOUR "red")

(@htdf stack)
(@signature String String -> Image)
; return an image of the shorter string stacked ontop of the longer
; if same length, first string should be on top

(check-expect (stack "Nick" "Hopewell")
              (above (text "Nick" TEXT-SIZE TEXT-COLOUR)
                     (text "Hopewell" TEXT-SIZE TEXT-COLOUR)))

(check-expect (stack "Hopewell" "Nick")
              (above (text "Nick" TEXT-SIZE TEXT-COLOUR)
                     (text "Hopewell" TEXT-SIZE TEXT-COLOUR)))

(check-expect (stack "str1" "str2")
              (above (text "str1" TEXT-SIZE TEXT-COLOUR)
                     (text "str2" TEXT-SIZE TEXT-COLOUR)))

(@template String)

(define (stack str1 str2)
  (if (< (string-length str2) (string-length str1))
      (above (text str2 TEXT-SIZE TEXT-COLOUR)
             (text str1 TEXT-SIZE TEXT-COLOUR))
      (above (text str1 TEXT-SIZE TEXT-COLOUR)
             (text str2 TEXT-SIZE TEXT-COLOUR))))

