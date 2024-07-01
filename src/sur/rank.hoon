|%
::
:::: Basic Application Data Structures
  ::
::
:::: A Mote is the basic structure for holding durable, storable data.
  :: It is comprised of 2 sub-structues, metadata and a data .
  ::
  :: It is currently hard-coded here but eventually should become a generated
  :: type like list, set, &c.
  ::
+$  mote
  $:  me=meta
      da=(list *)
  ==
::
:::: A Meta is the basic structure for holding the data about the data.
  :: Used for both a Mote and a Plex.
  ::
+$  meta
  $:  id=uid
      li=@u
      ri=@tas
      ts=tsp
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
:::: A Timestamp (`tsp`) is a [time u(time) u(time) @u] containing three times representing
  ::   the CReation, Last UPdate, and DEletion times and the RIft (or continuity number,
  ::   it is a count of the number of times that a value has changed) for an Entity.
  ::
  ::   NOTE: this is not called `time` to avoid conflicting with the urbit stdlib.
  ::   NOTE: An immutable will always have up=~ and ri=0.
  ::
+$  tsp
 $:  cr=time
     de=(unit time)
     ri=@u
  ==
::
:::: Application Mark Structures
  ::
+$  action
  $%
    [%add-category limit=@ud adjective=tape subject=tape period=tape]
    [%remove-category key=@ta]
    :: :-  %remove-category
    ::   $=  key  tape
    [%add-subject title=tape artist=tape]
    [%remove-subject key=@ta]
::
:::: THE FOLLOWING ARE FOR TESTING/DEBUG ONLY.
  ::
    [%purge-category key=@ta]
  ==
--