::
:::: Core for working with Works
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
  |=  [t=tape a=tape]
  ^-  work
  [tit=t art=a]
::
:::: Answer the work's Artist
  ::
++  get-artist
  |=  w=work
  ^-  tape
  art.w
::
:::: Answer the work's Title
  ::
++  get-title
  |=  w=work
  ^-  tape
  tit.w
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