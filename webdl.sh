#!/bin/bash
echo "Selamat datang ke script webdl versi Linux yang diadaptasi dari Windows"
echo "Dicipta untuk idola pijanify"
#create variable to get mpd link
echo "Masukkan link MPD"
read -r mpdlink
#use ytdlp to check details of mpd link for vidID and audID
yt-dlp --no-warnings --allow-u -F "$mpdlink"
#ask user to input vidID and audID from the output of ytdlp
echo "Masukkan VideoID"
read -r vidID
echo "Masukkan AudioID"
read -r audID
echo "Masukkan nama video yang ingin digunakan"
read -r videoOut
echo "Masukkan nama audio yang ingin digunakan"
read -r audioOut
#start to download stuff using ytdlp
echo "Muat turun video dimulakan"
yt-dlp --allow-u -f "$vidID" "$mpdlink" -o "$videoOut" -N 60
echo "Muat turun audio dimulakan"
yt-dlp --allow-u -f "$audID" "$mpdlink" -o "$audioOut" -N 60
#start to decrypt video and audio using mp4decrypt
echo "Masukkan KID:KEY yang anda dapat"
read -r key
#request for decrypted filename for both aud and vid
echo "Masukkan nama file video yang sudah di-decrypt"
read -r videoDec
echo "Masukkan nama file audio yang sudah di-decrypt"
read -r audioDec
#start to decrypt video and audio using mp4decrypt
echo "Decrypt video dan audio dimulakan"
mp4decrypt --show-progress --key "$key" "$videoOut" "$videoDec"
mp4decrypt --show-progress --key "$key" "$audioOut" "$audioDec"
#start to merge video and audio using ffmpeg
echo "Mulakan penggabungan video dan audio"
echo "Masukkan nama file complete yang anda inginkan"
read -r finalvidName
ffmpeg -i "$videoDec" -i "$audioDec" -c copy "$finalvidName"
echo "Siap boss. Selamat merilis :)"
