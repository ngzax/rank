::
:::: Unit test Core for Category
  ::
/+  *test
/+  rank
/+  *rank-category
::
:::: Provide a faked bowl for testing
  ::
|_  fake-bowl=bowl:gall
::
++  test-category-creation
  ;:  weld
  %+  expect-eq
    !>  [id=[sh=~zod uu="jbl03.q1tnj"] li=10 ad="Best" su="Books" pe="All-time" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~]]
    !>
      ^-  cat:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv
          now.fake-bowl  ~2024.4.1..20.31.25..2be3
      ==
      (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
  ==
::
++  test-category-has-a-unique-urbit-id
  ;:  weld
  %+  expect-eq
    !>  [sh=~zod uu="62qg2.p57rt"]
    !>
      ^-  uid:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
      ==
      =/  cat  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      (get-urbid:category cat)
  ==
::
++  test-category-creation-sets-timestamp
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.4.1..20.31.25..2be3 up=~ de=~]
    !>
      ^-  tsp:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
          now.fake-bowl  ~2024.4.1..20.31.25..2be3
      ==
      =/  cat  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      (get-timestamp:category cat)
  ==
::
++  test-category-deletion-sets-timestamp
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.4.1..20.31.25..2be3 up=~ de=[~ ~2024.4.1..21.13.47..b6a6]]
    !>
      ^-  tsp:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
          now.fake-bowl  ~2024.4.1..20.31.25..2be3
      ==
      =/  cat  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      =.  now.fake-bowl  ~2024.4.1..21.13.47..b6a6
      =.  cat  (~(del category fake-bowl) cat)
      (get-timestamp:category cat)
  ==
::
++  test-category-to-tape
  ;:  weld
  %+  expect-eq
    !>  "The 10 Best Books of All-time"
    !>
      ^-  tape
      =/  cat  (new:category [10 "Best" "Books" "All-time"])
      (to-tape:category cat)
  ==
--
