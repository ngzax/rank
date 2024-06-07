/-  *rank
/+  *rank-timestamp
/+  *rank-urbid
/+  *string
::
|%
::
:::: a Door for working with Subjects
  ::
++  subject
  ::
  :::: Needs a bowl as its sample
    ::
  |_  bowl=bowl:gall
  ::
  :::: Answers a newly constructed Subject
    ::
  ++  new
    |=  [title=tape artist=tape]
    ^-  sbj
    =/  uid  ~(new urbid bowl)
    =/  tsp  ~(new timestamp bowl)
    [id=uid ti=title ar=artist ts=tsp]
  ::
  :::: Logically (soft) delete a new Subject from the state.
    ::   We can't hard delete because someone might still be referencing it.
    ::
  ++  del
    |=  sub=sbj
    ^-  sbj
    =.  ts.sub  (~(del timestamp bowl) ts.sub)
    sub
  ::
  :::: Answer the Subject's Artist
    ::
  ++  get-artist
    |=  sub=sbj
    ^-  tape
    ar.sub
  ::
  :::: Answers the Subject's Timestamp structure.
    ::
  ++  get-timestamp
    |=  sub=sbj
    ^-  tsp:rank
    ts.sub
  ::
  :::: Answer the Subject's Title
    ::
  ++  get-title
    |=  sub=sbj
    ^-  tape
    ti.sub
  ::
  :::: Answers the Subject's unique identifier
    ::
  ++  get-urbid
    |=  sub=sbj
    ^-  uid:rank
    id.sub
  ::
  :::: Represent a Subject as a tape.
    ::   e.g. "'The Possessed' by Fyodor Dostoyevsky"
    ::
  ++  to-tape
    |=  sub=sbj
    ^-  tape
    =/  qt  (link "" (limo "'" ti.sub "'" ~))
    (link " " (limo [qt "by" ar.sub ~]))
  --
--
