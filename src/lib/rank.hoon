::
:::: Helper Core
  ::
/-  *rank
/+  regex
/+  string
|%
::
:::: Add a new Opinion to the state
  ::
++  new-opinion
  |=  [adj=tape sub=tape lim=@ud]
  ^-  tape
  (link:string " " (limo [~(rud at lim) adj sub ~]))
::
:: same idea as partition:string but safer and maybe more efficient
::
++  split-on
  |*  [log=(list *) div=*]
  ^-  [pre=_log suf=_log]
  =/  pre=_log  ~
  |-
  ?:  =(~ log)      [pre ~]
  ?:  =(div -.log)  [pre +.log]
  $(pre (snoc pre -.log), log +.log)
--