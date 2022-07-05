@echo off
title WEB-DL Ripping Tool diadaptasi dari versi Linux
set /p mpd=Masukkan Link MPD yang ingin digunakan:
echo Parsing mpd menggunakan yt-dlp dijalankan
yt-dlp --no-warnings --allow-u -F %mpd% 
set /p videoID=Masukkan Video ID:
set /p audioID=Masukkan Audio ID:
set /p videoOut=Video File Output:
set /p audioOut=Audio File Output:
echo Memulakan muat turun audio dan video menggunakan yt-dlp
yt-dlp --no-warnings --allow-u -f %videoID% %mpd% -o %videoOut% 
yt-dlp --no-warnings --allow-u -f %audioID% %mpd% -o %audioOut% 
echo Mula untuk proses decrypt
set /p key=Masukkan KID:KEY yang anda dapat:
set /p videofinal=Nama file video yang anda ingin selepas decrypt: 
set /p audiofinal=Nama file audio yang anda ingin selepas decrypt: 
echo Decrypt video dimulakan
mp4decrypt --show-progress --key %key% %videoOut% %videofinal%
echo Decrypt audio dimulakan
mp4decrypt --show-progress --key %key% %audioOut% %audiofinal%
echo Memulakan Penggabungan video dan audio
set /p done=Masukkan nama file complete yang anda inginkan beserta format:
ffmpeg -v quiet -stats -i %videofinal% -i %audiofinal% -c copy %done%
echo Selesai!, Selamat merilis
pause
