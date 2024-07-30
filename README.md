# rank
create and share your faves with friends.

WARNING: I have published this repo before its time because I showed it at the Urbit Lake Summit '24.
It is not ready for installation or collaboration yet. It is very experimental.
I do welcome your questions and comments on network. DM ~winter-paches.


#### Installation Instructions
...in dojo on your ship...
```
> |new-desk %rank
> |mount %rank
```
... back on your host machine...
```
cd to root of source code...

$ rm -r <path_to_pier>/rank/*`          // Optional: clean out old versions
$ cp -RL dep/* <path_to_pier>/rank/
$ cp -RL src/* <path_to_pier>/rank/
```
...back in the dojo on your (preferably) fake ship...
```
> |commit %rank
> |install our %rank
> :treaty|publish %rank
> -test /=rank=/tests ~
```

#### First time developer setup instructions:
...in dojo on your (preferably) fake ship...
- `|new-desk %rank`
- `|mount %rank`

... back on your host machine...
> cd to root of source...
> ./_sync.sh <path_to_pier>

...back in the dojo on your (preferably) fake ship...
- `|commit %rank`
- `|install our %rank`
- `:treaty|publish %rank`
- `-test /=rank=/tests ~`

### Playing
```
# Clear out existing state and "re-boot":
> |nuke %rank
> |rein %rank

> |commit %rank


> :rank +dbug
> :rank +dbug [%state app]
> :rank +dbug [%state %categories]
> :rank +dbug [%state %rankings]
> :rank +dbug [%state %subjects]

# Data for testing...
> :rank &rank-action [%add-category 10 'Best' 'Albums' '2023']
> :rank &rank-action [%add-category 10 'Best' 'Albums' 'All-time']
> :rank &rank-action [%add-category 10 'Worst' 'Albums' '2023']
> :rank &rank-action [%add-category limit=10 adjective='Worst' subject='Albums' period='All-time']

0v1c4.jbl03.q1tnj.d89mc.p5s54.v076j.anu8s.5a12n.nb165.ln285.a7o3u.r9pe3.mpufp.3l9h0.mpugk.ahg2p.olnmm.5spkq.rsoa2.vou6m.e0kvv

# Purge a Category
> :rank +dbug [%state %categories]
>   ~[
  [
    me=[id=[sh=~zod uu=~.iqi63.ubiri] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.13..ee61 de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=858.927.154]} r={}] r=[n=[p=%ad q=1.953.719.618] l={} r={}]]
  ]
  [
    me=[id=[sh=~zod uu=~.j6jtf.7b5ge] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.49..10ff de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=7.308.613.717.991.386.177]} r={}] r=[n=[p=%ad q=1.953.719.618] l={} r={}]]
  ]
  [
    me=[id=[sh=~zod uu=~.v2o5k.k42bv] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.56..5b83 de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=858.927.154]} r={}] r=[n=[p=%ad q=500.153.085.783] l={} r={}]]
  ]
  [
    me=[id=[sh=~zod uu=~.dhrt.1eaik.] lf=0 rf=%0 ts=[cr=~2024.7.23..21.26.05..193e de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=7.308.613.717.991.386.177]} r={}] r=[n=[p=%ad q=500.153.085.783] l={} r={}]]
  ]
]

> :rank &rank-action [%purge-category key=~.dhrt.1eaik.]

> :rank +dbug [%state %categories]
>  ~[
  [
    me=[id=[sh=~zod uu=~.iqi63.ubiri] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.13..ee61 de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=858.927.154]} r={}] r=[n=[p=%ad q=1.953.719.618] l={} r={}]]
  ]
  [
    me=[id=[sh=~zod uu=~.j6jtf.7b5ge] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.49..10ff de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=7.308.613.717.991.386.177]} r={}] r=[n=[p=%ad q=1.953.719.618] l={} r={}]]
  ]
  [
    me=[id=[sh=~zod uu=~.v2o5k.k42bv] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.56..5b83 de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=858.927.154]} r={}] r=[n=[p=%ad q=500.153.085.783] l={} r={}]]
  ]
]

> :rank &rank-action [%add-subject 'The Possessed' 'Fyodor Dostoyevsky']
> :rank &rank-action [%add-subject title='The Royal Scam' artist='Steely Dan']

> :rank +dbug [%state %subjects]

> ~[
  [
    me=[id=[sh=~zod uu=~.28gh.nuf40.] lf=0 rf=%0 ts=[cr=~2024.7.23..21.34.10..cebe de=~]]
    da=[n=[p=%ti q=7.954.213.808.831.231.090.431.168.440.404] l=~ r=[n=[p=%ar q=10.577.150.286.972.219.303.516.771.612.650.861.864.384.838] l={} r={}]]
  ]
  [
    me=[id=[sh=~zod uu=~.86g2q.2jo27] lf=0 rf=%0 ts=[cr=~2024.7.23..21.34.20..fffe de=~]]
    da=[n=[p=%ti q=2.218.498.518.071.846.057.712.131.068.225.620] l=~ r=[n=[p=%ar q=521.254.556.347.911.098.430.547] l={} r={}]]
  ]
]

> :rank &rank-action [%remove-subject key=~.86g2q.2jo27]

> :rank +dbug [%state %subjects]

> ~[
  [
    me=[id=[sh=~zod uu=~.28gh.nuf40.] lf=0 rf=%0 ts=[cr=~2024.7.23..21.34.10..cebe de=~]]
    da=[n=[p=%ti q=7.954.213.808.831.231.090.431.168.440.404] l=~ r=[n=[p=%ar q=10.577.150.286.972.219.303.516.771.612.650.861.864.384.838] l={} r={}]]
  ]
  [
    me=[id=[sh=~zod uu=~.86g2q.2jo27] lf=0 rf=%0 ts=[cr=~2024.7.23..21.34.20..fffe de=[~ ~2024.7.23..21.36.10..94dc]]]
    da=[n=[p=%ti q=2.218.498.518.071.846.057.712.131.068.225.620] l=~ r=[n=[p=%ar q=521.254.556.347.911.098.430.547] l={} r={}]]
  ]
]
NOTE: The second subject has it's #de key set do it won't show up in queries against the Plex.

```
### Scrying
```
> =rank -build-file /=rank=/sur/rank/hoon
> =ctg -build-file /=rank=/sur/rank/category/hoon

# List All Categories
> .^((list cate:ctg) %gx /=rank=/categories/noun)
~[
  [ me=[id=[sh=~zod uu=~.iqi63.ubiri] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.13..ee61 de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=858.927.154]} r={}] r=[n=[p=%ad q=1.953.719.618] l={} r={}]]
  ]
  [ me=[id=[sh=~zod uu=~.j6jtf.7b5ge] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.49..10ff de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=7.308.613.717.991.386.177]} r={}] r=[n=[p=%ad q=1.953.719.618] l={} r={}]]
  ]
  [ me=[id=[sh=~zod uu=~.v2o5k.k42bv] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.56..5b83 de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=858.927.154]} r={}] r=[n=[p=%ad q=500.153.085.783] l={} r={}]]
  ]
]

# Find Single Category
> .^((unit cate:ctg) %gx /=rank=/category/~.v2o5k.k42bv/noun)
[ ~
  [ me=[id=[sh=~zod uu=~.v2o5k.k42bv] lf=0 rf=%0 ts=[cr=~2024.7.23..21.25.56..5b83 de=~]]
    da=[n=[p=%su q=126.913.958.014.017] l=[n=[p=%li q=10] l={[p=%pe q=858.927.154]} r={}] r=[n=[p=%ad q=500.153.085.783] l={} r={}]]
  ]
]

# Bad ID
> .^((unit ctg:rank) %gx /=rank=/category/~.v2o5k.k42b/noun)
~

> =sbj -build-file /=rank=/sur/rank/subject/hoon

# List all Subjects
> .^((list subj:sbj) %gx /=rank=/subjects/noun)
~[
  [
    me=[id=[sh=~zod uu=~.28gh.nuf40.] lf=0 rf=%0 ts=[cr=~2024.7.23..21.34.10..cebe de=~]]
    da=[n=[p=%ti q=7.954.213.808.831.231.090.431.168.440.404] l=~ r=[n=[p=%ar q=10.577.150.286.972.219.303.516.771.612.650.861.864.384.838] l={} r={}]]
  ]
  [
    me=[id=[sh=~zod uu=~.86g2q.2jo27] lf=0 rf=%0 ts=[cr=~2024.7.23..21.34.20..fffe de=[~ ~2024.7.23..21.36.10..94dc]]]
    da=[n=[p=%ti q=2.218.498.518.071.846.057.712.131.068.225.620] l=~ r=[n=[p=%ar q=521.254.556.347.911.098.430.547] l={} r={}]]
  ]
]

# Find Single Subject
> .^((unit subj:sbj) %gx /=rank=/subject/~.86g2q.2jo27/noun)
[ ~
  [ me=[id=[sh=~zod uu=~.86g2q.2jo27] lf=0 rf=%0 ts=[cr=~2024.7.23..21.34.20..fffe de=[~ ~2024.7.23..21.36.10..94dc]]]
    da=[n=[p=%ti q=2.218.498.518.071.846.057.712.131.068.225.620] l=~ r=[n=[p=%ar q=521.254.556.347.911.098.430.547] l={} r={}]]
  ]
]

```
### Testing
```
> -test /=rank=/tests ~

built   /tests/agent/rank/hoon
built   /tests/agent/rank-scry/hoon
built   /tests/category/hoon
built   /tests/rank/hoon
built   /tests/ranking/hoon
built   /tests/subject/hoon
built   /tests/timestamp/hoon
built   /tests/urbid/hoon
>   test-urbid-to-tape: took ms/1.514
OK      /tests/urbid/test-urbid-to-tape
>   test-urbid-getting-the-key: took µs/60
OK      /tests/urbid/test-urbid-getting-the-key
>   test-urbid-creation: took µs/307
OK      /tests/urbid/test-urbid-creation
>   test-urbid-comparing: took µs/190
OK      /tests/urbid/test-urbid-comparing
>   test-timestamp-update: took ms/1.138
OK      /tests/timestamp/test-timestamp-update
>   test-timestamp-delete-no-update: took ms/1.295
OK      /tests/timestamp/test-timestamp-delete-no-update
>   test-timestamp-creation: took ms/1.340
OK      /tests/timestamp/test-timestamp-creation
>   test-subject-to-tape: took ms/1.476
OK      /tests/subject/test-subject-to-tape
>   test-subject-has-a-unique-urbit-id: took µs/258
OK      /tests/subject/test-subject-has-a-unique-urbit-id
>   test-subject-getting-the-title: took µs/109
OK      /tests/subject/test-subject-getting-the-title
>   test-subject-getting-the-artist: took µs/112
OK      /tests/subject/test-subject-getting-the-artist
>   test-subject-deletion-sets-timestamp: took ms/1.540
OK      /tests/subject/test-subject-deletion-sets-timestamp
>   test-subject-creation-sets-timestamp: took ms/1.287
OK      /tests/subject/test-subject-creation-sets-timestamp
>   test-subject-creation-sets-rift-to-0: took µs/169
OK      /tests/subject/test-subject-creation-sets-rift-to-0
>   test-subject-creation-sets-life-to-zero: took µs/174
OK      /tests/subject/test-subject-creation-sets-life-to-zero
>   test-subject-creation: took ms/1.656
OK      /tests/subject/test-subject-creation
>   test-ranking-push-subject-prepends-new-subject: took ms/1.986
OK      /tests/ranking/test-ranking-push-subject-prepends-new-subject
>   test-ranking-max-subjects-push-many: took µs/261
OK      /tests/ranking/test-ranking-max-subjects-push-many
>   test-ranking-max-subjects-push: took µs/379
OK      /tests/ranking/test-ranking-max-subjects-push
>   test-ranking-max-subjects-add-many: took µs/286
OK      /tests/ranking/test-ranking-max-subjects-add-many
>   test-ranking-max-subjects-add: took µs/367
OK      /tests/ranking/test-ranking-max-subjects-add
>   test-ranking-get-subjects: took ms/3.160
OK      /tests/ranking/test-ranking-get-subjects
>   test-ranking-get-max-subjects: took µs/157
OK      /tests/ranking/test-ranking-get-max-subjects
>   test-ranking-get-category: took ms/1.425
OK      /tests/ranking/test-ranking-get-category
>   test-ranking-creation-initially-empty: took µs/191
OK      /tests/ranking/test-ranking-creation-initially-empty
>   test-ranking-creation: took ms/1.168
OK      /tests/ranking/test-ranking-creation
>   test-ranking-add-subject-appends-new-subject: took ms/1.470
OK      /tests/ranking/test-ranking-add-subject-appends-new-subject
>   test-ranking-add-subject-answers-the-ranking: took ms/3.278
OK      /tests/ranking/test-ranking-add-subject-answers-the-ranking
>   test-ranking-add-subject-adds-subject: took µs/152
OK      /tests/ranking/test-ranking-add-subject-adds-subject
>   test-ranking-add-multiple-subjects: took µs/173
OK      /tests/ranking/test-ranking-add-multiple-subjects
>   test-category-to-tape: took ms/1.614
OK      /tests/category/test-category-to-tape
>   test-category-to-cord: took µs/185
OK      /tests/category/test-category-to-cord
>   test-category-has-an-adjective: took µs/114
OK      /tests/category/test-category-has-an-adjective
>   test-category-has-a-unique-urbit-id: took µs/263
OK      /tests/category/test-category-has-a-unique-urbit-id
>   test-category-has-a-subject: took µs/144
OK      /tests/category/test-category-has-a-subject
>   test-category-has-a-limit: took µs/108
OK      /tests/category/test-category-has-a-limit
>   test-category-deletion-sets-timestamp: took ms/1.244
OK      /tests/category/test-category-deletion-sets-timestamp
>   test-category-creation-sets-timestamp: took ms/1.439
OK      /tests/category/test-category-creation-sets-timestamp
>   test-category-creation-sets-rift-to-0: took µs/215
OK      /tests/category/test-category-creation-sets-rift-to-0
>   test-category-creation-sets-life-to-zero: took µs/212
OK      /tests/category/test-category-creation-sets-life-to-zero
>   test-category-creation: took ms/2.191
OK      /tests/category/test-category-creation
>   test-scrying-all-subjects: took ms/7.993
OK      /tests/agent/rank-scry/test-scrying-all-subjects
>   test-scrying-all-categories: took ms/8.271
OK      /tests/agent/rank-scry/test-scrying-all-categories
>   test-scrying-a-single-subject: took ms/8.870
OK      /tests/agent/rank-scry/test-scrying-a-single-subject
>   test-scrying-a-single-category: took ms/8.010
OK      /tests/agent/rank-scry/test-scrying-a-single-category
>   test-agent-adding-a-subject: took ms/25.154
OK      /tests/agent/rank/test-agent-adding-a-subject
>   test-agent-adding-a-category: took ms/8.659
OK      /tests/agent/rank/test-agent-adding-a-category
ok=%.y
```

### Data Model
#### urbitID, aka `uid` = [sh=@p uu=@ta]

| Ex | Ship | Unique ID |
| --- | --- | --- |
| | sh  | uu |
| ex1 | ~zod  | 62qg2.p57rt |

#### timestamp, aka `tsp` = [cr=time de=unit(time)]

| Ex | Created | Deleted |
| --- | --- | --- |
| | cr  | de |
| ex1 | ~2024.3.29..17.25.38..6a05 | ~ |
| ex2 | ~2024.3.29..17.25.38..6a05 | [~ ~2024.4.29..17.50.15..6adf] |

#### metaData, `meta` = [id=uid lf=@u rf=@tas ts=tsp]
| UrbitID | Life | Rift | Timestamp |
| --- | --- | --- | --- |
| [sh=~zod uu="4uc3.2llor."] | 0 | '0' | [cr=~2024.4.1..21.04.54..106a de=~] |
| [sh=~zod uu="4uc3.2llor."] | 1 | '0' | [cr=~2024.4.1..21.04.56..106e de=[~ ~2024.4.1..22.08.03..c86e] |

#### mote, `mote` = [me=meta da=(map @tas @)]
See below.

#### category, aka `cate` = mote(%li=Limit %ad=Adjective %su=subject %pe=Period)
| Metadata | Data |
| --- | --- |
| [id=[sh=~zod uu="4uc3.2llor."] lf=0 rf='0' ts=[cr=~2024.4.1..21.04.54..106a de=~] | (malt (limo ~[li+2 ad+'Best' su+'Books' pe+'All-time']))]
| [id=[sh=~zod uu="4uc3.2llor."] lf=1 rf='0' ts=[cr=~2024.4.1..21.04.56..106e de=[~ ~2024.4.1..22.08.03..c86e] | (malt (limo ~[li+2 ad+'Best' su+'Books' pe+'All-time']))]

#### subject, aka `subj` = mote (%ti=Title %ar=Artist)
| Metadata | Data |
| --- | --- |
| [id=[sh=~zod uu="4uc3.2llor."] lf=0 rf='0' ts=[cr=~2024.4.1..21.04.54..106a de=~] | (malt (limo ~[ti+'The Possessed' ar+'Fyodor Dostoyevsky']))]
| [id=[sh=~zod uu="4uc3.2llor."] lf=1 rf='0' ts=[cr=~2024.4.1..21.04.56..106e de=[~ ~2024.4.1..22.08.03..c86e] | (malt (limo ~[ti+'The Possessed' ar+'Fyodor Dostoyevsky']))]

#### categories (list cate)

#### subjects (list subj)

#### ranking = [=category ranks=(set [ord val art])

##### rankings
category = [5 "Best" "Books" "All-time"]
| ord | val | art |
| --- | --- | --- |
| @ud | tape | tape |
| 1 | "The Bible" | "various authors" |
| 2 | "The Lord of the Rings" | "J. R. R. Tolkein" |
| 3 | "The Possessed" | "Fyodor Dostoevsky" |
| 4 | "War and Peace" | "Leo Tolstoy" |
| 5 | "The Reivers" | "William Faulkner" |

##### pals
| pal |
| --- |
| @p |
| ~hosneb-rosler |

### PATH Model

#### category, aka `cate` = mote

/=rank=/category/{%u.id}/{%rift.id}/{%life.ts}/noun)

/=rank=/category/~.gmne0.sigl9/0/0/noun) => [id=[sh=~zod uu=~.gmne0.sigl9] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.5.3..19.46.29..4c8a up=~ de=~]]]

:: Schema changed to explicitly add rift and life, removed up.ts as everything is now immutable...agent will need to handle "upgrade"... see `categories` below for parallel evolution.
/=rank=/category/~.gmne0.sigl9/1/1/noun) => [id=[sh=~zod uu=~.gmne0.sigl9 rift=1] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.6.3..19.46.29..4c8a de=~ life=1]]]

:: Schema changed to explicitly split metadata and data...
/=rank=/category/~.gmne0.sigl9/2/2/noun) => [meta=[id=[sh=~zod uu=~.gmne0.sigl9 rift=2] ts=[cr=~2024.7.3..19.46.29..4c8a de=~ life=2]] data=[li=10 ad="Best" su="Albums" pe="2023" ]]

:: Instance edited to allow a bigger list (10 -> 20)...
/=rank=/category/~.gmne0.sigl9/2/3/noun) => [meta=[id=[sh=~zod uu=~.gmne0.sigl9 rift=2] ts=[cr=~2024.7.3..19.46.29..4c8a de=~ life=3]] data=[li=20 ad="Best" su="Albums" pe="2023" ]]


#### category-plex = [id=uid ts=tsp li=(list cate)]

/=rank=/categories/{%u.id}/{%rift.id}/{%life.ts}/noun)

/=rank=/categories/~.t97f.1bkho./0/0/noun) => [id=[sh=~zod uu=~.t97f.1bkho.]
                                               ts=[cr=~2024.5.3..19.46.29..4c8a up=~ de=~]
                                               li=~[
                                                     [id=[sh=~zod uu=~.gmne0.sigl9] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.5.3..19.46.29..4c8a up=~ de=~]]
                                                   ]
                                              ]

/=rank=/categories/~.t97f.1bkho./1/1/noun) => [id=[sh=~zod uu=~.t97f.1bkho. rift=1]
                                               ts=[cr=~2024.6.3..19.46.29..4c8a de=~ life=1]
                                               li=~[
                                                     [id=[sh=~zod uu=~.gmne0.sigl9 rift=1] ts=[cr=~2024.6.3..19.46.29..4c8a de=~ life=1] li=10 ad="Best" su="Albums" pe="2023"]
                                                   ]
                                              ]

/=rank=/categories/~.t97f.1bkho./2/2/noun) => [meta=[id=[sh=~zod uu=~.t97f.1bkho. rift=2] ts=[cr=~2024.7.3..19.46.29..4c8a de=~ life=2]]
                                               data=[
                                                 li=~[
                                                       [id=[sh=~zod uu=~.gmne0.sigl9 rift=2] ts=[cr=~2024.7.3..19.46.29..4c8a de=~ life=2] li=10 ad="Best" su="Albums" pe="2023"]
                                                     ]
                                              ]]

/=rank=/categories/~.t97f.1bkho./2/3/noun) => [meta=[id=[sh=~zod uu=~.t97f.1bkho. rift=2] ts=[cr=~2024.8.3..19.46.29..4c8a de=~ life=3]]
                                               data=[
                                                 li=~[
                                                       [meta=[id=[sh=~zod uu=~.gmne0.sigl9 rift=2] ts=[cr=~2024.8.3..19.46.29..4c8a de=~ life=3]] data=[li=20 ad="Best" su="Albums" pe="2023"]]
                                                     ]
                                              ]]

/=rank=/categories/~.t97f.1bkho./2/4/noun) => [meta=[id=[sh=~zod uu=~.t97f.1bkho. rift=2] ts=[cr=~2024.9.3..19.46.29..4c8a de=~ life=4]]
                                               data=[
                                                 li=~[
                                                       [meta=[id=[sh=~zod uu=~.gmne0.sigl9 rift=2] ts=[cr=~2024.8.3..19.46.29..4c8a de=~ life=3]] data=[li=20 ad="Best" su="Albums" pe="2023"]]
                                                       [meta=[id=[sh=~zod uu=~.gmne0.sigl9 rift=2] ts=[cr=~2024.8.3..19.46.29..4c8a de=~ life=0]] data=[li=20 ad="Best" su="Books" pe="2023"]]
                                                     ]
                                              ]]