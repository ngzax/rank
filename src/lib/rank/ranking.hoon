::
:::: Door for working with Ranks
  ::
/-  *rank
/+  *string
::
|%
++  ranking
::
:::: Needs a bowl as its sample
  ::
  |_  bowl=bowl:gall
  ::
  :::: Answers a newly constructed Ranking with a Subject Xref and empty Rankings
    ::
  ++  new
    |=  c=ctg
    ^-  rkg
    :-  c  ~
  ::
  :::: Adds (Appends) a Subject to the bottom our Rankings
    ::
  ++  add-subject
    |=  [r=rkg s=sbj]
    ^-  rkg
    =.  ra.r  (weld ra.r (limo [s ~]))
    r
  ::
  :::: Adds (Appends) multiple Subjects to the bottom our Rankings
    ::
  ++  add-subjects
    |=  [r=rkg s=(list sbj)]
    ^-  rkg
    =.  ra.r  (weld ra.r s)
    r
  ::
  :::: Answers the Ranking's Category
    ::
  ++  get-category
    |=  r=rkg
    ^-  ctg
    ca.r
  ::
  :::: Answers the Ranking's List of Subjects
    ::
  ++  get-subjects
    |=  r=rkg
    ^-  (list sbj)
    ra.r
  ::
  :::: Adds (Pushes) a Subject to the top of our Rankings
    ::
  ++  push-subject
    |=  [r=rkg s=sbj]
    ^-  rkg
    =.  ra.r  (weld (limo [s ~]) ra.r)
    r
  ::
  :::: Answers the Count of this Ranking's Subjects
    ::
  ++  ranking-count
    |=  r=rkg
    ^-  @
    (lent ra.r)
  --
--