::
:::: Unit test Core for UrbID
  ::
/+  *test
/+  rank
/+  *rank-urbid
::
:::: Provide a faked bowl for testing
  ::
|_  fake-bowl=bowl:gall
::
++  test-making-an-urbid
  ;:  weld
  %+  expect-eq
    !>  [ship=~zod uuid="0v0"]
    !>  new:urbid
  ==
::
++  test-urbid-to-tape
  ;:  weld
  %+  expect-eq
    !>  "~zod:0v1c4.jbl0"
    !>
      ^-  tape
      =:  our.fake-bowl  ~zod
          src.fake-bowl  ~zod
          dap.fake-bowl  %rank
          sap.fake-bowl  /gall/dojo
          eny.fake-bowl  0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv
      ==
      =/  uid  ~(new urbid fake-bowl)
      (to-tape:urbid uid)
  ==
--

