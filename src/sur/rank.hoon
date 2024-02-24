|%
::
:::: Basic Application Data Structures
  ::
::
:::: An Category (`cate`) is a tupe of [Limit Adjective Subject Period].
  :: The 10 Best Novels of The Twentieth Century
  ::
::
+$  cate
  $:  lim=@ud
      adj=tape
      sub=tape
      per=tape
  ==
::
:::: A Work is a [title, artist] tuple
::
+$  work
  $:  tit=tape
      art=tape
  ==
::
:::: A Rank is an [Ordinal, Work] tuple.
  ::
+$  rank
  $:  ord=@ud
      wrk=work
  ==
::
:::: A Ranking is a an Ordered Set of Ranks for a Category.
  ::
+$  ranking
  $:  cat=cate
      rks=(set rank)
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
      categories=(set cate)
      pals=(list @p)
      rankings=(list ranking)
  ==
::
+$  versioned-state
  $%  state-0
  ==
--