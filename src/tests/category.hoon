::
:::: Unit test Door for Category
  ::
/-  *rank-test
::
/+  *test
/+  *rank-category
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
      eny.bowl  0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv
      now.bowl  ~2024.4.1..20.31.25..2be3
  ==
  bowl
++  fake-bowl-1
  ^-  bowl:gall
  =:  our.bowl  ~zod
      eny.bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
      now.bowl  ~2024.4.2..22.22.22..2be3
  ==
  bowl
++  setup
  |=  d=test-data-1
  ^-  test-data-1
  =.  d    [~ ~]
  =:  c0.d  (some (~(new category fake-bowl-0) [2 "Best" "Books" "All-time"]))
      c1.d  (some (~(new category fake-bowl-1) [10 "Best" "Books" "2024"]))
  ==
  d
++  expects
  |=  e=test-data-1
  ^-  test-data-1
  =.  e  [~ ~]
  =:  c0.e  [~ [id=[sh=~zod uu=~.jbl03.q1tnj] ts=[cr=~2024.4.1..20.31.25..2be3 de=~ ri=0] li=2 ad="Best" su="Books" pe="All-time"]]
      c1.e  [~ [id=[sh=~zod uu=~.62qg2.p57rt] ts=[cr=~2024.4.2..22.22.22..2be3 de=~ ri=0] li=10 ad="Best" su="Books" pe="2024"]]
  ==
  e
::
++  test-category-creation
  ;:  weld
  %+  expect-eq
    !>
      =/  e  (expects)
      (need c0.e)
    !>
      ^-  cate
      =/  d  (setup)
      (need c0.d)
  ==
::
++  test-category-has-a-unique-urbit-id
  ;:  weld
  %+  expect-eq
    !>  [sh=~zod uu=~.62qg2.p57rt]
    !>
      ^-  uid:rank
      =/  d  (setup)
      (get-urbid:category (need c1.d))
  ==
::
++  test-category-has-a-limit
  ;:  weld
  %+  expect-eq
    !>  10
    !>
      ^-  @ud
      =/  d  (setup)
      (get-limit:category (need c1.d))
  ==
::
++  test-category-creation-sets-timestamp
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.4.1..20.31.25..2be3 de=~ ri=0]
    !>
      ^-  tsp:rank
      =/  d  (setup)
      (get-timestamp:category (need c0.d))
  ==
::
++  test-category-deletion-sets-timestamp
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.4.1..20.31.25..2be3 de=[~ ~2024.4.1..22.22.22..b6a6] ri=1]
    !>
      ^-  tsp:rank
      =/  d  (setup)
      =/  cate  (need c0.d)
      =.  now.bowl  ~2024.4.1..22.22.22..b6a6
      =.  cate  (~(del category bowl) cate)
      (get-timestamp:category cate)
  ==
::
++  test-category-to-tape
  ;:  weld
  %+  expect-eq
    !>  "The 10 Best Books of 2024"
    !>
      ^-  tape
      =/  d     (setup)
      (to-tape:category (need c1.d))
  ==
::
++  test-category-to-cord
  ;:  weld
  %+  expect-eq
    !>  'The 2 Best Books of All-time'
    !>
      ^-  @t
      =/  d     (setup)
      (to-cord:category (need c0.d))
  ==
--
