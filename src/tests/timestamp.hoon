::
:::: Unit test Core for Time
  ::
/+  *test
/+  rank
/+  *rank-timestamp
::
:::: Provide a faked bowl for testing
  ::
|_  fake-bowl=bowl:gall
::
:::: By default, a time takes `now` from the bowl as it's "creation" time
  ::   and initially sets 'updated' and 'deleted' to ~.
++  test-timestamp-creation
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.3.29..17.25.38..6a05 de=~]
    !>
      ^-  tsp:rank
      =.  now.fake-bowl  ~2024.3.29..17.25.38..6a05
      ~(new timestamp fake-bowl)
  ==
::
:::: When a timestamp updates, the rift increases
  :: NOTE: This is temporary behavior that will be removed shortly when
  ::   rift moves upward to the mote.
++  test-timestamp-update
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.3.29..17.25.38..6a05 de=~]
    !>
      ^-  tsp:rank
      =.  now.fake-bowl  ~2024.3.29..17.25.38..6a05
      :: Initial creation...
      =/  t  ~(new timestamp fake-bowl)
      :: Now some time later...
      =.  now.fake-bowl  ~2024.3.29..17.50.15..6adf
      (~(upd timestamp fake-bowl) t)
  ==
::
++  test-timestamp-delete-no-update
  ;:  weld
  %+  expect-eq
    !>  [cr=~2024.3.29..17.25.38..6a05 de=[~ ~2024.3.29..17.50.15..6adf]]
    !>
      ^-  tsp:rank
      =.  now.fake-bowl  ~2024.3.29..17.25.38..6a05
      :: Initial creation...
      =/  t  ~(new timestamp fake-bowl)
      :: Now some time later...
      =.  now.fake-bowl  ~2024.3.29..17.50.15..6adf
      (~(del timestamp fake-bowl) t)
  ==
--
