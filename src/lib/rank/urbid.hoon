::
:::: Core for working with UrbIDs
  ::
/-  *rank
::
|%
:: |_  =bowl:gall
::
:::: new
  ::
  :: Create a new unique UrbID
  ::
++  new
  |=  bol=bowl:gall
  ^-  ubid
  =/  uuid  (trim 10 (scow %uv eny.bol))
  :: :-  who  p.uuid
  :-  our.bol  p.uuid
::
:::: to-tape
  ::
  :: Represent a Category as a tape.
  ::
:: ++  to-tape
::   |=  cat=cate:rank
::   ^-  tape
::   (link " " (limo ["The" ~(rud at lim:cat) adj:cat sub:cat "of" per:cat ~]))
--