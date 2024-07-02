::
:::: Unit test Door for Subjects
  ::
/+  *test
::
/+  *rank-subject
::
:::: Provide a faked bowl for testing
  ::
|_  fake-bowl=bowl:gall
::
++  test-subject-creation
  ;:  weld
  %+  expect-eq
    !>  [me=[id=[sh=~zod uu=~.84a8v.p2opa] lf=0 rf='0' ts=[cr=~2024.4.8..17.22.57..f365 de=~ ri=0]] ti="The Possessed" ar="Fyodor Dostoyevsky"]
    !>
      ^-  subj
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
          now.fake-bowl  ~2024.4.8..17.22.57..f365
      ==
      (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"])
  ==
::
++  test-subject-to-tape
  ;:  weld
  %+  expect-eq
    !>  "'The Possessed' by Fyodor Dostoyevsky"
    !>
      ^-  tape
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
          now.fake-bowl  ~2024.4.8..17.22.57..f365
      ==
      =/  w  (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"])
      (to-tape:subject w)
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
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
      ==
      =/  sub  (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"])
      (get-urbid:subject sub)
  ==
::
++  test-subject-creation-sets-timestamp
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.4.8..22.46.10..8a01 de=~ ri=0]
    !>
      ^-  tsp:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
          now.fake-bowl  ~2024.4.8..22.46.10..8a01
      ==
      =/  sub  (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"])
      (get-timestamp:subject sub)
  ==
::
++  test-subject-deletion-sets-timestamp
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.4.8..22.46.10..8a01 de=[~ ~2024.4.8..22.51.47..3127] ri=1]
    !>
      ^-  tsp:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v117.84a8v.p2opa.1es5t.egnt9.1gvo0.ic1tk.jd80v.tb1pk.c08h8.4fo90.5orrd.rkn3d.ec2q3.1rk9v.m2f1s.o0vpp.6domb.s4km2.s95oi.llh6m
          now.fake-bowl  ~2024.4.8..22.46.10..8a01
      ==
      =/  sub  (~(new subject fake-bowl) ["The Possessed" "Fyodor Dostoyevsky"])
      =.  now.fake-bowl  ~2024.4.8..22.51.47..3127
      =.  sub  (~(del subject fake-bowl) sub)
      (get-timestamp:subject sub)
  ==
--
