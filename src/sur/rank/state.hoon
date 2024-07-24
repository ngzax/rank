/-  rank
/-  *rank-category
/-  *rank-ranking
/-  *rank-subject
::
|%
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
      rankings=(list rnkg)
      subjects=(list subj)
  ==
::
+$  versioned-state
  $%  state-0
  ==
--