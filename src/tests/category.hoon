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
++  test-making-a-category
  ;:  weld
  %+  expect-eq
    !>  [uid=[ship=~zod uuid="0v1c4.jbl0"] lim=10 adj="Best" sub="Books" per="All-time"]
    !>
      ^-  cate:rank
      =:  our.fake-bowl  ~zod
          :: src.fake-bowl  ~zod
          :: dap.fake-bowl  %rank
          :: sap.fake-bowl  /gall/dojo
          eny.fake-bowl  0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv
      ==
      (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
  ==
::
++  test-has-a-unique-urbit-id
  ;:  weld
  %+  expect-eq
    !>  [ship=~zod uuid="0v0"]
    !>
      ^-  ubid:rank
      :: =.  fake-bowl  [our=~zod src=~zod dap=%ranl sap=/gall/dojo]
      =/  cat  (new:category [10 "Best" "Books" "All-time"])
      :: =/  cat  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      (get-urbid:category cat)
  ==
::
++  test-category-to-tape
  ;:  weld
  %+  expect-eq
    !>  "The 10 Best Books of All-time"
    !>
      ^-  tape
      :: =.  fake-bowl  [our=~zod src=~zod dap=%ranl sap=/gall/dojo]
      =/  cat  (new:category [10 "Best" "Books" "All-time"])
      :: =/  cat  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      (to-tape:category cat)
  ==
--
