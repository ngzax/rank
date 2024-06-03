# rank
create and share your faves with friends.

#### Installtion Instructions
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


### Data Model

#### urbitID, aka `uid` = [sh=@p uu=tape]

| Meta | Ship | Unique ID |
| --- | --- | --- |
| face | sh  | uu |
| ex1 | ~zod  | 62qg2.p57rt |

#### timestamp, aka `tsp` = [cr=time up=unit(time) de=unit(time)]

| Meta | Created | Updated | Deleted |
| --- | --- | --- | --- |
| face | cr  | up | de |
| ex1 | ~2024.3.29..17.25.38..6a05 | ~ | ~ |
| ex2 | ~2024.3.29..17.25.38..6a05 | [~ ~2024.3.29..17.50.15..6adf] | [~ ~2024.3.29..17.50.15..6adf] |

#### category, aka `ctg` = [id=uid =li =ad =su =pe ts=tsp]

#### categories (list ctg)

| Meta | Urbit Id | Limit | Adjective | Subject | Period | Timestamp |
| --- | --- | --- | --- | --- | --- | --- |
| face | id  | li | ad | su | pe | ts |
| type | uid | @ud | tape | tape | tape | tsp |
| ex1 | [sh=~zod uu="4uc3.2llor."] | 5 | Best | Books | All-time | [cr=~2024.4.1..21.04.54..106a up=~ de=~] |
| ex2 | [sh=~zod uu="okett.oca0t"] | 10 | Best | American Novels | 20th Century |[cr=~2024.4.1..21.11.16..055e up=~ de=[~ ~2024.4.1..22.08.03..c86e] |

#### subject, aka `sbj` = [=id =ti =ar =ts]

#### subjects (list sbj)

| Meta | Urbit Id | Title | Artist | Timestamp |
| --- | --- | --- | --- | --- |
| face | id  | ti | ar | ts |
| type | uid | tape | tape | tsp |
| ex1 | [sh=~zod uu="84a8v.p2opa"] | "The Possessed" | "Fyodor Dostoyevsky" | [cr=~2024.4.1..21.04.54..106a up=~ de=~] |
| ex2 | [sh=~zod uu="t7iin.4f2tj"] | "The Royal Scam" | "Steely Dan" | [cr=~2024.4.8..21.06.38..798a up=~ de=~] |

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

#### category, aka `ctg` = [id=uid =li =ad =su =pe ts=tsp]

/=rank=/category/{%rift.id}/{%u.id}/{%life.ts}/noun)

/=rank=/category/0/~.gmne0.sigl9/0/noun) => [id=[sh=~zod uu=~.gmne0.sigl9] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.5.3..19.46.29..4c8a up=~ de=~]]]

:: Schema changed to explicitly add rift and life, removed up.ts as everything is now immutable...agent will need to handle "upgrade"... see `categories` below for parallel evolution.
/=rank=/category/1/~.gmne0.sigl9/1/noun) => [id=[sh=~zod uu=~.gmne0.sigl9 rift=1] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.6.3..19.46.29..4c8a de=~ life=1]]]

:: Schema changed to explicitly split metadata and data...
/=rank=/category/2/~.gmne0.sigl9/2/noun) => [meta=[id=[sh=~zod uu=~.gmne0.sigl9 rift=2] ts=[cr=~2024.7.3..19.46.29..4c8a de=~ life=2]] data=[li=10 ad="Best" su="Albums" pe="2023" ]]

:: Instance edited to allow a bigger list (10 -> 20)...
/=rank=/category/2/~.gmne0.sigl9/3/noun) => [meta=[id=[sh=~zod uu=~.gmne0.sigl9 rift=2] ts=[cr=~2024.7.3..19.46.29..4c8a de=~ life=3]] data=[li=20 ad="Best" su="Albums" pe="2023" ]]


#### category-list = [id=uid ts=tsp li=(list ctg)]

/=rank=/categories/{%rift.id}/{%u.id}/{%life.ts}/noun)

/=rank=/categories/0/~.t97f.1bkho./0/noun) => [id=[sh=~zod uu=~.t97f.1bkho.] ts=[cr=~2024.5.3..19.46.29..4c8a up=~ de=~] li=~[id=[sh=~zod uu=~.gmne0.sigl9] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.5.3..19.46.29..4c8a up=~ de=~]]]

/=rank=/categories/1/~.t97f.1bkho./1/noun) => [id=[sh=~zod uu=~.t97f.1bkho. rift=1] li=~[id=[sh=~zod uu=~.gmne0.sigl9 rift=1] ts=[cr=~2024.6.3..19.46.29..4c8a de=~ life=1] li=10 ad="Best" su="Albums" pe="2023" ts=[cr=~2024.6.3..19.46.29..4c8a de=~ life=1]]]