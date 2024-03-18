/+  *test
/+  rank
/+  urbid=rank-urbid
|%
::
++  test-making-an-urbid
  ;:  weld
  %+  expect-eq
    !>  [ship=~zod uuid="hfgjhg"]
    !>  (new:urbid ~zod)
  ==
::
:: ++  test-category-to-tape
::   ;:  weld
::   %+  expect-eq
::     !>  "The 10 Best Books of All-time"
::     !>  (to-tape:category [10 "Best" "Books" "All-time"])
::   ==
--
