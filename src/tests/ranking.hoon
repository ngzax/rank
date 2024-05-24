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
|_  bowl=bowl:gall
::
:::: Helpers for Test SetUp
  ::
++  fake-bowl
  ^-  bowl:gall
  =:  our.bowl  ~zod
      eny.bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
      now.bowl  ~2024.4.1..20.31.25..2be3
  ==
  bowl
++  setup
  |=  d=test-data:rank
  ^-  test-data:rank
  =.  d    [~ ~]
  =:  c.d  (some (~(new category fake-bowl) [10 "Best" "Books" "All-time"]))
      s.d  (some (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"]))
  ==
  d
::
:::: A Ranking will be initially creation with a Category (ca) and an empty list of Rankings (ra).
  ::
++  test-ranking-creation
  ;:  weld
  %+  expect-eq
    !>  [ca=[id=[sh=~zod uu=~.84a8v.p2opa] li=10 ad="Best" su="Books" pe="All-time" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]] ra=~]
    !>
      ^-  rkg:rank
      =/  d  (setup)
      (new:ranking (need c.d))
  ==
++  test-ranking-creation-initially-empty
  ;:  weld
  %+  expect-eq
    !>  0
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
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
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
      (get-category:ranking r)
  ==
::
:::: A Ranking can answer the List of Subjects it is Ranking.
  ::
++  test-ranking-get-subjects
  ;:  weld
  %+  expect-eq
    !>  ~[[id=[sh=~zod uu=~.84a8v.p2opa] ti="The Possessed" ar="Fyodor Dostoyevsky" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]]
    !>
      ^-  (list sbj:rank)
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
      =/  l  (add-subject:ranking [r (need s.d)])
      (get-subjects:ranking l)
  ==
::
:::: A Ranking knows the maximum number of Subjects it can rank.
  ::
++  test-ranking-get-max-subjects
  ;:  weld
  %+  expect-eq
    !>  10
    !>
      ^-  @ud
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
      (get-max-subjects:ranking r)
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
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
      (add-subject:ranking [r (need s.d)])
  ==
++  test-ranking-add-subject-adds-subject
  ;:  weld
  %+  expect-eq
    !>  1
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
      =/  l  (add-subject:ranking [r (need s.d)])
      (ranking-count:ranking l)
  ==
++  test-ranking-add-subject-appends-new-subject
  ;:  weld
  %+  expect-eq
    !>  [id=[sh=~zod uu=~.84a8v.p2opa] ti="All the Pretty Horses" ar="Cormac McCarty" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]
    !>
      ^-  sbj:rank
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarty"])
      =.  r   (add-subject:ranking [r (need s.d)])
      =.  r   (add-subject:ranking [r s2])
      (snag 1 (get-subjects:ranking r))  :: Should be last in the list. (index 1)
  ==
++  test-ranking-push-subject-prepends-new-subject
  ;:  weld
  %+  expect-eq
    !>  [id=[sh=~zod uu=~.84a8v.p2opa] ti="All the Pretty Horses" ar="Cormac McCarty" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]
    !>
      ^-  sbj:rank
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarty"])
      =.  r   (add-subject:ranking [r (need s.d)])
      =.  r   (push-subject:ranking [r s2])
      (snag 0 (get-subjects:ranking r))  :: Should be 1st in the list this time. (index 0)
  ==
++  test-ranking-add-multiple-subjects
  ;:  weld
  %+  expect-eq
    !>  2
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need c.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarty"])
      =.  r   (add-subjects:ranking [r (limo [(need s.d) s2 ~])])
      (ranking-count:ranking r)
  ==
--
