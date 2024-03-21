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
    =/  uuid  (trim 10 (scow %uv eny.bowl))
    :-  our.bowl  p.uuid
::
:::: to-tape
  ::
  :: Represent an UrbID as a tape.
  ::
  ++  to-tape
    |=  uid=ubid:rank
    ^-  tape
    (link " " (limo [uuid:uid "on" (scow %p ship:uid) ~]))
  --
--