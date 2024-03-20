::
:::: a Door for working with Categories
  ::
/-  rank
/+  urbid=rank-urbid
/+  *string
::
:::: Needs a bowl as its sample
  ::
|_  bowl=bowl:gall
::
:::: new
  ::
  :: Add a new Category to the state
  ::
++  new
  |=  [limit=@ud adjective=tape subject=tape period=tape]
  ^-  cate:rank
  =/  ubid  ~(new urbid bowl)
  [uid=ubid lim=limit adj=adjective sub=subject per=period]
::
:::: get-uid
  ::
  :: Answers the Category's unique identifier
  ::
++  get-urbid
  |=  cat=cate:rank
  ^-  ubid:rank
  uid.cat
::
:::: to-tape
  ::
  :: Represent a Category as a tape.
  ::
++  to-tape
  |=  cat=cate:rank
  ^-  tape
  (link " " (limo ["The" ~(rud at lim:cat) adj:cat sub:cat "of" per:cat ~]))
--