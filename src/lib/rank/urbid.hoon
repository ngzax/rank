::
:::: Core for working with UrbIDs
  ::
/-  *rank
::
|%
::
:::: new
  ::
  :: Create a new unique UrbID
  ::
++  new
  |=  [who=@p]
  ^-  ubid:rank
  :-  who  "hfgjhg"
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