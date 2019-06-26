search="$1"
mkdir "$search"
cd "$search"

read -p "Connect to nordvpn? (y/n): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
    nordvpn c > /dev/null
fi

pirate-get --save-magnets $search

magnetfile=$(ls)
magnetlink=$(cat "$magnetfile")
rm "$magnetfile"

if [ "$magnetfile" == "" ]
then
    echo "No magnet file found, exiting..."
    exit 1
fi

# transmission-cli end when downloaded
tmpfile=$(mktemp)
chmod a+x $tmpfile
echo "pid=\$(pidof transmission-cli) &&
kill -2 \$pid" > $tmpfile
echo $(cat "$tmpfile")

transmission-cli --download-dir . -f $tmpfile $magnetlink 2> /dev/null

# Move from torrentdir to parentdir
torrentfolder=$(ls)
cd "$torrentfolder"
mv * ../
cd ..
rm -r "$torrentfolder"

videofile=$(find . -type f -exec file -N -i -- {} + | sed -n 's!: video/[^:]*$!!p')

echo "Downloading subtitles..."
subliminal download -l en $videofile

subs=$(find | grep ".srt")

read -p "Cast to chromecast? This will disconnect nordvpn. (y/n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
    nordvpn d > /dev/null
    clear
    castnow "$videofile" --subtitles "$subs" 
fi

echo ""

