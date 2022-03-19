;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname lab-06-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment labs/lab-06)

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

(@problem 1)
;; DATA DEFINITIONS ===============
;; Now complete the design by adding the interpretation,
;; examples (including the one at the top of this page),
;; template, appropriate tags, and additional data definitions
;; if needed. Once you are finished your design, move on to the next page.


(@htdd SentenceTree ListOfSentenceTree)
(define-struct branch (sentence))
(define-struct stree (prefix subs))
;; SentenceTree is one of
;;   - (make-branch String)
;;   - (make-stree String ListOfSentenceTree)
;; interp.
;; an arbitrary-arity tree of sentences
;; single branch sentences have a string of words
;; strees have a starting branch and a list of subbranches

;; ListOfSentenceTree is one of:
;;  - empty
;;  - (cons SentenceTree ListOfSentenceTree)
;; interp. a list of SentenceTrees



  
(define B2 (make-branch "JOKING ABOUT JEALOUSY"))


(define B4 (make-branch "YOU REALLY MEAN IT"))


(define B6 (make-branch "IN A BACK TO SCHOOL SPECIAL ABOUT MONO"))
(define B7 (make-branch "PERCHED ON THE TIP OF A SINKING SHIP"))
(define STWA (make-stree "WE ARE" (list B6 B7)))

(define STLIKE (make-stree "LIKE" (list B4 STWA)))


(define B9 (make-branch "FREEZE TIME"))
(define B10 (make-branch "MY FAVOURITE SONG ON REPEAT"))
(define STTO (make-stree "T0" (list B9 B10)))


(define ST1 (make-stree "KISS ME" (list B2 STLIKE STTO)))

(define LOST1 (list STTO STWA))


#;
(define (fn-for-sentencetree st)
  (cond [(branch? st)
         (... (branch-sentence st))]
        [(stree? st)
         (... (stree-prefix st)
              (fn-for-lost (stree-subs st)))]))
#; 
(define (fn-for-lost lost)
  (cond [(empty? lost) (...)]
        [else
         (... (fn-for-sentencetree (first lost))
              (fn-for-lost (rest lost)))]))





;; FUNCTIONS ======================

;; 

(@problem 2)

(@htdf sentence-count--stree sentence-count--lost)
(@signature SentenceTree -> Integer)
(@signature ListOfSentenceTree -> Integer)



(check-expect (sentence-count--stree B2) 1)
(check-expect (sentence-count--stree STTO) 3)
(check-expect (sentence-count--lost empty) 0)
(check-expect (sentence-count--lost LOST1) 6)


(@template SentenceTree)

(define (sentence-count--stree st)
  (cond [(branch? st)
         1]
        [(stree? st)
         (+ 1 (sentence-count--lost (stree-subs st)))]))


(@template ListOfSentenceTree)
  
(define (sentence-count--lost lost)
  (cond [(empty? lost) 0]
        [else
         (+ (sentence-count--stree (first lost))
              (sentence-count--lost (rest lost)))]))
  



  
  

(@problem 3)
(@htdf render--stree render--lost)
(@signature SentenceTree -> Image)
(@signature ListOfSentenceTree -> Image)



(define TEXT-SIZE 18)
(define TEXT-COLOUR "black")

(define empty-img (rectangle 1 1 "solid" "white"))



(@template SentenceTree)

(define (render--stree st)
  (cond 
    [(branch? st)
     (text (branch-sentence st) TEXT-SIZE TEXT-COLOUR)]
    [(stree? st)
     (beside (text (stree-prefix st) TEXT-SIZE TEXT-COLOUR)
             (render--lost (stree-subs st)))]))



(@template ListOfSentenceTree)

(define (render--lost lost)
  (cond [(empty? lost) empty-img]
        [else
          (above/align "left" (render--stree (first lost))
   	           (render--lost (rest lost)))]))


(define rendered-tree1 (render--stree ST1))

(define rendered-tree2 (render--stree STTO))
(define rendered-tree3 (render--lost LOST1))


(check-expect (render--lost empty) empty-img)
(check-expect (render--lost LOST1) rendered-tree3)
(check-expect (render--stree ST1) rendered-tree1)
(check-expect (render--stree STTO) rendered-tree2)



