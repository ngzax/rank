::
:::: Unit test Core for UrbID
  ::
/+  *test
/+  rank
/+  urbid=rank-urbid
::
:::: Provide a faked bowl for testing
  ::
:: |_  $=  fake-bowl  :*
::       our  ~zod
::       src  ~zod
::       dap  %rank
::       sap  /gall/dojo
::       eny  0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv
::     ==
::
|%
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
    !>  "0v0 on ~zod"
    !>
      ^-  tape
      =/  uid  new:urbid
      (to-tape:urbid uid)
  ==
--
