::
:::: a Door for working with Categories
  ::
/-  *rank
/+  *rank-timestamp
/+  *rank-urbid
/+  *string
::
|%
++  category
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
    ^-  cate
    =/  urid  ~(new urbid bowl)
    =/  tstp  ~(new timestamp bowl)
    [id=urid li=limit ad=adjective su=subject pe=period ts=tstp]
::
:::: get-timestamp
  ::
  :: Answers the Category's Timestamp structure.
  ::
  ++  get-timestamp
    |=  c=cate
    ^-  tstp:rank
    ts.c
::
:::: get-uid
  ::
  :: Answers the Category's unique identifier
  ::
  ++  get-urbid
    |=  c=cate
    ^-  urid:rank
    id.c
::
:::: to-tape
  ::
  :: Represent a Category as a tape.
  ::
  ++  to-tape
    |=  c=cate
    ^-  tape
    (link " " (limo ["The" ~(rud at li:c) ad:c su:c "of" pe:c ~]))
  --
--