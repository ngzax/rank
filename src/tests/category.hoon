/+  *test
/+  rank
/+  category=rank-category
::
|_  =bowl:gall
::
++  test-making-a-category
  ;:  weld
  %+  expect-eq
    !>  [uid=[ship=~zod uuid="hfgjhg"] lim=10 adj="Best" sub="Books" per="All-time"]
    !>  (new:category [bowl 10 "Best" "Books" "All-time"])
  ==
::
++  test-has-a-unique-urbit-id
  ;:  weld
  %+  expect-eq
    !>  [ship=~zod uuid="hfgjhg"]
    !>
      ^-  ubid:rank
      =/  cat  (new:category [bowl 10 "Best" "Books" "All-time"])
      (get-urbid:category cat)
  ==
::
++  test-category-to-tape
  ;:  weld
  %+  expect-eq
    !>  "The 10 Best Books of All-time"
    !>
      ^-  tape
      =/  cat  (new:category [bowl 10 "Best" "Books" "All-time"])
      (to-tape:category cat)
  ==
--
