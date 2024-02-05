# rank
create and share your faves with friends.

Install instructions:
- `|new-desk %rank`
- `|mount %rank`
- `rm -r {dev-ship}/rank/*`
- `cp -RL rank/dep/* {dev-ship}/rank/`
- `cp -RL rank/src/* {dev-ship}/rank/`
- `|commit %rank`
- `-test /=rank=/tests ~`
- `|install our %rank`
- `:treaty|publish %rank`


### Data Model

#### category = [=lim =adj =sub =per]

#### ranking = [=category ranks=(set [ord val art])

##### categories
| lim | adj | sub | per |
| --- | --- | --- | --- |
| @ud | tape | tape | tape |
| 5 | Best | Books | All-time |
| 10 | Best | American Novels | 20th Century |

##### pals
| pal |
| --- |
| @p |
| ~hosneb-rosler |

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