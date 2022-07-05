#!/bin/bash
echo "Selamat datang ke script webdl versi Linux yang diadaptasi dari Windows"
echo "Selamat datang kepada ripper baharu"
echo "Update semua package di dalam server"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install curl -y
echo "Siap update dan upgrade semua package"
echo "Mulakan download mp4decrypt dan yt-dlp dan alihkan ke folder /usr/local/bin"
sudo curl -L https://github.com/Apitpr0/webdl-script/releases/download/mp4decrypt/mp4decrypt -o /usr/local/bin/mp4decrypt
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/mp4decrypt
echo "File penting siap dimuat turun dan dialihkan"
echo "Mulakan download ffmpeg dan aria2"
sudo apt install ffmpeg -y
sudo apt install aria2 -y
echo "Siap download ffmpeg dan aria2"
echo "Sila run webdl.sh untuk memulakan sesi ripping anda"
echo "Terima kasih :)"