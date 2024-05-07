::  "Feature" testing on the %rank Gall agent.
::
/-  *rank
/+  strandio
:: /+  agentio
/+  *test
/=  agent  /app/rank
::
:: compose helper core with tests
=>
|%
::  Build an example bowl manually.
::
++  bowl
  |=  run=@ud
  ^-  bowl:gall
  :*  [~zod ~zod %rank ~['app' 'rank']]                :: (our src dap sap)
      [~ ~ ~]                                          :: (wex sup sky)
      [run 0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv ~2024.4.1..20.31.25..2be3 [~zod %base ud+run]] :: (act eny now byk)
  ==
::  Build a reference state mold.
::
+$  state
  $:  %0
    display-state
    categories=(list ctg)
    pals=(list @p)
    rankings=(list rkg)
    subjects=(list sbj)
  ==
--
|%
::
::::  Test scrying out a Category.
  ::
++  test-agent-scrying-a-subject
  =|  run=@ud
  =/  path  /category/~.gmne0.sigl9/noun
  ;:  weld
  %+  expect-eq
    !>  1
    :: !>  [id=[sh=~zod uu=~.jbl03.q1tnj] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~]]
    !>  1
    :: !>
    ::   ^-  ctg
    ::   =/  m  (strand ,vase)
    ::   :: ^-  form:m
    ::   ;<  category=(unit ctg)  bind:m  (scry:strandio (unit ctg) /gx/=rank=/category/~.jbl03.q1tnj/noun)
    ::   (pure:m !>(~))
  ==
--
