(require 'the-little-lisper)

(ert-deftest chapter-01-test/atom ()
  (should (equal (atom? 'atom) t))
  (should (equal (atom? 'turkey) t))
  (should (equal (atom? 1492) t))
  (should (equal (atom? '3turkey) t))
  (should (equal (atom? 'u) t))
  (should (equal (atom? '*abc$) t)))

(ert-deftest chapter-01-test/car ()
  (should (equal (car '(a b c)) 'a))
  (should (equal (car '((a b c) x y z)) '(a b c)))
  (should (equal (car '(((hotdogs)) (and) (pickle) relish)) '((hotdogs))))
  (should (equal (car (car '(((hotdogs)) (and) (pickle) relish))) '(hotdogs))))

(ert-deftest chapter-01-test/cdr ()
  (should (equal (cdr '(a b c)) '(b c)))
  (should (equal (cdr '((a b c) x y z)) '(x y z)))
  (should-error (cdr 'hotdogs))
  (should (equal (cdr '()) '())))

(ert-deftest chapter-01-test/car-cdr ()
  (should (equal (car (cdr '((b) (x y) ((c))))) '(x y)))
  (should (equal (cdr (cdr '((b) (x y) ((c))))) '(((c)))))
  (should-error (cdr (car '(a (b (c)) d)))))

(ert-deftest chapter-01-test/cons ()
  (should (equal (cons 'peanut '(butter and jelly)) '(peanut butter and jelly)))
  (should (equal (cons '(mayonnaise and) '(peanut butter and jelly)) '((mayonnaise and) peanut butter and jelly)))
  (should (equal (cons '((help) this) '(is very ((hard) to learn))) '(((help) this) is very ((hard) to learn))))
  (should (equal (cons '(a b (c)) '()) '((a b (c)))))
  (should (equal (cons 'a (car '((b) c d))) '(a b)))
  (should (equal (cons 'a (cdr '((b) c d))) '(a c d))))

(ert-deftest chapter-01-test/null ()
  (should (equal (null? '(a b c)) nil))
  (should (equal (null? 'spaghetti) nil)))

(ert-deftest chapter-01-test/atom2 ()
  (should (equal (atom? 'Harry) t))
  (should (equal (atom? '(Harry had a heap of apples)) nil))
  (should (equal (atom? (car '(Harry had a heap of apples))) t))
  (should (equal (atom? (cdr '(Harry had a heap of apples))) nil))
  (should (equal (atom? (cdr '(Harry))) nil))
  (should (equal (atom? (car (cdr '(swing low sweet cherry)))) t))
  (should (equal (atom? (car (cdr '(swing (low sweet) cherry)))) nil)))

(ert-deftest chapter-01-test/eq ()
  (should (equal (eq? 'Harry 'Harry) t))
  (should (equal (eq? 'margarine 'butter) nil))
  (should (equal (eq? '() '(strawberry)) nil))
  (should (equal (eq? (car '(Mary had a little lamb chop)) 'Mary) t))
  (should (equal (eq? (cdr '(soured milk)) 'milk) nil))
  (should (equal (eq? (car '(beans beans we need jelly beans)) (car (cdr '(beans beans we need jelly beans)))) t)))

(ert-deftest chapter-01-test/exercises ()
  ;; Exercise 1.3
  (let ((a 'all) (b 'these) (c 'problems) (d '()))
    (should (equal (cons a (cons (cons b (cons c d)) d)) '(all (these problems))))
    (should (equal (cons a (cons (cons b d) (cons c d))) '(all (these) problems)))
    (should (equal (cons (cons a (cons b d)) (cons c d)) '((all these) problems)))
    (should (equal (cons (cons a (cons b (cons c d))) d) '((all these problems)))))

  ;; Exercise 1.4
  (should (equal (car (cons 'french '(fries))) 'french))
  (should (equal (cdr (cons 'oranges '(apples and peaches))) '(apples and peaches)))

  ;; Exercise 1.5
  (should (equal (eq? 'lisp 'lisp) t))

  ;; Exercise 1.6 - no such atom? that make (null? (cons a l)) return true
  (should (equal (null? (cons '() '())) nil))

  ;; Exercise 1.7
  (should (equal (cons 'x '(y)) '(x y)))
  (should (equal (cons '() '()) '(())))
  (should (equal (car '()) '()))
  (should (equal (cdr '(())) '()))
  (should (equal (atom? (car '((meatballs) and spaghetti))) nil))
  (should (equal (null? (cdr '((meatballs)))) t))
  (should (equal (eq? (car '(two meatballs))
                     (car (cdr '(two meatballs))))
                 nil))
  (should (equal (atom? (cons 'meat '(ball))) nil))

  (should (equal (car (cdr (cdr (car '((kiwis mangoes lemons) and more)))))
                 'lemons))
  (should (equal (car (cdr (car (cdr '(() (eggs and (bacon)) (for) (breakfast))))))
                 'and))
  (should (equal (car (cdr (cdr (cdr '(() () () (and (coffee)) please)))))
                 '(and (coffee))))

  (should (equal (car (car (cdr (cdr '(apples in (Harry has a backyard))))))
                 'Harry))
  (should (equal (car (cdr (cdr '(apples and Harry))))
                 'Harry))
  (should (equal (car (car (car (cdr (cdr (car '(((apples) and ((Harry))) in his backyard)))))))
                 'Harry)))
