::
:::: Unit test Core for Category
  ::
/+  *test
/+  rank
/+  *rank-category
::
:::: Provide a faked bowl for testing
  ::
:: |_  fake-bowl=bowl:gall
|%
::
++  test-making-a-category
  ;:  weld
  %+  expect-eq
    !>  [uid=[ship=~zod uuid="0v0"] lim=10 adj="Best" sub="Books" per="All-time"]
    !>
      ^-  cate:rank
      :: =.  fake-bowl  [our=~zod src=~zod dap=%ranl sap=/gall/dojo]
      (new:category [10 "Best" "Books" "All-time"])
      :: (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
  ==
::
++  test-has-a-unique-urbit-id
  ;:  weld
  %+  expect-eq
    !>  [ship=~zod uuid="0v0"]
    !>
      ^-  ubid:rank
      :: =.  fake-bowl  [our=~zod src=~zod dap=%ranl sap=/gall/dojo]
      =/  cat  (new:category [10 "Best" "Books" "All-time"])
      :: =/  cat  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      (get-urbid:category cat)
  ==
::
++  test-category-to-tape
  ;:  weld
  %+  expect-eq
    !>  "The 10 Best Books of All-time"
    !>
      ^-  tape
      :: =.  fake-bowl  [our=~zod src=~zod dap=%ranl sap=/gall/dojo]
      =/  cat  (new:category [10 "Best" "Books" "All-time"])
      :: =/  cat  (~(new category fake-bowl) [10 "Best" "Books" "All-time"])
      (to-tape:category cat)
  ==
--
