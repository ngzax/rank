/-  *rank
/-  *rank-subject
::
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
    ^-  subj
    =/  uid  ~(new urbid bowl)
    =/  tsp  ~(new timestamp bowl)
    [me=[id=uid lf=0 rf='0' ts=tsp] ti=title ar=artist]
  ::
  :::: Logically (soft) delete a new Subject from the state.
    ::   We can't hard delete because someone might still be referencing it.
    ::
  ++  del
    |=  sub=subj
    ^-  subj
    =.  ts.me.sub  (~(del timestamp bowl) ts.me.sub)
    sub
  ::
  :::: Answer the Subject's Artist
    ::
  ++  get-artist
    |=  sub=subj
    ^-  tape
    ar.sub
  ::
  :::: Answers the Subject's Life, which is how many times it has been edited.
    ::
  ++  get-life
    |=  sub=subj
    ^-  @u
    lf.me.sub
  ::
  :::: Answers the Subject's Rift, which is the current version of it's schema.
    ::
  ++  get-rift
    |=  sub=subj
    ^-  @tas
    rf.me.sub
  ::
  :::: Answers the Subject's Timestamp structure.
    ::
  ++  get-timestamp
    |=  sub=subj
    ^-  tsp:rank
    ts.me.sub
  ::
  :::: Answer the Subject's Title
    ::
  ++  get-title
    |=  sub=subj
    ^-  tape
    ti.sub
  ::
  :::: Answers the Subject's unique identifier
    ::
  ++  get-urbid
    |=  sub=subj
    ^-  uid:rank
    id.me.sub
  ::
  :::: Represent a Subject as a tape.
    ::   e.g. "'The Possessed' by Fyodor Dostoyevsky"
    ::
  ++  to-tape
    |=  sub=subj
    ^-  tape
    =/  qt  (link "" (limo "'" ti.sub "'" ~))
    (link " " (limo [qt "by" ar.sub ~]))
  --
--
