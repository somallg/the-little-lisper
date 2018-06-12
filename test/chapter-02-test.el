(require 'the-little-lisper)

(ert-deftest chapter-02-test/lat ()
  (should (equal (lat? '(Jack Spart could eat no chicken fat))
                 t))
  (should (equal (lat? '((Jack) Spart could eat no chicken fat))
                 nil))
  (should (equal (lat? '(Jack (Spart could) eat no chicken fat))
                 nil))
  (should (equal (lat? '())
                 t))
  (should (equal (lat? '(bacon (and eggs)))
                 nil)))

(ert-deftest chapter-02-test/or ()
  (should (equal (or (null? '()) (atom? '(d e f g)))
                 t))
  (should (equal (or (null? '(a b c)) (null? '()))
                 t))
  (should (equal (or (null? '(a b c)) (null? '(atom)))
                 nil)))

(ert-deftest chapter-02-test/member ()
  (should (equal (member? 'tea '(coffee tea or milk))
                 t))
  (should (equal (member? 'poached '(fried eggs and scrambled eggs))
                 nil))
  (should (equal (member? 'meat '(mashed potatoes and meat gravy))
                 t)))

(ert-deftest chapter-02-test/exercise ()
  (let ((l1 '(german chocolate cake))
        (l2 '(poppy seed cake))
        (l3 '((linzer) (torte) ()))
        (l4 '((bleu cheese) (and) (red) (wine)))
        (l5 '(() ()))
        (a1 'coffee)
        (a2 'seed)
        (a3 'poppy))

    ;; Exercise 2.1
    (should (equal (lat? l1) t))
    (should (equal (lat? l2) t))
    (should (equal (lat? l3) nil))

    ;; Exercise 2.3
    (should (equal (member? a1 l1) nil))
    (should (equal (member? a2 l2) t))

    ;; Exercise 2.5
    (should (equal (nonlat? l1) nil))
    (should (equal (nonlat? l2) nil))
    (should (equal (nonlat? l3) nil))
    (should (equal (nonlat? l4) t))

    ;; Exercise 2.6
    (should (equal (member-cake? l1) t))
    (should (equal (member-cake? l2) t))
    (should (equal (member-cake? l5) nil))

    ;; Exercise 2.7
    (should (equal (member2? a1 l1) nil))
    (should (equal (member2? a1 l2) nil))
    (should (equal (member2? a2 l2) t))

    ;; Exercise 2.8
    (should (equal (member? a3 l2) t))
    (should (equal (member2? a3 l2) t))

    ;; Exercise 2.9
    (should (equal (member? a2 l3) nil))

    ;; Exercise 2.10
    (should (equal (member-twice? 'a '(x a b c a)) t))

    ))
