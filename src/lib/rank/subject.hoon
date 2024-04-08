::
:::: a Door for working with Subjects
  ::
/-  *rank
/+  *rank-timestamp
/+  *rank-urbid
/+  *string
::
|%
++  subject
::
:::: Needs a bowl as its sample
  ::
  |_  bowl=bowl:gall
::
:::: new
  ::
  :: Add a new Subject to the state
  ::
  ++  new
    |=  [title=tape artist=tape]
    ^-  subj
    =/  urid  ~(new urbid bowl)
    =/  tstp  ~(new timestamp bowl)
    [id=urid ti=title ar=artist ts=tstp]
  ::
  :::: Answer the Subject's Artist
    ::
  ++  get-artist
    |=  sub=subj
    ^-  tape
    ar.sub
  ::
  :::: Answer the Subject's Title
    ::
  ++  get-title
    |=  sub=subj
    ^-  tape
    ti.sub
  ::
  :::: to-tape
    ::
    :: Represent a Subject as a tape.
    ::   e.g. "'The Possessed' by Fyodor Dostoyevsky"
    ::
  ++  to-tape
    |=  sub=subj
    ^-  tape
    =/  qt  (link "" (limo "'" ti.sub "'" ~))
    (link " " (limo [qt "by" ar.sub ~]))
  --
--
