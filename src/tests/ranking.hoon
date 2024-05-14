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
    !>  [ca=[id=[sh=~zod uu=~.84a8v.p2opa] li=10 ad="Best" su="Books" pe="All-time" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]] ra=~]
    !>
      ^-  rkg:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
          now.fake-bowl  ~2024.4.1..20.31.25..2be3
      ==
      =/  c  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      :: =/  s  (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"])
      (new:ranking [c])
  ==
::
:::: A Ranking contains the Category it is Ranking
  ::
  ++  test-ranking-get-category
    ;:  weld
    %+  expect-eq
      !>  [id=[sh=~zod uu=~.84a8v.p2opa] li=10 ad="Best" su="Books" pe="All-time" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]
      !>
        ^-  ctg:rank
        =:  our.fake-bowl  ~zod
            eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
          now.fake-bowl  ~2024.4.1..20.31.25..2be3
        ==
        =/  c  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
        =/  r  (new:ranking c)
        (get-category:ranking r)
    ==
--
