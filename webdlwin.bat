@echo off
title WEB-DL Ripping Tool diadaptasi dari versi Linux
set /p mpd=Masukkan Link MPD yang ingin digunakan:
echo Parsing mpd menggunakan yt-dlp dijalankan
yt-dlp --no-warnings --allow-u -F %mpd% 
set /p videoID=Masukkan Video ID:
set /p audioID=Masukkan Audio ID:
echo Memulakan muat turun audio dan video serentak menggunakan yt-dlp
yt-dlp --no-warnings --allow-u -f %videoID%+%audioID% %mpd% -o d --downloader aria2c
set /p key=Masukkan KID:KEY yang anda dapat:
echo Decrypt video dimulakan
mp4decrypt --show-progress --key %key% d.*.mp4 dec.mp4
echo Decrypt audio dimulakan
mp4decrypt --show-progress --key %key% d.*.m4a dec.m4a
echo Memulakan Penggabungan video dan audio
set /p done=Masukkan nama file complete yang anda inginkan beserta format:
ffmpeg -v quiet -stats -i dec.mp4 -i dec.m4a -c copy %done%
echo Selesai!, Selamat merilis
pause
