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
    !>  (new:category [10 "Best" "Books" "All-time"])
  ==
::
++  test-category-to-tape
  ;:  weld
  %+  expect-eq
    !>  "The 10 Best Books of All-time"
    !>
      ^-  tape
      =/  cat  (new:category [10 "Best" "Books" "All-time"])
      (to-tape:category cat)
  ==
--
