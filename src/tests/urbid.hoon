::
:::: Unit test Door for UrbID
  ::
/+  *test
/+  rank
/+  *rank-urbid
::
:::: Provide a faked bowl for testing
  ::
|_  fake-bowl=bowl:gall
::
++  test-urbid-creation
  ;:  weld
  %+  expect-eq
    !>  [sh=~zod uu=~.62qg2.p57rt]
    !>
      ^-  uid:rank
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
      ==
      ~(new urbid fake-bowl)
  ==
::
++  test-urbid-getting-the-key
  ;:  weld
  %+  expect-eq
    !>  ~.62qg2.p57rt
    !>
      ^-  @ta
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
      ==
      (get-key:urbid ~(new urbid fake-bowl))
  ==
::
++  test-urbid-to-tape
  ;:  weld
  %+  expect-eq
    !>  "~zod:jbl03.q1tnj"
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
::
++  test-urbid-comparing
  ;:  weld
  %+  expect-eq
    !>  %.y
    !>
      ^-  @
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
      ==
      =/  u1  ~(new urbid fake-bowl)
      =/  u2  ~(new urbid fake-bowl)
      (same:urbid u1 u2)
  ::
  :: 2 UrbitIDs with different values of `uu` are not the same...
  %+  expect-eq
    !>  %.n
    !>
      ^-  @
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
      ==
      =/  u1  ~(new urbid fake-bowl)
      =/  u2  new:urbid
      (same:urbid u1 u2)
  ::
  :: This shows that kequality is only determined by `uu` and ignores the ship.
  %+  expect-eq
    !>  %.y
    !>
      ^-  @
      =:  our.fake-bowl  ~zod
          eny.fake-bowl  0v2g8.62qg2.p57rt.pkcj6.c2gsg.gohkh.8hjvu.sgg3c.l6r09.69n9h.namgk.j8lis.djb0o.ipqs7.p4sfr.eivfm.sa7k5.7hilk.5on6d.cgmng.02s4k
      ==
      =/  u1  ~(new urbid fake-bowl)
      =.  our.fake-bowl  ~nec
      =/  u2  ~(new urbid fake-bowl)
      (same:urbid u1 u2)
  ==
--

