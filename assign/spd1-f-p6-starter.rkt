;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname spd1-f-p6-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/exl/spd1-f/spd1-f-p6)

(@cwl nicholashopewell@gmail.com)   ;replace ??? with your email address
;            ;as you have done for problem sets

(@problem 1) ;this is actually problem 7 - DO NOT EDIT OR DELETE THIS LINE!

;; In each of the two parts of this problem (Part A and Part B) you will be
;; given a short description of problem domain information.  You need to
;; determine what form of data definition is most appropriate to
;; representing that information.
;;
;; In each part of the problem you must:
;;   - first identify how many data definitions are required to represent 
;;     the problem domain information (1 or 2)
;;   - select the form of those data definitions (from the list given)
;;   - explain very concisely why you made that choice
;;
;; NOTE that if you identify that 1 data definition is needed then you must
;;      only select one form of definition.  (If you select more than one
;;      form when you identified only 1 data definition you will lose all
;;      marks for that part of the problem.)
;; NOTE that if you identify that 2 data definitions are needed, then the
;;      order that you put them in will not affect your grade.


;; Part A:
;;
;; A driver's licence class in British Columbia.  BC defines the following
;; classes of drivers licence:
;;   - class 1
;;   - class 2
;;   - class 3
;;   - class 4 restricted
;;   - class 4 unrestricted
;;   - class 5
;;   - class 6
;;   - class 7L
;;   - class 7
;;   - class 8L
;;   - class 8
;;
;; 
;; How many data definitions?

(define NUMBER-OF-DDS-FOR-PART-A 1) ;<<<replace the 0 with 1 or 2

;;
;; Replace the ??? in the definition's value with the FIRST data definition
;; form in the list below that is correct
;;

(define FORM-OF-FIRST-DD-FOR-PART-A "enumeration")
;; "self-referential"
;; "compound"
;; "enumeration"
;; "itemization"
;; "simple atomic"

;; If you identified 1 data definition was needed then skip to part B.
;; If you identified 2 data definitions replace the ??? with the FIRST
;; data definition form in the list below that is correct.

(define FORM-OF-SECOND-DD-FOR-PART-A "???")
;; "self-referential"
;; "compound"
;; "enumeration"
;; "itemization"
;; "simple atomic"

;; Explain in one comment line (not longer than 80 characters) why you
;; made your choice.
;; 
;; This is a simple enumeration because drivers licenses are categorical data
;; which can be described as 1 of N possible categories AND NOTHING ELSE.
;; We could not have a random Class 9 license because that falls outside
;; of the fixed possibilities defined by the problem. 


;; Part B:
;;
;; A shopping list, with the name and number to buy of each item
;;
;; 

(define NUMBER-OF-DDS-FOR-PART-B 2) ;<<<replace the 0 with 1 or 2

;;
;; Replace the "???" string with the FIRST data definition form in the
;; list below that is correct.  You must replace "???" with a string.
;;

(define FORM-OF-FIRST-DD-FOR-PART-B "self-referential")
;; "self-referential"
;; "compound"
;; "enumeration"
;; "itemization"
;; "simple atomic"


;; If you identified 1 data definition was needed then skip to part B.
;; If you identified 2 data definitions replace the string "???" with
;; the FIRST data definition form in the list below that is correct.
;; You must replace "???" with a string.

(define FORM-OF-SECOND-DD-FOR-PART-B "compound")
;; "self-referential"
;; "compound"
;; "enumeration"
;; "itemization"
;; "simple atomic"


;;Explain
;; A shopping list is a self-referential data type because the
;; number of items on the list is arbitary (we do not know how
;; many). And each item in the list is compound data as it is
;; comporised of two parts which go together: the item name and #

