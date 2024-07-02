::
:::: Unit test Door for Subjects
  ::
/-  *rank-test
::
/+  *test
/+  *rank-subject
::
:::: Provide a faked bowl for testing
  ::
|_  bowl=bowl:gall
::
:::: Helpers for Test SetUp
  ::
++  fake-bowl-0
  ^-  bowl:gall
  =:  our.bowl  ~zod
      eny.bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
      now.bowl  ~2024.4.8..22.46.10..8a01
  ==
  bowl
++  fake-bowl-1
  ^-  bowl:gall
  =:  our.bowl  ~zod
      eny.bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
      now.bowl  ~2024.4.8..17.22.57..f365
  ==
  bowl
++  setup
  |=  d=subject-test-data
  ^-  subject-test-data
  =.  d    [~ ~]
  =:  s0.d  (some (~(new subject fake-bowl-0) ["The Possessed" "Fyodor Dostoyevsky"]))
      s1.d  (some (~(new subject fake-bowl-1) ["The Possessed" "Fyodor Dostoyevsky"]))
  ==
  d
++  expects
  |=  e=subject-test-data
  ^-  subject-test-data
  =.  e  [~ ~]
  =:  s0.e  [~ [me=[id=[sh=~zod uu=~.84a8v.p2opa] lf=0 rf='0' ts=[cr=~2024.4.8..22.46.10..8a01 de=~]] ti="The Possessed" ar="Fyodor Dostoyevsky"]]
      s1.e  [~ [me=[id=[sh=~zod uu=~.62qg2.p57rt] lf=0 rf='0' ts=[cr=~2024.4.8..17.22.57..f365 de=~]] ti="The Possessed" ar="Fyodor Dostoyevsky"]]
  ==
  e
::
++  test-subject-creation
  ;:  weld
  %+  expect-eq
    !>
      =/  e  (expects)
      (need s0.e)
    !>
      ^-  subj
      =/  d  (setup)
      (need s0.d)
  ==
::
++  test-subject-to-tape
  ;:  weld
  %+  expect-eq
    !>  "'The Possessed' by Fyodor Dostoyevsky"
    !>
      ^-  tape
      =/  d  (setup)
      (to-tape:subject (need s1.d))
  ==
::
++  test-subject-getting-the-artist
  ;:  weld
  %+  expect-eq
    !>  "Fyodor Dostoyevsky"
    !>  (get-artist:subject (new:subject ["The Possessed" "Fyodor Dostoyevsky"]))
  ==
::
++  test-subject-getting-the-title
  ;:  weld
  %+  expect-eq
    !>  "The Possessed"
    !>  (get-title:subject (new:subject ["The Possessed" "Fyodor Dostoyevsky"]))
  ==
::
++  test-subject-has-a-unique-urbit-id
  ;:  weld
  %+  expect-eq
    !>  [sh=~zod uu=~.84a8v.p2opa]
    !>
      ^-  uid:rank
      =/  d  (setup)
      (get-urbid:subject (need s0.d))
  ==
::
++  test-subject-creation-sets-timestamp
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.4.8..17.22.57..f365 de=~]
    !>
      ^-  tsp:rank
      =/  d  (setup)
      (get-timestamp:subject (need s1.d))
  ==
::
::
++  test-subject-creation-sets-life-to-zero
  ;:  weld
  %+  expect-eq
    !>  0
    !>
      ^-  @u
      =/  d  (setup)
      (get-life:subject (need s0.d))
  ==
::
++  test-subject-creation-sets-rift-to-0
  ;:  weld
  %+  expect-eq
    !>  `@tas`'0'
    !>
      ^-  @tas
      =/  d  (setup)
      (get-rift:subject (need s0.d))
  ==
++  test-subject-deletion-sets-timestamp
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.4.8..22.46.10..8a01 de=[~ ~2024.4.8..22.51.47..3127]]
    !>
      ^-  tsp:rank
      =:  our.bowl  ~zod
          eny.bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
          now.bowl  ~2024.4.8..22.46.10..8a01
      ==
      =/  sub  (~(new subject bowl) ["The Possessed" "Fyodor Dostoyevsky"])
      =.  now.bowl  ~2024.4.8..22.51.47..3127
      =.  sub  (~(del subject bowl) sub)
      (get-timestamp:subject sub)
  ==
--
