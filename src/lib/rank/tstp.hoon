::
:::: Door for working with UrbIDs
  ::
/-  rank
/+  *string
::
|%
++  tstp
::
  :::: Needs a bowl as its sample
    ::
  |_  bowl=bowl:gall
::
:::: new
  ::
  :: Create a new Timestamp
  ::
  ++  new
    ^-  tstp:rank
    [cr=now.bowl up=~ de=~]
::
:::: upd
  ::
  :: Update a Timestamp
  ::
  ++  upd
    |=  t=tstp:rank
    ^-  tstp:rank
    [cr=cr.t up=[~ now.bowl] de=~]
::
:::: del
  :: "Delete" a Timestamp
  ::
  ++  del
    |=  t=tstp:rank
    ^-  tstp:rank
    [cr=cr.t up=up.t de=(some now.bowl)]
  --
--