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
    ^-  urid:rank
    =/  uuid  (oust [0 6] (head (trim 17 (scow %uv eny.bowl))))
    :-  our.bowl  uuid
::
:::: get-key
  ::
  :: Answer the unique key string of an UrbID
  ::
  ++  get-key
    |=  urid=urid:rank
    ^-  tape
    uu.urid
::
:::: same
  ::
  :: Compare two UrbIDs to see if they are the same.
  ::
  ++  same
    |=  [u1=urid:rank u2=urid:rank]
    ^-  @
    =(uu:u1 uu:u2)
::
:::: to-tape
  ::
  :: Represent an UrbID as a tape.
  ::   e.g. "~zod:jbl03.q1tnj"
  ::
  ++  to-tape
    |=  urid=urid:rank
    ^-  tape
    (link "" (limo [(scow %p sh:urid) ":" uu:urid ~]))
  --
--