/+  *test
/+  rank
/+  work=rank-work
|%
++  test-making-a-work
  ;:  weld
  %+  expect-eq
    !>  [tit="The Possessed" art="Fyodor Dostoyevsky"]
    !>  (new:work ["The Possessed" "Fyodor Dostoyevsky"])
  ==
::
++  test-getting-a-works-artist
  ;:  weld
  %+  expect-eq
    !>  "Fyodor Dostoyevsky"
    !>  (get-artist:work (new:work ["The Possessed" "Fyodor Dostoyevsky"]))
  ==
::
++  test-getting-a-works-title
  ;:  weld
  %+  expect-eq
    !>  "The Possessed"
    !>  (get-title:work (new:work ["The Possessed" "Fyodor Dostoyevsky"]))
  ==
--
