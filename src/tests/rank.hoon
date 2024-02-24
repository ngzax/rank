/+  *test
/+  rank
/+  category=rank-category
/+  work=rank-work
|%
::
++  test-making-a-category
  ;:  weld
  %+  expect-eq
    !>  [lim=10 adj="Best" sub="Books" per="All-time"]
    !>  (new:category [10 "Best" "Books" "All-time"])
  ==
::
++  test-category-to-tape
  ;:  weld
  %+  expect-eq
    !>  "The 10 Best Books of All-time"
    !>  (to-tape:category [10 "Best" "Books" "All-time"])
  ==
--
