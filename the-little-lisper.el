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

;; Chapter 01
;; atom?
(defun atom? (x)
  (not (listp x)))

;; null?
(defun null? (x)
  (null x))

;; eq?
(defun eq? (a1 a2)
  (eq a1 a2))

;; Chapter 02
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

;; Exercise 2.5 - nonlat?
(defun nonlat? (lat)
  (cond
   ((null? lat) t)
   ((atom? (car lat)) nil)
   ((null? (car lat)) nil)
   (t (nonlat? (cdr lat)))))

;; Exercise 2.6 - member-cake?
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
   ((and (eq? a (car lat)) (member? a (cdr lat)) t))
   (t (member-twice? a (cdr lat)))))

;; Chapter 03
;; (rember a lat) remove first occurrence of a in lat
(defun rember (a lat)
  (cond
   ((null? lat) '())
   ((eq? a (car lat)) (cdr lat))
   (t (cons (car lat) (rember a (cdr lat))))))

;; (firsts lat) take one argument which must either be a null list
;; or contain only non-null lists. It builds another list composed of
;; the first S expression of each internal list
(defun firsts (lat)
  (cond
   ((null? lat) '())
   (t (cons (car (car lat)) (firsts (cdr lat))))))

;; (insertR new old lat) insert new to the right of first occurrence
;; of old in lat
(defun insertR (new old lat)
  (cond
   ((null? lat) '())
   ((eq? old (car lat)) (cons old (cons new (cdr lat))))
   (t (cons (car lat) (insertR new old (cdr lat))))))

;; (insertL new old lat) insert new to the left of first occurrence
;; of old in lat
(defun insertL (new old lat)
  (cond
   ((null? lat) '())
   ((eq? old (car lat)) (cons new (cons old (cdr lat))))
   (t (cons (car lat) (insertL new old (cdr lat))))))

;; (subst new old lat) replaces the first occurrence of old in lat
;; with the atom new
(defun subst (new old lat)
  (cond
   ((null? lat) '())
   ((eq? old (car lat)) (cons new (cdr lat)))
   (t (cons (car lat) (subst new old (cdr lat))))))

;; (subst2 new o1 o2 lat) replaces either the first occurrence of o1
;; or the first occurrence of o2 by new, whichever found first will
;; be replaced
(defun subst2 (new o1 o2 lat)
  (cond
   ((null? lat) '())
   ((or (eq? o1 (car lat)) (eq? o2 (car lat))) (cons new (cdr lat)))
   (t (cons (car lat) (subst2 (new o1 o2 (cdr lat)))))))

;; Exercise 3.1
;; (seconds lat) takes a list of lat and make a new lat consisting of
;; the second atom from each lat in the list
(defun seconds (lat)
  (cond
   ((null? lat) '())
   (t (cons (car (cdr (car lat))) (seconds (cdr lat))))))

;; Exercise 3.2
;; (dupla a l) make a new lat containing as many a's as there are
;; elements in l
(defun dupla (a l)
  (cond
   ((null? l) '())
   (t (cons a (dupla a (cdr l))))))

;; Exercise 3.3
;; (double a l) doubles the first a in l instead of removing it
(defun double (a l)
  (cond
   ((null? l) '())
   ((eq? a (car l)) (cons a l))
   (t (cons (car l) (double a (cdr l))))))

;; Exercise 3.4
;; (subst-sauce a l) substitutes a for the first atom sauce in l
(defun subst-sauce (a l)
  (subst a 'sauce l))

;; Exercise 3.5
;; (subst3 new o1 o2 o3 lat) replaces the first occurrence of either
;; o1, o2 or o3 in lat by new
(defun subst3 (new o1 o2 o3 lat)
  (cond
   ((null? lat) '())
   ((or
    (eq? o1 (car lat))
    (eq? o2 (car lat))
    (eq? o3 (car lat)))
    (cons new (cdr lat)))
   (t (cons (car lat) (subst3 new o1 o2 o3 (cdr lat))))))

;; Exercise 3.6
;; (substN new slat lat) replaces the first atom in lat that also
;; occurs in slat by the atom new
(defun substN (new slat lat)
  (cond
   ((null? lat) '())
   ((null? slat) '())
   ((member? (car lat) slat) (cons new (cdr lat)))
   (t (cons (car lat) (substN new slat (cdr lat))))))

;; Exercise 3.9
(defun rember2 (a l)
  (cond
   ((null? l) '())
   ((eq? a (car l)) (cons (car l) (rember a (cdr l))))
   (t (cons (car l) (rember2 a (cdr l))))))

(provide 'the-little-lisper)

;;; the-little-lisper.el ends here

