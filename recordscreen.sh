#! /bin/bash

filename=$1

byzanz-record --exec /home/jakob/Scripts/infiniteprocess.sh $filename &


sleep 0.5

read -r x < /tmp/recordscreenprocess;
echo "Recording video, press q to stop..."

while :

do
    read -t 1 -n 1 key

    if [[ $key = q ]]
    then
        echo
        break
    fi
done

kill $x
echo "Processing video..."
