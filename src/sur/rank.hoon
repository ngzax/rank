|%
::
:::: Basic Application Data Structures
  ::
::
:::: An UrbID (`urid`) is a [@p tape] tuple containing a Ship name and a unique string.
  :: This is what we use to tag all our distributed structures so that they
  ::   can be properly sourced and synced.
  ::
+$  urid
  $:  sh=@p
      uu=tape
  ==
::
:::: A Timestamp (`tstp`) is a [@da @da @da] containing three times representing
  ::   the CReation, Last UPdate, and DEletion times for an Entity.
  ::
  ::   NOTE: this is not called `time` to avoid conflicting with the urbit stdlib.
  ::
+$  tstp
 $:  cr=time
      up=(unit time)
      de=(unit time)
  ==
::
:::: An Category (`cate`) is a tuple of [Limit Adjective Subject Period].
  :: The 10 Best Novels of The Twentieth Century
  ::
::
+$  cate
  $:  id=urid
      li=@ud
      ad=tape
      su=tape
      pe=tape
  ==
::
:::: A Work is a [title, artist] tuple
::
+$  work
  $:  ti=tape
      ar=tape
  ==
::
:::: A Rank is an [Ordinal, Work] tuple.
  ::
+$  rank
  $:  od=@ud
      wr=work
  ==
::
:::: A Ranking is a an Ordered Set of Ranks for a Category.
  ::
+$  ranking
  $:  ca=cate
      rk=(set rank)
  ==
::
:::: Display State (mast)
  ::
+$  app            [color-one=tape color-two=tape letters=(list [l=@t id=@ud])]
+$  display        $~([[%html ~] [[%head ~] ~] [[%body ~] ~] ~] manx)
+$  display-state  [=app =display current-url=path]
::
:::: Stored App State
  ::
+$  state-0
  $:  %0
      display-state
      categories=(list cate)
      pals=(list @p)
      rankings=(list ranking)
  ==
::
+$  versioned-state
  $%  state-0
  ==
::
:::: Application Mark Structures
  ::
+$  action
  $%
    [%add-category limit=@ud adjective=tape subject=tape period=tape]
    [%purge-category key=tape]
  ==
--