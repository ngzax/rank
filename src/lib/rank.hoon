::
:::: Helper Core
  ::
/-  *rank
/+  regex
/+  string
::
|%
::
:::: This is the primary entry function for interacting with
  :: your rank's state.
  ::
:: ++  handle-action
::   |=  =act
::   ^-  (quip card _state)
::   ::
::   :: Switch on the head of the passed action structure...
::   ?-  -.act
::     ::
::       %new-category
::     =/  =ctg  (new:category [lim.act adj.act sum.act per.act])
::     :_  %=  state
::           categories  (~(put in categories) ctg)
::         ==
::     :: :~  (fact:io rank-update+!>(`upd`[%init gid club acl ppl]) ~[/local/all])
::     ==
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