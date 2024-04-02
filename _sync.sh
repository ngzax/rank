#! /bin/sh
#  Helpfully borrowed from https://github.com/JohnRillos/wiki
#
# > cd rank
# > ./_sync.sh ~/Urbit/pir/nec/
#
pier_path=$1
desk_name=$(cat ./desk)
desk_path="$pier_path/$desk_name"

while :
do
    rsync -aR --delete ./dep/./ ./src/./ $desk_path
    sleep 3
done