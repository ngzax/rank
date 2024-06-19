::  "Feature" testing on the %rank Gall agent.
::
/-  *rank
/-  *rank-category
/-  *rank-ranking
/-  *rank-state
::
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
    categories=(list cate)
    pals=(list @p)
    rankings=(list rnkg)
    subjects=(list subj)
  ==
--
|%
::  Test adding a Category into the agent state.
::
++  test-agent-adding-a-category
  =|  run=@ud
  =^  move  agent  (~(on-poke agent (bowl run)) %rank-action !>([%add-category 10 "Best" "Albums" "2023"]))
  =+  !<(=state on-save:agent)
  ;:  weld
  %+  expect-eq
    !>  [id=[sh=~zod uu=~.jbl03.q1tnj] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]
    !>  (snag 0 categories.state)
  ==
::
::::  Test adding a Subject into the agent state.
  ::
++  test-agent-adding-a-subject
  =|  run=@ud
  =^  move  agent  (~(on-poke agent (bowl run)) %rank-action !>([%add-subject "The Possessed" "Fyodor Dostoyevsky"]))
  =+  !<(=state on-save:agent)
  ;:  weld
  %+  expect-eq
    !>  [id=[sh=~zod uu=~.jbl03.q1tnj] ti="The Possessed" ar="Fyodor Dostoyevsky" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]
    !>  (snag 0 subjects.state)
  ==
--
