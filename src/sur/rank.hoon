|%
::
:::: Basic App Data Structures
  ::
+$  adj  @t
+$  sub  @t
+$  lim  @ud
+$  lst  [=adj =sub =lim]
::
:::: Display State (mast)
  ::
+$  app      [color-one=tape color-two=tape letters=(list [l=@t id=@ud])]
+$  display  $~([[%html ~] [[%head ~] ~] [[%body ~] ~] ~] manx)
+$  state    [=app =display current-url=path]
::
:::: Stored App State
  ::
+$  versioned-state
  $%  state-0
  ==
::
+$  state-0
  $:  %0
    lists=(map @p lst)
  ==
--