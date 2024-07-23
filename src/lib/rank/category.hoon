::
:::: a Door for working with Categories
  ::
/-  *rank
/-  *rank-category
::
:::: Lib Dependencies
  ::
/+  *rank-timestamp
/+  *rank-urbid
/+  *string
::
|%
++  category
  ::
  :::: Needs a bowl as its sample
    ::
  |_  bowl=bowl:gall
  ::
  :::: Answers a newly Constructed Category
    ::
  ++  new
    |=  [limit=@ud adjective=tape subject=tape period=tape]
    ^-  cate
    =/  uid  ~(new urbid bowl)
    =/  tsp  ~(new timestamp bowl)
    [me=[id=uid lf=0 rf='0' ts=tsp] da=(malt (limo ~[li+limit ad+(crip adjective)])) ad=adjective su=subject pe=period]
  ::
  :::: Logically (soft) delete a Category.
    ::   We can't hard delete because someone might still be referencing it.
    ::
  ++  del
    |=  c=cate
    ^-  cate
    =.  ts.me.c  (~(del timestamp bowl) ts.me.c)
    c
  ::
  :::: Answers the Category's Adjective.
    ::
  ++  get-adjective
    |=  c=cate
    ^-  @t
    (~(got by da.c) %ad)
  ::
  :::: Answers the Category's Life, which is how many times it has been edited.
    ::
  ++  get-life
    |=  c=cate
    ^-  @u
    lf.me.c
  ::
  :::: Answers the Category's Limit.
    ::
  ++  get-limit
    |=  c=cate
    ^-  @u
    (~(got by da.c) %li)
  ::
  :::: Answers the Category's Rift, which is the current version of it's schema.
    ::
  ++  get-rift
    |=  c=cate
    ^-  @tas
    rf.me.c
  ::
  :::: Answers the Category's Timestamp structure.
    ::
  ++  get-timestamp
    |=  c=cate
    ^-  tsp:rank
    ts.me.c
::
:::: get-uid
  ::
  :: Answers the Category's unique identifier
  ::
  ++  get-urbid
    |=  c=cate
    ^-  uid:rank
    id.me.c
::
:::: Represent a Category as a cord.
  ::
  ++  to-cord
    |=  c=cate
    ^-  @t
    (crip (to-tape c))
::
:::: Represent a Category as a tape.
  ::
  ++  to-tape
    |=  c=cate
    ^-  tape
    (link " " (limo ["The" ~(rud at (get-limit c)) ad.c su.c "of" pe.c ~]))
  --
--