::
/+  *mip
|%
::
:::: Basic Application Data Structures
  ::
::
:::: A Mote is the basic structure for holding a single piece of durable, storable data.
  :: It is comprised of 2 sub-structues, metadata and a data .
  ::
  :: It is currently hard-coded here but eventually should become a generated
  :: type like list, set, &c.
  ::
+$  mote
  $:  me=meta
      da=(map @tas @)
  ==
::
:::: A Meta is the basic structure for holding the data about the data.
  :: Used for both a Mote and a Plex.
  ::
  :: It is a tuple of [UrbID Life Rift Timestamp]
  ::
+$  meta
  $:  id=uid
      lf=@u
      rf=@u
      ts=tsp
  ==
::
:::: A Plex is a structure for holding Motes. It is immutable so every mote "edit"
  ::   is an insert of a new entry in the mip (map of maps).
  ::
  :: It is currently hard-coded here but eventually should become a generated
  :: type like list, set, &c.
  ::
+$  plex
  $:  me=meta
      da=(mip @u @u (list mote))
  ==
::
:::: An UrbID (`uid`) is a [@p @ta] tuple containing a Ship name and a unique string.
  :: This is what we use to tag all our distributed structures so that they
  ::   can be properly sourced and synced.
  :: It needs to be a @ta not a tape because it will appear in scry paths.
  ::
+$  uid
  $:  sh=@p
      uu=@ta
  ==
::
:::: A Timestamp (`tsp`) is a [time u(time)] containing two times representing
  ::   the CReation and DEletion times.
  ::
  ::   NOTE: this is not called `time` to avoid conflicting with the urbit stdlib.
  ::
+$  tsp
 $:  cr=time
     de=(unit time)
  ==
::
:::: Application Mark Structures
  ::
+$  action
  $%
    [%add-category limit=@ud adjective=@t subject=@t period=@t]
    [%remove-category key=@ta]
    :: :-  %remove-category
    ::   $=  key  tape
    [%add-subject title=@t artist=@t]
    [%remove-subject key=@ta]
::
:::: THE FOLLOWING ARE FOR TESTING/DEBUG ONLY.
  ::
    [%purge-category key=@ta]
  ==
--