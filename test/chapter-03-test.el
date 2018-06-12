(require 'the-little-lisper)

(ert-deftest chapter-03-test/rember ()
  (should (equal (rember 'mint '(lamb chops and mint jelly))
                 '(lamb chops and jelly)))
  (should (equal (rember 'mint '(lamb chops and mint flavored mint jelly))
                 '(lamb chops and flavored mint jelly)))
  (should (equal (rember 'toast '(bacon lettuce and tomato))
                 '(bacon lettuce and tomato)))
  (should (equal (rember 'cup '(coffee cup tea cup and hick cup))
                 '(coffee tea cup and hick cup)))
  (should (equal (rember 'sauce '(soy sauce and tomato sauce))
                 '(soy and tomato sauce))))

(ert-deftest chapter-03-test/firsts ()
  (should (equal (firsts '((apple peach pumpkin)
                           (plum pear cherry)
                           (grape raisin pea)
                           (bean carrot eggplant)))
                 '(apple plum grape bean)))
  (should (equal (firsts '((a b) (c d) (e f))) '(a c e)))
  (should (equal (firsts '()) '()))
  (should (equal (firsts '((five plums) (four) (eleven green oranges)))
                 '(five four eleven))))

(ert-deftest chapter-03-test/insertR ()
  (should (equal (insertR 'topping
                          'fudge
                          '(ice cream with fudge for dessert))
                 '(ice cream with fudge topping for dessert))))

(ert-deftest chapter-03-test/insertL ()
  (should (equal (insertL 'topping
                          'fudge
                          '(ice cream with fudge for dessert))
                 '(ice cream with topping fudge for dessert))))

(ert-deftest chapter-03-test/subst ()
  (should (equal (subst 'topping
                        'fudge
                        '(ice cream with fudge for dessert))
                 '(ice cream with topping for dessert))))

(ert-deftest chapter-03-test/subst2 ()
  (should (equal (subst2 'vanilla
                         'chocolate
                         'banana
                         '(banana ice cream with chocolate topping))
                 '(vanilla ice cream with chocolate topping))))

(ert-deftest chapter-03-test/exercise ()
  (let ((l1 '((paella spanish) (wine red) (and beans)))
        (l2 '())
        (l3 '(cincinnati chili))
        (l4 '(texas hot chili))
        (l5 '(soy sauce and tomato sauce))
        (l6 '((spanish) () (paella)))
        (l7 '((and hot) (but dogs)))
        (a1 'chili)
        (a2 'hot)
        (a3 'spicy)
        (a4 'sauce)
        (a5 'soy))

    ;; Exercise 3.1
    (should (equal (seconds l1) '(spanish red beans)))
    (should (equal (seconds l2) '()))
    (should (equal (seconds l7) '(hot dogs)))

    ;; Exercise 3.2
    (should (equal (dupla a2 l4) '(hot hot hot)))
    (should (equal (dupla a2 l2) '()))
    (should (equal (dupla a1 l5) '(chili chili chili chili chili)))

    ;; Exercise 3.3
    (should (equal (double a2 l2) '()))
    (should (equal (double a1 l3) '(cincinnati chili chili)))
    (should (equal (double a2 l4) '(texas hot hot chili)))

    ;; Exercise 3.4
    (should (equal (subst-sauce a1 l4) '(texas hot chili)))
    (should (equal (subst-sauce a1 l5) '(soy chili and tomato sauce)))
    (should (equal (subst-sauce a4 l2) '()))

    ;; Exercise 3.5
    (should (equal (subst3 a5 a1 a2 a4 l5) '(soy soy and tomato sauce)))
    (should (equal (subst3 a4 a1 a2 a3 l4) '(texas sauce chili)))
    (should (equal (subst3 a3 a1 a2 a5 l2) '()))

    ;; Exercise 3.6
    (should (equal (substN a2 l3 l4) '(texas hot hot)))
    (should (equal (substN a4 l3 l5) '(soy sauce and tomato sauce)))
    (should (equal (substN a4 l3 l2) '()))

    ;; Exercise 3.9
    (should (equal (rember2 a1 l3) '(cincinnati chili)))
    (should (equal (rember2 a4 l5) '(soy sauce and tomato)))
    (should (equal (rember2 a4 l2) '()))))
