/+  *test
/+  rank
/+  work=rank-work
|%
++  test-making-a-work
  ;:  weld
  %+  expect-eq
    !>  [ti="The Possessed" ar="Fyodor Dostoyevsky"]
    !>  (new:work ["The Possessed" "Fyodor Dostoyevsky"])
  ==
::
++  test-work-to-tape
  ;:  weld
  %+  expect-eq
    !>  "'The Possessed' by Fyodor Dostoyevsky"
    !>
      ^-  tape
      =/  w  (new:work ["The Possessed" "Fyodor Dostoyevsky"])
      (to-tape:work w)
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
