::
:::: Core for working with Ranks
  ::
/-  *rank
:: /+  *rank-category
:: /+  *rank-ranking
:: /+  *rank-urbid
/+  *string
::
|%
++  ranking
::
:::: Needs a bowl as its sample
  ::
  |_  bowl=bowl:gall
::
:::: Answers a newly constructed Ranking with a Subject Xref and empty Rankings
  ::
  ++  new
    |=  c=ctg
    ^-  rkg
    :-  id.c  ~
::
:::: Answers the UrbID Xref of the Ranking's Subject
  ::
  ++  get-subject-xref
    |=  r=rkg
    ^-  uid
    cx.r
::
:::: same
  ::
  :: Compare two UrbIDs to see if they are the same.
  ::
  :: ++  same
  ::   |=  [u1=uid:rank u2=uid:rank]
  ::   ^-  @
  ::   =(uu:u1 uu:u2)
::
:::: to-tape
  ::
  :: Represent an UrbID as a tape.
  ::   e.g. "~zod:jbl03.q1tnj"
  ::
  :: ++  to-tape
  ::   |=  uid=uid:rank
  ::   ^-  tape
  ::   (link "" (limo [(scow %p sh:uid) ":" uu:uid ~]))
  --
--