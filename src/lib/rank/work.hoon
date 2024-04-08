::
:::: a Door for working with Works
  ::
/-  rank
/+  *rank-timestamp
/+  *rank-urbid
/+  *string
::
|%
++  work
::
:::: Needs a bowl as its sample
  ::
  |_  bowl=bowl:gall
::
:::: new
  ::
  :: Add a new Work to the state
  ::
  ++  new
    |=  [title=tape artist=tape]
    ^-  work:rank
    =/  urid  ~(new urbid bowl)
    =/  tstp  ~(new timestamp bowl)
    [id=urid ti=title ar=artist ts=tstp]
  ::
  :::: Answer the work's Artist
    ::
  ++  get-artist
    |=  w=work:rank
    ^-  tape
    ar.w
  ::
  :::: Answer the work's Title
    ::
  ++  get-title
    |=  w=work:rank
    ^-  tape
    ti.w
  ::
  :::: to-tape
    ::
    :: Represent a Work as a tape.
    ::   e.g. "'The Possessed' by Fyodor Dostoyevsky"
    ::
  ++  to-tape
    |=  w=work:rank
    ^-  tape
    =/  qt  (link "" (limo "'" ti.w "'" ~))
    (link " " (limo [qt "by" ar.w ~]))
  --
--
