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
    ^-  ubid:rank
    =/  uuid  (oust [0 6] (head (trim 17 (scow %uv eny.bowl))))
    :-  our.bowl  uuid
::
:::: to-tape
  ::
  :: Represent an UrbID as a tape.
  ::
  ++  to-tape
    |=  uid=ubid:rank
    ^-  tape
    (link "" (limo [(scow %p ship:uid) ":" uuid:uid ~]))
  --
--