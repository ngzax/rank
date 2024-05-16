::
:::: Unit test Door for Rankings
  ::
/+  *test
/+  rank
/+  *rank-category
/+  *rank-ranking
/+  *rank-subject
::
:::: Provide a faked bowl for testing
  ::
|_  fake-bowl=bowl:gall
::
:::: Helper for Test SetUp
++  setup
  ^-  bowl:gall
  =:  our.fake-bowl  ~zod
      eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
      now.fake-bowl  ~2024.4.1..20.31.25..2be3
  ==
  fake-bowl
:: --
::
:::: A Ranking will be initially creation with a Category (ca) and an empty list of Rankings (ra).
  ::
++  test-ranking-creation
  ;:  weld
  %+  expect-eq
    !>  [ca=[id=[sh=~zod uu=~.84a8v.p2opa] li=10 ad="Best" su="Books" pe="All-time" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]] ra=~]
    !>
      ^-  rkg:rank
      =/  c  (~(new category setup) [10 "Best" "Books" "All-time"])
      (new:ranking c)
  ==
++  test-ranking-creation-initially-empty
  ;:  weld
  %+  expect-eq
    !>  0
    !>
      ^-  @
      =/  c  (~(new category setup) [10 "Best" "Books" "All-time"])
      =/  r  (new:ranking c)
      (ranking-count:ranking r)
  ==
::
:::: A Ranking can get the Category it is Ranking.
  ::
++  test-ranking-get-category
  ;:  weld
  %+  expect-eq
    !>  [id=[sh=~zod uu=~.84a8v.p2opa] li=10 ad="Best" su="Books" pe="All-time" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]
    !>
      ^-  ctg:rank
      =/  c  (~(new category setup) [10 "Best" "Books" "All-time"])
      =/  r  (new:ranking c)
      (get-category:ranking r)
  ==
::
:::: A Ranking can add a Subjects to its List of rankings
  ::
++  test-ranking-add-subject-answers-the-ranking
  ;:  weld
  %+  expect-eq
    !>
      :-  ca=[id=[sh=~zod uu=~.84a8v.p2opa] li=10 ad="Best" su="Books" pe="All-time" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]
          ra=[[id=[sh=~zod uu=~.84a8v.p2opa] ti="The Possessed" ar="Fyodor Dostoyevsky" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]] ~]
    !>
      ^-  rkg:rank
      =/  c  (~(new category setup) [10 "Best" "Books" "All-time"])
      =/  r  (new:ranking c)
      =/  s  (~(new subject setup) ["The Possessed" "Fyodor Dostoyevsky"])
      (add-subject:ranking [r s])
  ==
++  test-ranking-add-subject-adds-subject
  ;:  weld
  %+  expect-eq
    !>  1
    !>
      ^-  @
      =/  c  (~(new category setup) [10 "Best" "Books" "All-time"])
      =/  r  (new:ranking c)
      =/  s  (~(new subject setup) ["The Possessed" "Fyodor Dostoyevsky"])
      =/  l  (add-subject:ranking [r s])
      (ranking-count:ranking l)
  ==
--
