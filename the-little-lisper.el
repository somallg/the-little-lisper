;;; the-little-lisper.el --- Code from The Little Lisper book

;; Authors: somallg

;; URL: https://github.com/somallg/the-little-lisper
;; Created: Mon Jun 11 2018
;; Keywords: little lisper
;; Version: 1.0.0
;; Package-Requires: ((emacs "24"))

;;; Commentary:

;;  Provides functions, simple tests code
;;  for The Little Lisper book.

;;; Code:

;; chapter-01
;; atom?
(defun atom? (x)
  (not (listp x)))

;; null?
(defun null? (x)
  (null x))

;; eq?
(defun eq? (a1 a2)
  (eq a1 a2))

;; chapter-02
;; lat?
(defun lat? (l)
  (cond
   ((null? l) t)
   ((atom (car l)) (lat? (cdr l)))
   (t nil)))

;; member?
(defun member? (a lat)
  (cond
   ((null? lat) nil)
   (t (or
       (eq? a (car lat))
       (member? a (cdr lat))))))

;; exercise 2.5 - nonlat?
(defun nonlat? (lat)
  (cond
   ((null? lat) t)
   ((atom? (car lat)) nil)
   ((null? (car lat)) nil)
   (t (nonlat? (cdr lat)))))

;; exercise 2.6 - member-cake?
(defun member-cake? (lat)
  (cond
   ((null? lat) nil)
   ((eq? 'cake (car lat)) t)
   (t (member-cake? (cdr lat)))))

;; Exercise 2.7 - member2?
(defun member2? (a lat)
  (cond
   ((null? lat) nil)
   (t (or
       (member2? a (cdr lat))
       (eq? a (car lat))))))

;; Exercise 2.10 member-twice?
(defun member-twice? (a lat)
  (cond
   ((null? lat) nil)
   ((and (eq? a (car lat))
         (member? a (cdr lat)) t))
   (t (member-twice? a (cdr lat)))))

(provide 'the-little-lisper)

;;; the-little-lisper.el ends here
