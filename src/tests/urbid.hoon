/+  *test
/+  rank
/+  urbid=rank-urbid
::
|_  =bowl:gall
::
++  test-making-an-urbid
  ;:  weld
  %+  expect-eq
    !>  [ship=our.bowl uuid=eny.bowl]
    !>  (new:urbid [our.bowl eny.bowl])
  ==
::
:: ++  test-category-to-tape
::   ;:  weld
::   %+  expect-eq
::     !>  "The 10 Best Books of All-time"
::     !>  (to-tape:category [10 "Best" "Books" "All-time"])
::   ==
--
