# rank
create and share your faves with friends.

Install instructions:
- `|new-desk %rank`
- `|mount %rank`
- `rm -r {dev-ship}/rank/*`
- `cp -RL rank/dep/* {dev-ship}/rank/`
- `cp -RL rank/src/* {dev-ship}/rank/`
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

#### category, aka `cate` = [id=uid =li =ad =su =pe =ts]

#### categories (list cate)

| Meta | Urbit Id | Limit | Adjective | Subject | Period | Timestamp |
| --- | --- | --- | --- | --- | --- | --- |
| face | id  | li | ad | su | pe | ts |
| type | uid | @ud | tape | tape | tape | tstp |
| ex1 | [sh=~zod uu="4uc3.2llor."] | 5 | Best | Books | All-time | [cr=~2024.4.1..21.04.54..106a up=~ de=~] |
| ex2 | [sh=~zod uu="okett.oca0t"] | 10 | Best | American Novels | 20th Century |[cr=~2024.4.1..21.11.16..055e up=~ de=[~ ~2024.4.1..22.08.03..c86e] |

#### subject, aka `subj` = [=id =ti =ar =ts]

#### subjects (list subj)

| Meta | Urbit Id | Title | Artist | Timestamp |
| --- | --- | --- | --- | --- |
| face | id  | ti | ar | ts |
| type | uid | tape | tape | tstp |
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