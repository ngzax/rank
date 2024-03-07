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
::
:::: Application Mark Structures
  ::
+$  action
  $%
    [%new-category limit=@ud adjective=tape subject=tape period=tape]
      :: [%del-book id=@ta]
      :: [%mod-book-name id=@ta title=@t]
      :: [%mod-rule-read id=@ta public-read=?]
      :: [%mod-rule-edit id=@ta =rule-edit]
      :: [%new-page book-id=@ta =path title=@t content=wain]
      :: [%del-page book-id=@ta =path]
      :: [%mod-page book-id=@ta =path title=(unit @t) content=(unit wain)]
      :: [%imp-file book-id=@ta files=(map @t wain) =title-source del-missing=?]
      :: [%knight book-id=@ta =ship]
      :: [%demote book-id=@ta =ship]
      :: [%banish book-id=@ta =ship]
      :: [%pardon book-id=@ta =ship]
  ==
--