/+  *test
/+  rank
/+  opinion=rank-opinion
|%
::
:::: new-opinion - Make a new Opinion
  ::
++  test-making-an-opinion
  ;:  weld
  %+  expect-eq
    !>  "10 Best Books"
    !>  (new-opinion:rank ["Best" "Books" 10])
::
:::: Display an Opinion as a tape
  ::
++  test-opinion-to-tape
  ;:  weld
  %+  expect-eq
    !>  "10 Best Books"
    !>  (to-tape:opinion ["Best" "Books" 10])
  ==
--
