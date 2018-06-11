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

;; atom?
(defun atom? (x)
  (not (listp x)))

;; null?
(defun null? (x)
  (null x))

;; eq?
(defun eq? (a1 a2)
  (eq a1 a2))

;; lat?
(defun lat? (l)
  (cond
   ((null l) t)
   ((atom (car l)) (lat (cdr l)))
   (t nil)))

(provide 'the-little-lisper)

;;; the-little-lisper.el ends here
