;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab-01-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Intro Lab
(require spd/tags)
(require 2htdp/image)

(@assignment labs/lab-01)

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

;; *****************************************************************************
;; NOTE:
;;  For lecture starters we want you to submit to handin several times during
;;  the lecture.  Submit your file even if pressing the "Check Syntax" button
;;  produces an error.  For lecture we want to see the progression of your
;;  work.
;;
;;  But for problem sets and labs you should not submit your file if Check
;;  Syntax produces an error.  Fix the error first, then submit.
;; *****************************************************************************


(@problem 1)
;; Complete Problem 1 below using the following constants

(define PREFIX "hello")
(define SUFFIX "world")

(string-append PREFIX "_" SUFFIX)





(@problem 2)
;; Complete Problem 2 below using the following constants


(define STR "helloworld")
(define i 5)

(string-append (substring STR 0 i) "_" (substring STR i (string-length STR)))






(@problem 3)
;; Complete Problem 3 below using the following constant

(define CAT
  (bitmap/url
   "https://edx-course-spdx-kiczales.s3.amazonaws.com/HTC/lab/cat.png"))

(* (image-height CAT) (image-width CAT))






(@problem 4)
;; Complete Problem 4 below using CAT as defined above


(if (> (image-height CAT) (image-width CAT))
    "tall"
    (if (> (image-width CAT) (image-height CAT))
        "wide"
        "square"))




(@problem 5)
;; Complete Problem 5 below using STR as defined above


;Write an expression that computes whether the first character
;in the value of STR is "h". If you do not change the constant
;definition for STR in the starter file, the expected result is true.

(string=? (string-ith STR 0) "h")

