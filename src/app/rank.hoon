/-  *rank
::
:::: External Library dependencies
  ::
/+  agentio, dbug, default-agent
/+  mast
/+  verb
::
/+  *rank
/+  *rank-category
/+  *rank-subject
::
/=  index       /app/rank/index
/=  list        /app/rank/list
/=  stylesheet  /app/rank/stylesheet
::
::::  types core
  ::
|%
+$  card  card:agent:gall
--
::
::  debugging tools
::
%+  verb  |
%-  agent:dbug
::
::  Application State
::
=|  state-0
=*  state  -
::
::  This is a %gall agent core
^-  agent:gall
:: compose helper core into agent core
::
=<
:: A Gall agent is a Door which has a Bowl as its sample
::
|_  =bowl:gall
::
+*  this  .
    def     ~(. (default-agent this %.n) bowl)
    io      ~(. agentio bowl)
    helper  ~(. +> bowl)
    :: a list of cells of url paths to gates (your sail components), are required for rig:mast.
    :: see the example sail component for more information.
    :: these define all of the different pages for your app.
    routes  %-  limo  :~
        :-  /rank       index
        :-  /rank/list  list
      ==
:: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: ::
++  on-init
  ^-  (quip card _this)
  :_  this
  :: binding the base url:
  [(~(arvo pass:io /bind) %e %connect `/'rank' %rank) ~]
::
:::: On Save we wrap up our entire self in a vase.
  ::
++  on-save
  ^-  vase
  !>  state
::
:::: On Load we get passed a vase with our previous state
  ::   we then return a card with an updated (if necessary) version
  ::   of that state.
  ::
++  on-load
  |=  saved-state=vase
  ^-  (quip card _this)
  `this(state !<(versioned-state saved-state))
::
:::: Modifying Agent state. (pokes)
  ::
++  on-poke
  |=  [=mark =vase]
  |^  ^-  (quip card _this)
  ?>  =(our.bowl src.bowl)
  =^  cards  state
    ?+  mark  (on-poke:def mark vase)
      ::
      :: Application-specific Actions
      %rank-action          (handle-action !<(action vase))
      ::
      :: %handle-http-request is for when the app is accessed via the url,
      %handle-http-request  (handle-http-request !<([@ta inbound-request:eyre] vase))
      ::
      :: %json is for the client event pokes that the mast script will send.
      %json                 (handle-json-request !<(json vase))
    ==
  [cards this]
  ::
  ++  handle-action
    |=  =action
    ^-  (quip card _state)
    ?-  -.action
      %add-category     %-  add-category:helper     +.action
      %remove-category  %-  remove-category:helper  +.action
      ::
      %add-subject     %-  add-subject:helper     +.action
      %remove-subject  %-  remove-subject:helper  +.action
      :: THE FOLLOWING ARE FOR TESTING/DEBUG ONLY.
      %purge-category  %-  purge-category:helper  +.action
    ==
::
  ++  handle-http-request
    |=  [eyre-id=@ta req=inbound-request:eyre]
    ^-  (quip card _state)
    :: handling authentication:
    ?.  authenticated.req
      [(make-auth-redirect:mast eyre-id) state]
    ?+  method.request.req  [(make-400:mast eyre-id) state]
      %'GET'
        :: the request url from eyre can be parsed into a path either with stab,
        :: or with parse-url:mast which handles trailing slashes and allows for all characters in @t.
        =/  url=path  (parse-url:mast url.request.req)
        :: css ought to be linked to from the head of the sail document, and can be handled like this:
        ?:  =(/rank/css url)
          [(make-css-response:mast eyre-id stylesheet) state]
        ::
        :: --- rig ---
        :: rig produces new display data which is used for plank, gust, and for updating your agent's display state.
        :: note: in the rig sample, "app" here just represents whatever your root-level sail components take as their sample (see example-sail for more information).
        =/  new-display  (rig:mast routes url app)
        ::
        :: --- plank ---
        :: plank is the endpoint that the client will hit first when loading the app via the url.
        :: it serves any of the pages in your routes list according to the request url (and otherwise a default 404 page).
        :: plank inserts the library's script into your sail component to set up all of the client side functionality.
        :-  (plank:mast "rank" /display-updates our.bowl eyre-id new-display)
        ::
        :: state is then set with the new display and url:
        state(display new-display, current-url url)
    ==
  ++  handle-json-request
    |=  json-request=json
    ^-  (quip card _state)
    :: a client poke from mast has the form [tags data].
    :: the tags are what one had defined in the event attribute in the sail element which triggered the event.
    :: these tags are then used to define your event handlers in the agent.
    =/  client-poke  (parse-json:mast json-request)
    ?+  tags.client-poke  !!
      [%click %square-one ~]
        ::
        =/  newcolor  ?:(=(color-one.app "blue") "green" "blue")
        =/  new-app-state  app(color-one newcolor)
        ::
        :: --- rig ---
        :: when rig is used with updated app state it will produce a new version
        :: of the display with differences according to the logic of your sail component.
        =/  new-display  (rig:mast routes current-url new-app-state)
        ::
        :: --- gust ---
        :: gust then produces a response with html to sync the browser's display with your agent.
        :: the response contains a minimal amount of html to achive the new display state, rather than a whole new page.
        :-  [(gust:mast /display-updates display new-display) ~]
        state(app new-app-state, display new-display)
      [%click %square-two ~]
        =/  newcolor  ?:(=(color-two.app "red") "pink" "red")
        =/  new-app-state  app(color-two newcolor)
        =/  new-display  (rig:mast routes current-url new-app-state)
        :-  [(gust:mast /display-updates display new-display) ~]
        state(app new-app-state, display new-display)
      [%click %navigate-to-index ~]
        :: with gust, you can navigate to a different route by sending a minimal set of updates instead of a whole page.
        :: this is done simply whenever the sail is rigged using a different url relative to whatever is current:
        =/  new-url=path  /rank
        =/  new-display  (rig:mast routes new-url app)
        :-  [(gust:mast /display-updates display new-display) ~]
        state(display new-display, current-url new-url)
      [%click %navigate-to-list ~]
        =/  new-url=path  /rank/list
        =/  new-display  (rig:mast routes new-url app)
        :-  [(gust:mast /display-updates display new-display) ~]
        state(display new-display, current-url new-url)
      [%click %test-form-submit ~]
        :: the data in a client poke consists in a (map @t @t) containing what was
        :: specified in the return attribute of the sail element.
        :: the keys are the return attribute paths, and the values are the property values returned.
        ~&  (~(got by data.client-poke) '/first-input/value')
        `state
      [%click %submit-letters ~]
        =/  input  (~(got by data.client-poke) '/letters-input/value')
        =/  rng  ~(. og eny.bowl)
        =.  letters.app   [[input -:(rads:rng 100)] letters.app]
        =/  new-display  (rig:mast routes current-url app)
        :-  [(gust:mast /display-updates display new-display) ~]
        state(display new-display)
      [%click %switch-letters ~]
        =/  last  (rear letters.app)
        =.  letters.app  [last (snip letters.app)]
        =/  new-display  (rig:mast routes current-url app)
        :-  [(gust:mast /display-updates display new-display) ~]
        state(display new-display)
    ==
  --
:: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: ::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
    [%http-response *]
      %-  (slog leaf+"Eyre subscribed to {(spud path)}." ~)
      `this
    [%display-updates *]
      %-  (slog leaf+"Eyre subscribed to {(spud path)}." ~)
      `this
  ==
++  on-leave  on-leave:def
::
:::: Querying Agent state. (scry paths)
  ::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  (on-peek:def path)
    ::
    :::: Answers all the categories in Agent state
      ::
      ::  > .^((list ctg:rank) %gx /=rank=/categories/0/0/noun)
      ::  ~[
      ::    [id=[sh=~zod uu=~.t97f.1bkho.] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.5.14..21.30.37..3c8b up=~ de=~ ri=0]]
      ::    [id=[sh=~zod uu=~.frked.56uql] li=10 ad="Best" su="Albums" pe="All-time" ts=[cr=~2024.5.14..21.30.47..8590 up=~ de=~ ri=0]]
      ::    [id=[sh=~zod uu=~.klck.j10un.] li=10 ad="Worst" su="Albums" pe="2023" ts=[cr=~2024.5.14..21.30.57..79c0 up=~ de=~ ri=0]]
      ::    [id=[sh=~zod uu=~.9dr48.dgg5i] li=10 ad="Worst" su="Albums" pe="All-time" ts=[cr=~2024.5.14..21.31.08..948c up=~ de=~ ri=0]]
      ::  ]
      [%x %categories ~]
      [~ ~ [%noun !>(categories)]]
    ::
    :::: Answers the Category with UrbId or ~ if not found. (unit ctg)
      ::
      ::  > .^((unit ctg:rank) %gx /=rank=/category/~.gmne0.sigl9/noun)
      ::  [~ [id=[sh=~zod uu=~.gmne0.sigl9] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.5.3..19.46.29..4c8a up=~ de=~]]]
      ::
      [%x %category @ ~]
      =/  key=@ta  (slav %ta i.t.t.path)
      =/  fil  |=(c=ctg =(key (~(get-key urbid bowl) (get-urbid:category c))))
      =/  cat  (skim categories fil)
      ?~  cat
        ``noun+!>(~)
      =/  idx  (find ~[(head cat)] categories)
      =/  c  (snag (need idx) categories)
      [~ ~ [%noun !>(c)]]
    ::
    :::: Answers all the Subjects in Agent state
      ::
      [%x %subjects ~]
    ``noun+!>(subjects)
  ==
++  on-agent  on-agent:def
:: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: ::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?.  ?=([%bind ~] wire)
    (on-arvo:def [wire sign-arvo])
  ?.  ?=([%eyre %bound *] sign-arvo)
    (on-arvo:def [wire sign-arvo])
  ~?  !accepted.sign-arvo
    %eyre-rejected-squad-binding
  `this
:: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: ::
++  on-fail   on-fail:def
--
::
::  Helper door
::
|_  bowl=bowl:gall
::
++  add-category
  |=  [limit=@ud adjective=tape subject=tape period=tape]
  ?.  =(src.bowl our.bowl)
    ~&  >>>  "Unauthorized poke from {<src.bowl>}: %add-category"  !!
  =.  categories  (snoc categories (~(new category bowl) [limit adjective subject period]))
  [~ state]
::
++  remove-category
  |=  key=@ta
  ?.  =(src.bowl our.bowl)
    ~&  >>>  "Unauthorized poke from {<src.bowl>}: %remove-category"  !!
  =/  fil  |=(c=ctg =(key (~(get-key urbid bowl) (get-urbid:category c))))
  =/  ctg  (skim categories fil)
  ?~  ctg
    :: Category was not found, just return...
    [~ state]
  =/  idx  (find ~[(head ctg)] categories)
  =/  c  (snag (need idx) categories)
  =.  c  (~(del category bowl) c)
  =.  categories  (snap categories (need idx) c)
  [~ state]
::
++  purge-category
  |=  key=@ta
  ?.  =(src.bowl our.bowl)
    ~&  >>>  "Unauthorized poke from {<src.bowl>}: %purge-category"  !!
  =/  fil  |=(c=ctg =(key (~(get-key urbid bowl) (get-urbid:category c))))
  =/  ctg  (skim categories fil)
  ?~  ctg
    :: Category was not found, just return...
    [~ state]
  =/  idx  (find ~[(head ctg)] categories)
  =.  categories  (oust [(need idx) 1] categories)
  [~ state]
::
++  add-subject
  |=  [title=tape artist=tape]
  ?.  =(src.bowl our.bowl)
    ~&  >>>  "Unauthorized poke from {<src.bowl>}: %add-subject"  !!
  =.  subjects  (snoc subjects (~(new subject bowl) [title artist]))
  [~ state]
::
++  remove-subject
  |=  key=@ta
  ?.  =(src.bowl our.bowl)
    ~&  >>>  "Unauthorized poke from {<src.bowl>}: %remove-subject"  !!
  =/  fil  |=(s=sbj =(key (~(get-key urbid bowl) (get-urbid:subject s))))
  =/  sub  (skim subjects fil)
  ?~  sub
    :: Category was not found, just return...
    [~ state]
  =/  idx  (find ~[(head sub)] subjects)
  =/  s  (snag (need idx) subjects)
  =.  s  (~(del subject bowl) s)
  =.  subjects  (snap subjects (need idx) s)
  [~ state]
::
  :: ~&  >  our.bowl
  :: ~&  >  key
  :: ~&  >  ctg
  :: ~&  >  idx
--