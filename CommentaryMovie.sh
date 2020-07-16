#! /bin/bash

movie=$1
movieoffset=$(echo $2 | awk -F: '{ print ($1 * 60) + $2}')
commentary=$3
commentaryoffset=$(echo $4 | awk -F: '{ print ($1 * 60) + $2 }')

echo $movieoffset

echo "Cutting commentary"
ffmpeg -i $commentary -ss $commentaryoffset -async 1 "/tmp/"$commentary"-cut.mp3"

echo "Inserting silence to commentary"
ffmpeg -i "/tmp/"$commentary"-cut.mp3" -af "adelay="$movieoffset"s" "/tmp/"$commentary"-final.mp3"

echo "Extracting movie audio"
ffmpeg -i $movie "/tmp/"$movie"-audio.mp3"

echo "Combining commentary and movie audio"
ffmpeg -i "/tmp/"$movie"-audio.mp3" -i "/tmp/"$commentary"-final.mp3" -filter_complex amerge=inputs=2 -ac 2 "/tmp/"$movie"-audiofinal.mp3" -vsync 2

echo "Replacing movie audio"
ffmpeg -i $movie -i "/tmp/"$movie"-audiofinal.mp3" -c:v copy -map 0:v:0 -map 1:a:0 output.mp4
