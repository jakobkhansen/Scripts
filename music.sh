cvlc --no-video -LZ -LZ 'https://www.youtube.com/playlist?list=PLsYapDQruiJwahAUTXB22alh27-YG3xFF' -I rc --rc-host localhost:1250
bg
echo $pid
sleep 5
echo next | nc localhost 1250
