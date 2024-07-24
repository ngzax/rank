::
:::: Door for working with Ranks
  ::
/-  *rank
/-  *rank-category
/-  *rank-ranking
::
/+  *rank-category
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
  |=  c=cate
  ^-  rnkg
  :-  c  ~
::
:::: Adds (Appends) a Subject to the bottom our Rankings
  ::
++  add-subject
  |=  [r=rnkg s=subj]
  ^-  rnkg
  ?:  =((ranking-count r) (get-max-subjects r))
    r
  =.  ra.r  (weld ra.r (limo [s ~]))
  r
::
:::: Adds (Appends) multiple Subjects to the bottom our Rankings
  ::
++  add-subjects
  |=  [r=rnkg s=(list subj)]
  ^-  rnkg
  ?:  (gth (add (ranking-count r) (lent s)) (get-max-subjects r))
    r
  =.  ra.r  (weld ra.r s)
  r
::
:::: Answers the Ranking's Category
  ::
++  get-category
  |=  r=rnkg
  ^-  cate
  ca.r
::
:::: Answers the maximum number of Subjects that can be ranked
  ::
++  get-max-subjects
  |=  r=rnkg
  ^-  @ud
  :: =/  c  (get-category r)
  (get-limit:category ca.r)
::
:::: Answers the Ranking's List of Subjects
  ::
++  get-subjects
  |=  r=rnkg
  ^-  (list subj)
  ra.r
::
:::: Adds (Pushes) a Subject to the top of our Rankings
  ::
++  push-subject
  |=  [r=rnkg s=subj]
  ^-  rnkg
  ?:  =((ranking-count r) (get-max-subjects r))
    r
  =.  ra.r  (weld (limo [s ~]) ra.r)
  r
::
:::: Adds (Pushes) multiple Subjects to the front (top) of our Rankings
  ::
++  push-subjects
  |=  [r=rnkg l=(list subj)]
  ^-  rnkg
  ?:  (gth (add (ranking-count r) (lent l)) (get-max-subjects r))
    r
  =.  ra.r  (weld l ra.r)
  r
::
:::: Answers the Count of this Ranking's Subjects
  ::
++  ranking-count
  |=  r=rnkg
  ^-  @
  (lent ra.r)
--
--