;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname m06-regions-all-with-color-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require spd/tags)

(@assignment lectures/m06-regions-all-with-color)

(@cwl nicholashopewell@gmail.com) ;replace ??? with your cwl

;;
;; Region and ListOfRegion data definitions provided. 
;;
(@problem 1)
(@htdd Region ListOfRegion)
(define-struct single (label weight color))
(define-struct group (color subs))
;; Region is one of:
;;  - (make-single String Natural Color)
;;  - (make-group Color ListOfRegion)
;; interp.
;;  an arbitrary-arity tree of regions
;;  single regions have label, weight and color
;;  groups have a color and a list of sub-regions
;;
;;  weight is a unitless number indicating how much weight
;;  the given single region contributes to whole tree

;; ListOfRegion is one of:
;;  - empty
;;  - (cons Region ListOfRegion)
;; interp. a list of regions

;; All the Ss and Gs are Regions
(define S1 (make-single "one" 20 "red"))
(define S2 (make-single "two" 40 "blue"))
(define S3 (make-single "three" 60 "orange"))
(define S4 (make-single "four" 30 "black"))
(define S5 (make-single "five" 50 "purple"))
(define S6 (make-single "six" 80 "yellow"))
(define S7 (make-single "seven" 80 "yellow"))

(define G1 (make-group "red"  (list S1 S2 S3)))
(define G2 (make-group "blue" (list G1 S4)))
(define G3 (make-group "orange" (list S5 S6)))
(define G4 (make-group "black" (list G2 G3)))
(define G5 (make-group "yellow" (list S1 S6 S7)))

(define LORE empty)
(define LOR123 (list S1 S2 S3))
(define LOR167 (list S1 S6 S7))
#;
(define (fn-for-region r)
  (cond [(single? r)
         (... (single-label r)
              (single-weight r)
              (single-color r))]
        [(group? r)
         (... (group-color r)
              (fn-for-lor (group-subs r)))]))
#; 
(define (fn-for-lor lor)
  (cond [(empty? lor) (...)]
        [else
         (... (fn-for-region (first lor))
              (fn-for-lor (rest lor)))]))



;; Design a function that consumes a color and a region and
;; produces a list of all contained regions with the given color.
;; Include the root if it has that color.   Be sure to
;; follow the structure above, where the @htdf tag names both
;; functions, the signatures are grouped, single purpose, tests
;; are grouped, and each function has its own template tag.



(@htdf regions-with-colour--region regions-with-colour-lor)

(@signature Region String -> Region)
(@signature ListOfRegion String -> ListOfRegion)


(check-expect (regions-with-colour--region S7 "yellow") S7)
(check-expect (regions-with-colour-lor LORE "yellow") empty)
(check-expect (regions-with-colour-lor LOR167 "yellow") (list S6 S7))


(@template Region)

(define (regions-with-colour--region r colour)
  (cond [(single? r)
         (if (string=? (single-color r) colour)
             r
             false)]
        [(group? r)
         (regions-with-colour-lor (group-subs r) colour)]))


(@template ListOfRegion)

(define (regions-with-colour-lor lor colour)
  (cond [(empty? lor) empty]
        [else
         (if (not (false? (regions-with-colour--region (first lor) colour)))
             (cons (regions-with-colour--region (first lor) colour)
                   (regions-with-colour-lor (rest lor) colour))
             (regions-with-colour-lor (rest lor) colour))
             ]))







