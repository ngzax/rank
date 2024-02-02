/+  *test, *rank, *regex
|%
::
:::: sub:regex - Replace the first match of a regular expression.
  ::
++  test-first-match
  ;:  weld
  %+  expect-eq
    !>  "HOON hoon hoon"
    !>  (sub:regex "(?i)hoon" "HOON" "Hoon hoon hoon")
  ::
  %+  expect-eq
    !>  "Hoon HOON hoon"
    !>  (sub:regex "hoon" "HOON" "Hoon hoon hoon")
  ==
::
:::: gsub:regex - Replace the all matches of a regular expression.
  ::
++  test-all-matches
  ;:  weld
  %+  expect-eq
    !>  "HOON HOON HOON"
    !>  (gsub:regex "(?i)hoon" "HOON" "Hoon hoon hoon")
  ::
  %+  expect-eq
    !>  "Hoon HOON HOON"
    !>  (gsub:regex "hoon" "HOON" "Hoon hoon hoon")
  ==
::
:::: new-opinion - Make a new Opinion
  ::
++  test-making-an-opinion
  ;:  weld
  %+  expect-eq
    !>  "10 Best Books"
    !>  (new-opinion ["Best" "Books" 10])
  ==
::
:::: split-on:rank - Replace the all matches of a regular expression.
  ::
:: ++  test-lim-is-a-ud
::   ;:  weld
::   %+  expect-eq
::     !>  ["two" "words"]
::     !>  (split-on:rank ["two-words" "-"])
::   ==
--
