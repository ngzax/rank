::
:::: Core for working with Categories
  ::
/+  *rank
/+  *string
|%
::
:::: new
  ::
  :: Add a new Category to the state
  ::
++  new
  |=  [limit=@ud adjective=tape subject=tape period=tape]
  ^-  cate
  [lim=limit adj=adjective sub=subject per=period]
::
:::: to-tape
  ::
  :: Represent a Category as a tape.
  ::
++  to-tape
  |=  cat=cate
  ^-  tape
  (link " " (limo ["The" ~(rud at lim:cat) adj:cat sub:cat "of" per:cat ~]))
--