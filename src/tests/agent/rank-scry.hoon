::  "Feature" testing on the %rank Gall agent.
::
/-  *rank
:: /-  spider

/+  *test
::
:::: Thread Libraries
  ::
:: /+  strandio
:: =,  strand=strand:spider
:: =,  strand-fail=strand-fail:libstrand:spider
::
/=  agent  /app/rank
::
:: compose helper core with tests
=>
|%
:: ++  process-lanes
::   |=  [target=@p lanes=(list lane:ames)]
::   =/  m  (strand ,~)
::   ^-  form:m
::   ?~  `(list lane:ames)`lanes
::     %-  (slog leaf+"No route for {(scow %p target)}." ~)
::     (pure:m ~)
::   =/  lroute  (skip lanes |=(a=lane:ames -.a))
::   ?~  lroute
::     %-  (slog leaf+"No direct route for {(scow %p target)}." ~)
::     (pure:m ~)
::   =/  ip  +:(scow %if p.i.lroute)
::   =/  port  (skip (scow %ud (cut 5 [1 1] p.i.lroute)) |=(a=@tD =(a '.')))
::   %-  (slog leaf+"{ip}:{port}" ~)
::   (pure:m ~)
:: ++  run-scry
::   |=  arg=vase
::   ^-  thread:spider
::   =/  m  (strand ,vase)
::   ^-  form:m
::   =/  utarget  !<  (unit @p)  arg
::   ?~  utarget
::     (strand-fail %no-arg ~)
::   =/  target  u.utarget
::   ;<  lanes=(list lane:ames)  bind:m  (scry:strandio (list lane:ames) /ax//peers/(scot %p target)/forward-lane)
::   ;<  ~                       bind:m  (process-lanes target lanes)
::   (pure:m !>(~))
::
::::  Build an example bowl manually.
  ::
++  bowl
  |=  run=@ud
  ^-  bowl:gall
  :*  [~zod ~zod %rank ~['app' 'rank']]                :: (our src dap sap)
      [~ ~ ~]                                          :: (wex sup sky)
      [run 0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv ~2024.4.1..20.31.25..2be3 [~zod %base ud+run]] :: (act eny now byk)
  ==
::
::::  Build a reference state mold.
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
    ::   (run-scry)
  ==
--
