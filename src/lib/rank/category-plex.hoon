::
:::: a Door for working with Category Plexes
  ::
::
:::: Structure Dependencies
  ::
/-  *rank
/-  *rank-category
::
:::: Lib Dependencies
  ::
/+  mip
/+  *rank-timestamp
/+  *rank-urbid
:: /+  *string
::
|%
++  category-plex
  ::
  :::: Needs a bowl as its sample
    ::
  |_  bowl=bowl:gall
  ::
  :::: Answers a newly Constructed Category
    ::
  ++  new
    |=  [c=cate]
    ^-  cateplex
    =/  uid  ~(new urbid bowl)
    =/  tsp  ~(new timestamp bowl)
    =/  cp   (~(put bi:mip *(mip:mip @u @u (list cate))) 0 0 ~[c])
    [me=[id=uid lf=0 rf=0 ts=tsp] da=cp]
  --
--
