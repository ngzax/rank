|%
::
:::: Basic Application Data Structures
  ::
::
:::: An Opinion is an [Limit Adjective Subject].
  :: The 10 Best Books
  ::
+$  lim  @ud
+$  adj  tape
+$  sub  tape
+$  opinion  [=adj =sub =lim]
::
:::: A Ranking is a Ordered Set of [ordinal, value] tuples.
  ::
+$  ord  @ud
+$  val  @ud
+$  ranking  [=opinion ranks=(set [=ord =val])]
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
    rankings=(map @p ranking)
  ==
::
+$  versioned-state
  $%  state-0
  ==
--