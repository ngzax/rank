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
:::: del
  ::
  :: Logically (soft) delete a new Subject from the state.
  ::   We can't hard delete because someone might still be referencing it.
  ::
  ++  del
    |=  sub=subj
    ^-  subj
    =.  ts.sub  (~(del timestamp bowl) ts.sub)
    sub
  ::
  :::: Answer the Subject's Artist
    ::
  ++  get-artist
    |=  sub=subj
    ^-  tape
    ar.sub
::
:::: get-timestamp
  ::
  :: Answers the Subject's Timestamp structure.
  ::
  ++  get-timestamp
    |=  sub=subj
    ^-  tstp:rank
    ts.sub
  ::
  :::: Answer the Subject's Title
    ::
  ++  get-title
    |=  sub=subj
    ^-  tape
    ti.sub
::
:::: get-urbid
  ::
  :: Answers the Subject's unique identifier
  ::
  ++  get-urbid
    |=  sub=subj
    ^-  urid:rank
    id.sub
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
