::
:::: Unit test Door for Ranks
  ::
/+  *test
/+  rank
/+  *rank-category
/+  *rank-ranking
::
:::: Provide a faked bowl for testing
  ::
|_  fake-bowl=bowl:gall
::
:::: A Ranking will be initially creation with an XRef to a Category and an empty list of Rankings
++  test-ranking-creation
  ;:  weld
  %+  expect-eq
    !>  [cx=[sh=~zod uu="84a8v.p2opa"] rk=~]
    !>
      ^-  rkg:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
      ==
      =/  c  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      :: =/  s  (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"])
      (new:ranking [c])
  ==
:: ::
:: ++  test-category-to-tape
::   ;:  weld
::   %+  expect-eq
::     !>  "The 10 Best Books of All-time"
::     !>  (to-tape:category [10 "Best" "Books" "All-time"])
::   ==
--
