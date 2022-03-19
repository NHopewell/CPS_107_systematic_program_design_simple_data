;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname draw_image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)

(define logo
  (overlay (rotate 15 (text/font "KitKat" 60 "red"
                                 #f 'modern 'italic 'normal #f))
           (rotate 16 (text/font "KitKat" 60 "black"
                                 #f 'modern 'italic 'normal #f))
           (ellipse 260 170 "solid" "white")
           (ellipse 270 180 "solid" "red")
           (ellipse 280 190 "solid" "white")
          ))


(define candy_wrapper_middle
  (overlay (rectangle 387 217 "solid" "red")
           (rectangle 400 220 "solid" "black")))


(define candy_wrapper_ends
  (overlay (rectangle 28 218 "solid" "red")
           (rectangle 30 220 "solid" "black")))


(define candy_wrapper
  (beside candy_wrapper_ends candy_wrapper_middle candy_wrapper_ends))


(define kit_kat_bar
  (overlay logo candy_wrapper))


kit_kat_bar