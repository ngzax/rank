::  "Feature" testing on the %rank Gall agent.
::
/-  *rank
/-  *rank-category
/-  *rank-ranking
/-  *rank-state
::
/+  *test
::
/=  agent  /app/rank
::
:: compose helper core with tests
=>
|%
::
::::  Build a "shadow" for the reference state mold.
  ::
+$  state
  $:  %0
    display-state
    categories=(list cate)
    pals=(list @p)
    rankings=(list rnkg)
    subjects=(list subj)
  ==
::
::::  Build an example bowl manually.
  ::
++  bowl
  |=  run=@ud
  ^-  bowl:gall
  :*  :^  ~zod  ~zod  %rank  ~['app' 'rank']           :: (our src dap sap)
      :+  ~  ~  ~                                      :: (wex sup sky)
      :^  run                                          :: (act eny now byk)
          0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv
          ~2024.4.1..20.31.25..2be3
          [~zod %base ud+run]
  ==
:: ++  setup
::   |=  run=@ud
::   =^  move  agent
::     (~(on-poke agent (bowl run)) %rank-action !>([%add-category 10 "Best" "Albums" "2023"]))
::   =^  move  agent
::     (~(on-poke agent (bowl run)) %rank-action !>([%add-category 10 "Best" "Albums" "All-time"]))
::   =^  move  agent
::     (~(on-poke agent (bowl run)) %rank-action !>([%add-category 10 "Best" "Books" "All-time"]))
::   =+  !<(=state on-save:agent)
--
|%
::
::::  Test Category scrying.
  ::
++  test-agent-scrying-all-categories
  ;:  weld
  %+  expect-eq
    !>  3
    !>
      ^-  @
      ::
      :::: Setup
        ::
      =|  run=@ud
      =^  move  agent
        (~(on-poke agent (bowl run)) %rank-action !>([%add-category 10 "Best" "Albums" "2023"]))
      =^  move  agent
        (~(on-poke agent (bowl run)) %rank-action !>([%add-category 10 "Best" "Albums" "All-time"]))
      =^  move  agent
        (~(on-poke agent (bowl run)) %rank-action !>([%add-category 10 "Best" "Books" "All-time"]))
      =+  !<(=state on-save:agent)
      :: (setup)
      ::
      =/  path  ~['x' 'categories']
      =/  sr    (~(on-peek agent (bowl run)) path)
      =/  cage  (need (need sr))                   :: sr (scry result) is a (unit (unit cage))...
      =/  vase  (tail cage)                        :: the tail of the cage is a vase...
      (lent !<((list cate) vase))
  ==
++  test-agent-scrying-a-single-category
  ;:  weld
  %+  expect-eq
    !>  [id=[sh=~zod uu=~.jbl03.q1tnj] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.4.1..20.31.25..2be3 up=~ de=~ ri=0]]
    !>
      ^-  cate
      ::
      :::: Setup
        ::
      =|  run=@ud
        =^  move  agent  (~(on-poke agent (bowl run)) %rank-action !>([%add-category 10 "Best" "Albums" "2023"]))
      =+  !<(=state on-save:agent)
      ::
      =/  path  ~['x' 'category' '~.jbl03.q1tnj']
      =/  sr    (~(on-peek agent (bowl run)) path)
      =/  cage  (need (need sr))                   :: sr (scry result) is a (unit (unit cage))...
      =/  vase  (tail cage)                        :: the tail of the cage is a vase...
      !<(cate vase)
      :: ((lone cate) (tail (tail va)))      :: Works!
      :: !<(cate va)                      :: CRASHED /tests/agent/rank-scry/test-agent-scrying-a-category-via-on-peek
                                         :: -need.[sh=@p uu=@ta]
                                         ::  -have.%~
      :: !<(cate (tail (tail va)))        :: clay: read-at-tako fail [desk=%rank care=%a case=[%da p=~2024.5.30..20.27.03..9b56] path=/tests/agent/rank-scry/hoon]
                                         :: nest-fail
                                         :: -have.*
                                         :: -need.#t
                                         :: /tests/agent/rank-scry/hoon::[57 7].[57 31]>
      :: !<  [* cate]  va
  ==
::
::::  Test Subject scrying.
  ::
++  test-agent-scrying-all-subjects
  ;:  weld
  %+  expect-eq
    !>  3
    !>
      ^-  @
      ::
      :::: Setup
        ::
      =|  run=@ud
      =^  move  agent
        (~(on-poke agent (bowl run)) %rank-action !>([%add-subject "The Possessed" "Fyodor Dostoyevsky"]))
      =^  move  agent
        (~(on-poke agent (bowl run)) %rank-action !>([%add-subject "All the Pretty Horses" "Cormac McCarthy"]))
      =^  move  agent
        (~(on-poke agent (bowl run)) %rank-action !>([%add-subject "Gravity's Rainbow" "Thomas Pynchon"]))
      =+  !<(=state on-save:agent)
      ::
      =/  path  ~['x' 'subjects']
      =/  sr    (~(on-peek agent (bowl run)) path)
      =/  cage  (need (need sr))                   :: sr (scry result) is a (unit (unit cage))...
      =/  vase  (tail cage)                        :: the tail of the cage is a vase...
      (lent !<((list subj) vase))
  ==
--
