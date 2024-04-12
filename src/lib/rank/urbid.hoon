::
:::: Door for working with UrbIDs
  ::
/-  rank
/+  *string
::
|%
++  urbid
::
  :::: Needs a bowl as its sample
    ::
  |_  bowl=bowl:gall
::
:::: new
  ::
  :: Create a new unique UrbID
  ::
  ++  new
    ^-  uid:rank
    =/  uuid  (oust [0 6] (head (trim 17 (scow %uv eny.bowl))))
    :-  our.bowl  uuid
::
:::: get-key
  ::
  :: Answer the unique key string of an UrbID
  ::
  ++  get-key
    |=  uid=uid:rank
    ^-  tape
    uu.uid
::
:::: same
  ::
  :: Compare two UrbIDs to see if they are the same.
  ::
  ++  same
    |=  [u1=uid:rank u2=uid:rank]
    ^-  @
    =(uu:u1 uu:u2)
::
:::: to-tape
  ::
  :: Represent an UrbID as a tape.
  ::   e.g. "~zod:jbl03.q1tnj"
  ::
  ++  to-tape
    |=  uid=uid:rank
    ^-  tape
    (link "" (limo [(scow %p sh:uid) ":" uu:uid ~]))
  --
--