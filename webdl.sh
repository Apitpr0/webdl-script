#!/bin/bash
echo "Selamat datang ke script webdl versi Linux yang diadaptasi dari Windows"
echo "Dicipta untuk idola pijanify"
#create variable to get mpd link
echo "Masukkan link MPD:"
read -r mpdlink
#use ytdlp to check details of mpd link for vidID and audID
yt-dlp --no-warnings --allow-u -F "$mpdlink"
#ask user to input vidID and audID from the output of ytdlp
echo "Masukkan VideoID:"
read -r vidID
echo "Masukkan AudioID:"
read -r audID
#start to download stuff using ytdlp and add new method to download both video and audio
yt-dlp --allow-u -f "$vidID"+"$audID" "$MPD" -o d -N 20
#start to decrypt video and audio using mp4decrypt
echo "Masukkan KID:KEY yang anda dapat:"
read -r key
echo "Decrypt video dan audio dimulakan"
mp4decrypt --show-progress --key "$key" d.*.mp4 dec.mp4 && mp4decrypt --show-progress --key "$key" d.*.m4a dec.m4a
#start to merge video and audio using ffmpeg
echo "Mulakan penggabungan video dan audio"
echo "Masukkan nama file complete yang anda inginkan:"
read -r finalvidName
ffmpeg -v quiet -stats -i dec.mp4 -i dec.m4a -c copy "$finalvidName" 
mv -v "$finalvidName" /var/content/www/html/
echo "Siap boss. Selamat merilis :)"
rm *.mp4 *.m4a