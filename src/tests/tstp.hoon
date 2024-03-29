::
:::: Unit test Core for Time
  ::
/+  *test
/+  rank
/+  *rank-tstp
::
:::: Provide a faked bowl for testing
  ::
|_  fake-bowl=bowl:gall
::
:::: By default, a time takes `now` from the bowl as it's "creation" time
  ::   and initially sets 'updated' and 'deleted' to ~.
++  test-tstp-creation
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.3.29..17.25.38..6a05 up=~ de=~]
    !>
      ^-  tstp:rank
      =.  now.fake-bowl  ~2024.3.29..17.25.38..6a05
      ~(new tstp fake-bowl)
  ==

++  test-tstp-update
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.3.29..17.25.38..6a05 up=[~ ~2024.3.29..17.50.15..6adf] de=~]
    !>
      ^-  tstp:rank
      =.  now.fake-bowl  ~2024.3.29..17.25.38..6a05
      :: Initial creation...
      =/  t  ~(new tstp fake-bowl)
      :: Now some time later...
      =.  now.fake-bowl  ~2024.3.29..17.50.15..6adf
      (~(upd tstp fake-bowl) t)
  ==
::
++  test-tstp-delete-no-update
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.3.29..17.25.38..6a05 up=~ de=[~ ~2024.3.29..17.50.15..6adf]]
    !>
      ^-  tstp:rank
      =.  now.fake-bowl  ~2024.3.29..17.25.38..6a05
      :: Initial creation...
      =/  t  ~(new tstp fake-bowl)
      :: Now some time later...
      =.  now.fake-bowl  ~2024.3.29..17.50.15..6adf
      (~(del tstp fake-bowl) t)
  ==
--
