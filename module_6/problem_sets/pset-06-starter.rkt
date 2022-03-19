;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname pset-06-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.
;; YOUR CWLs WILL BE SUFFICIENT TO IDENTIFY YOU AND, IF YOU HAVE ONE, YOUR 
;; PARTNER.
;;
(require spd/tags)

(@assignment psets/pset-06); Do not edit or remove this tag

;; If you are:
;;   - A 110 or 107 student replace the first set of '???'s with your cwl.
;;     For problem sets, If you have a partner, please replace the second
;;     set of '???'s with their cwl.  Remember this, it is what you will
;;     do with these @cwl annotations for the whole course.
;;   - A UBC Extended Learning student, replace the first set of ??? with
;;     your email address as confirmed in the email you received from
;;     extended learning.  The handin password is also in that email.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   
(@cwl nicholashopewell@gmail.com)


(@problem 1)
;; Below is the start of a data definition called Course that represents limited
;; information about UBC courses.  Below there are only two example data.  
;; Please complete this definition by adding constants C110, C213, C313 and C317
;; which are representations of the descendent tree for 110, 213, 313 and 317.  
;; You can find the information you need at
;;  https://cs110.students.cs.ubc.ca/psets/pset-06-image.png
;;
;; NOTE 1: Use the information in the image above, rather than any other source.
;;         We are significantly simplying the information.
;;
;; NOTE 2: Do this very carefully, the autograder wants to see correct results
;;         from the functions you design to operate on this data.
;;
;; NOTE 3: The tree you will make for C110 will be a bit odd because 210 has 110
;;         as a pre-req, and both 213 and 221 have 210 as a pre-req, and313 has
;;         213 AND 221 as a pre-req, and 317 has 213 AND 221 as a pre-req. As a
;;         result, 313 and 317 will both show up twice in your descendent tree
;          for C110. This is okay for this problem set.
;; NOTE 4: Expect this step of the problem set to take you some time.


(@htdd Course ListOfCourse)
(define-struct course (number credits dependents))
;; Course is (make-course Natural Natural ListOfCourse)
;; interp. a course with a course number,
;;         the number of credits the course is worth, and a
;;         list of courses that list this course as a direct pre-requisite

;; ListOfCourse is one of:
;; - empty
;; - (cons Course ListOfCourse)
;; interp. a list of courses

(define LOC0 empty)
(define C100 (make-course 100 3 LOC0))

;; adding constants C110, C213, C313 and C317
;; which are representations of the descendent tree for 110, 213, 313 and 317.

(define C110 (make-course 110 4 LOC0))        ;; < ---

(define C121 (make-course 121 4 LOC0))
(define LOC1 (cons C110 empty))
(define C210 (make-course 210 4 LOC1))
(define LOC2 (cons C121 (cons C210 empty)))
(define C213 (make-course 213 4 LOC2))   ;; < ---

(define LOC3 (cons C210 empty))
(define C221 (make-course 221 4 LOC3))        ;; < ---

(define LOC4 (cons C213 (cons C221 empty)))
(define C313 (make-course 313 3 LOC4))        ;; < ---

(define C317 (make-course 317 3 LOC4))         ;; < ---


(define C322 (make-course 322 3 LOC0))
(define C320 (make-course 320 3 LOC0))
(define C319 (make-course 319 4 LOC0))

(define C314 (make-course 314 3 LOC0))
(define C312 (make-course 312 3 LOC0))
(define C311 (make-course 311 3 LOC0))

(define LOC10 (list C319))
(define C310 (make-course 310 4 LOC10))
(define C304 (make-course 304 3 LOC0))
(define C302 (make-course 302 3 LOC0))
(define C303 (make-course 303 3 LOC0))




(define C203 (make-course 203 3 LOC0))
(define C189 (make-course 189 1 LOC0))


#;
(define (fn-for-course c)
  (... (course-number c)
       (course-credits c)
       (fn-for-loc (course-dependents c))))
#;
(define (fn-for-loc loc)
  (cond [(empty? loc) (...)]
        [else
         (... (fn-for-course (first loc))
              (fn-for-loc (rest loc)))]))

(@problem 2)
;;
;; Design a function that produces the list of all the course numbers in the
;; course's tree including the given course's number.
;;
;; Your @htdf tag and the rest of the design MUST have the definition for
;; the function that takes Course as an argument first. The function that
;; operates on a list must be second.  Marks will only be rewarded for
;; solutions that order the design this way.
;;
(@htdf get-course-numbers)
(@signature Course -> ListOfNatural)

;; For list-courses
(append (cons 1 (cons 2 empty)) (cons 3 (cons 4 (cons 5 empty))))

(check-expect (get-course-numbers C100) (list 100))
(check-expect (get-course-numbers C213) (list 213 121 210 110))

(check-expect (list-courses LOC4)  (list 213 121 210 110 221 210 110))
(check-expect (list-courses LOC2)  (list 121 210 110))
(check-expect (list-courses empty) empty)



(@template Course)
(define (get-course-numbers c)
  (cons (course-number c)
       (list-courses (course-dependents c))))




(@htdf list-courses)
(@signature ListOfCourse -> ListOfNatural)

(@template ListOfCourse)
(define (list-courses loc)
  (cond [(empty? loc) empty]
        [else
         (append
          (get-course-numbers (first loc))
          (list-courses (rest loc)))]))


(@problem 3)
;;
;; Design a function that takes two arguments: a Course and a Natural, in that
;; order. It produces the list of courses in the tree that are worth that
;; many credits or more.
;;
;; Your @htdf tag and the rest of the design MUST have the definition for
;; the function that takes Course as an argument first. The function that
;; operates on a list must be second.  Marks will only be rewarded for
;; solutions that order the design this way.
;;

(check-expect (list-courses-by-credit C110 3) (list 110))
(check-expect (list-courses-by-credit C213 4) (list 213 121 210 110))
(check-expect (list-courses-by-credit C213 5)  empty)

(check-expect (next-courses empty 2) empty)
(check-expect (next-courses LOC2 2) (list 121 210 110))



(@htdf list-courses-by-credit)
(@signature Course Natural -> ListOfCourse)

 
(@template Course)

(define (list-courses-by-credit c cred)
  (if ( >= (course-credits c) cred)
      (cons (course-number c) (next-courses (course-dependents c) cred))
      (next-courses (course-dependents c) cred)))



(@htdf next-courses)
(@signature ListOfCourse Natural -> ListOfCourse)

(@template ListOfCourse)
(define (next-courses loc cred)
  (cond [(empty? loc) empty]
        [else
         (append (list-courses-by-credit (first loc) cred)
              (next-courses (rest loc) cred))]))




(@problem 4)
;;
;; Design a function that produces the largest course number in the tree.
;;
;; Your @htdf tag and the rest of the design MUST have the definition for
;; the function that takes Course as an argument first. The function that
;; operates on a list must be second.  Marks will only be rewarded for
;; solutions that order the design this way.
;;


(check-expect (largest-course C110) 110)
(check-expect (largest-course C213) 213)
(check-expect (largest-course C317) 317)
(check-expect (largest-in-list empty) 0)
(check-expect (largest-in-list LOC2) 210)



(@htdf largest-course)
(@signature Course -> Natural)

(@template Course)
(define (largest-course c)
  (max (course-number c)
       (largest-in-list (course-dependents c))))



(@htdf largest-in-list)
(@signature ListOfCourse -> Natural)


(@template ListOfCourse)
(define (largest-in-list loc)
  (cond [(empty? loc) 0]
        [else
         (max (largest-course (first loc))
              (largest-in-list (rest loc)))]))

(@problem 5)
;;
;; Design a function that takes two arguments: a Course and a Natural, in that
;; order. It produces the course in the tree with that course number. If it
;; can't find a course in the given tree with that course number, it signals
;; failure by producing false.
;;
;; Your @htdf tag and the rest of the design MUST have the definition for
;; the function that takes Course as an argument first. The function that
;; operates on a list must be second.  Marks will only be rewarded for
;; solutions that order the design this way.
;;

(check-expect (course-exists C110 110) C110)
(check-expect (course-exists C110 120) false)
(check-expect (course-exists C317 213) C213)
(check-expect (course-exists C317 419) false)

(check-expect (check-dependents-for-course empty 210) false)
(check-expect (check-dependents-for-course LOC2 210) C210)
(check-expect (check-dependents-for-course LOC2 710) false)

(@htdf course-exists)
(@signature Course Natural -> Course or false)


(@template Course)
(define (course-exists c num)
  (if (= (course-number c) num)
      c
      (check-dependents-for-course (course-dependents c) num)))


(@htdf check-dependents-for-course)
(@signature ListOfCourse Natural -> Course or false)


(@template ListOfCourse try-catch)
(define (check-dependents-for-course loc num)
  (cond [(empty? loc) false]
        [else
         (if ( not (false?
                   (course-exists (first loc) num)))
             (course-exists (first loc) num)
             (check-dependents-for-course
              (rest loc) num))]))

