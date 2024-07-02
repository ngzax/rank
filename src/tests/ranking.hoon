::
:::: Unit test Door for Rankings
  ::
/-  *rank-ranking
/-  *rank-test
::
/+  *test
/+  rank
/+  *rank-category
::
:::: Helper Cores
  ::
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
  |=  d=test-data
  ^-  test-data
  =.  d    [~ ~ ~ ~]
  =:  ca.d  (some (~(new category fake-bowl) [2 "Best" "Books" "All-time"]))
      su.d  (some (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"]))
  ==
  d
++  expects
  |=  e=test-data
  ^-  test-data
  =.  e  [~ ~ ~ ~]
  =:  ca.e  [~ [me=[id=[sh=~zod uu=~.84a8v.p2opa] lf=0 rf='0' ts=[cr=~2024.4.1..20.31.25..2be3 de=~ ri=0]] li=2 ad="Best" su="Books" pe="All-time"]]
      ra.e  [~ [ca=[me=[id=[sh=~zod uu=~.84a8v.p2opa] lf=0 rf='0' ts=[cr=~2024.4.1..20.31.25..2be3 de=~ ri=0]] li=2 ad="Best" su="Books" pe="All-time"] ra=~]]
      su.e  [~ [me=[id=[sh=~zod uu=~.84a8v.p2opa] lf=0 rf='0' ts=[cr=~2024.4.1..20.31.25..2be3 de=~ ri=0]] ti="The Possessed" ar="Fyodor Dostoyevsky"]]
      sl.e  :-  ~
                :~  [me=[id=[sh=~zod uu=~.84a8v.p2opa] lf=0 rf='0' ts=[cr=~2024.4.1..20.31.25..2be3 de=~ ri=0]] ti="The Possessed" ar="Fyodor Dostoyevsky"]
                    [me=[id=[sh=~zod uu=~.84a8v.p2opa] lf=0 rf='0' ts=[cr=~2024.4.1..20.31.25..2be3 de=~ ri=0]] ti="All the Pretty Horses" ar="Cormac McCarthy"]
                    [me=[id=[sh=~zod uu=~.84a8v.p2opa] lf=0 rf='0' ts=[cr=~2024.4.1..20.31.25..2be3 de=~ ri=0]] ti="Gravity's Rainbow" ar="Thomas Pynchon"]
                ==
  ==
  e
::
:::: A Ranking will be initially creation with a Category (ca) and an empty list of Rankings (ra).
  ::
++  test-ranking-creation
  ;:  weld
  %+  expect-eq
    !>
      =/  e  (expects)
      (need ra.e)
    !>
      ^-  rnkg
      =/  d  (setup)
      (new:ranking (need ca.d))
  ==
++  test-ranking-creation-initially-empty
  ;:  weld
  %+  expect-eq
    !>  0
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      (ranking-count:ranking r)
  ==
::
:::: A Ranking can get the Category it is Ranking.
  ::
++  test-ranking-get-category
  ;:  weld
  %+  expect-eq
    !>
      =/  e  (expects)
      (need ca.e)
    !>
      ^-  cate
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      (get-category:ranking r)
  ==
::
:::: A Ranking can answer the List of Subjects it is Ranking.
  ::
++  test-ranking-get-subjects
  ;:  weld
  %+  expect-eq
    !>
      =/  e  (expects)
      ~[(snag 0 (need sl.e))]
    !>
      ^-  (list subj)
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  l  (add-subject:ranking [r (need su.d)])
      (get-subjects:ranking l)
  ==
::
:::: A Ranking knows the maximum number of Subjects it can rank.
  ::
++  test-ranking-get-max-subjects
  ;:  weld
  %+  expect-eq
    !>  2
    !>
      ^-  @ud
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      (get-max-subjects:ranking r)
  ==
::
:::: A Ranking can add a Subjects to its List of rankings
  ::
++  test-ranking-add-subject-answers-the-ranking
  ;:  weld
  %+  expect-eq
    !>
      =/  e  (expects)
      [ca=(need ca.e) ra=~[(need su.e)]]
    !>
      ^-  rnkg
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      (add-subject:ranking [r (need su.d)])
  ==
++  test-ranking-add-subject-adds-subject
  ;:  weld
  %+  expect-eq
    !>  1
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  l  (add-subject:ranking [r (need su.d)])
      (ranking-count:ranking l)
  ==
++  test-ranking-add-subject-appends-new-subject
  ;:  weld
  %+  expect-eq
    !>
      =/  e  (expects)
      (snag 1 (need sl.e))
    !>
      ^-  subj
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarthy"])
      =.  r   (add-subject:ranking [r (need su.d)])
      =.  r   (add-subject:ranking [r s2])
      (snag 1 (get-subjects:ranking r))  :: Should be last in the list. (index 1)
  ==
++  test-ranking-push-subject-prepends-new-subject
  ;:  weld
  %+  expect-eq
    !>
      =/  e  (expects)
      (snag 1 (need sl.e))
    !>
      ^-  subj
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarthy"])
      =.  r   (add-subject:ranking [r (need su.d)])
      =.  r   (push-subject:ranking [r s2])
      (snag 0 (get-subjects:ranking r))  :: Should be 1st in the list this time. (index 0)
  ==
::
:::: Can add multiple subjects at once to a Ranking,
  ::
++  test-ranking-add-multiple-subjects
  ;:  weld
  %+  expect-eq
    !>  2
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarthy"])
      =.  r   (add-subjects:ranking [r (limo [(need su.d) s2 ~])])
      (ranking-count:ranking r)
  ==
::
:::: Prevents adding more Subjects than the Max Limit.
  ::
++  test-ranking-max-subjects-add
  ;:  weld
  %+  expect-eq
    !>  2
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarthy"])
      =/  s3  (~(new subject fake-bowl) ["Gravity's Rainbow" "Thomas Pynchon"])
      =.  r   (add-subjects:ranking [r (limo [(need su.d) s2 ~])])
      =.  r   (add-subject:ranking [r s3])
      (ranking-count:ranking r)
  ==
++  test-ranking-max-subjects-push
  ;:  weld
  %+  expect-eq
    !>  2
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarthy"])
      =/  s3  (~(new subject fake-bowl) ["Gravity's Rainbow" "Thomas Pynchon"])
      =.  r   (add-subjects:ranking [r (limo [(need su.d) s2 ~])])
      =.  r   (push-subject:ranking [r s3])
      (ranking-count:ranking r)
  ==
::
:::: Trying to add more Subjects than possible at once Fails completely.
  ::
++  test-ranking-max-subjects-add-many
  ;:  weld
  %+  expect-eq
    !>  0
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarthy"])
      =/  s3  (~(new subject fake-bowl) ["Gravity's Rainbow" "Thomas Pynchon"])
      =.  r   (add-subjects:ranking [r (limo [(need su.d) s2 s3 ~])])
      (ranking-count:ranking r)
  ==
++  test-ranking-max-subjects-push-many
  ;:  weld
  %+  expect-eq
    !>  1
    !>
      ^-  @
      =/  d  (setup)
      =/  r  (new:ranking (need ca.d))
      =/  s2  (~(new subject fake-bowl) ["All the Pretty Horses" "Cormac McCarthy"])
      =/  s3  (~(new subject fake-bowl) ["Gravity's Rainbow" "Thomas Pynchon"])
      =.  r   (push-subject:ranking [r (need su.d)])
      =.  r   (push-subjects:ranking [r (limo [s2 s3 ~])])
      (ranking-count:ranking r)
  ==
--
