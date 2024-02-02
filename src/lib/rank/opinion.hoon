::
:::: Core for working with Opinions
  ::
/+  *string
|%
::
:::: Add a new Opinion to the state
  ::
++  to-tape
  |=  [adj=tape sub=tape lim=@ud]
  ^-  tape
  (link " " (limo [~(rud at lim) adj sub ~]))
--