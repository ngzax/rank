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
  [ti=t ar=a]
::
:::: Answer the work's Artist
  ::
++  get-artist
  |=  w=work
  ^-  tape
  ar.w
::
:::: Answer the work's Title
  ::
++  get-title
  |=  w=work
  ^-  tape
  ti.w
::
:::: to-tape
  ::
  :: Represent a Work as a tape.
  ::   e.g. "'The Possessed' by Fyodor Dostoyevsky"
  ::
++  to-tape
  |=  w=work
  ^-  tape
  =/  qt  (link "" (limo "'" ti.w "'" ~))
  (link " " (limo [qt "by" ar.w ~]))
--