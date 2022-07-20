$title = "WEB-DL Script untuk Disney+ Hotstar"
$host.UI.RawUI.WindowTitle = $Title
$mpd = Read-Host -Prompt 'Masukkan Link MPD yang ingin digunakan:'
Write-Output 'Parsing mpd menggunakan yt-dlp dijalankan'
yt-dlp --no-warnings --allow-u --referer=https://www.hotstar.com/ -F $mpd
$videoID = Read-Host -Prompt 'Masukkan Video ID:'
$audioID = Read-Host -Prompt 'Masukkan Audio ID:'
$videoOut = Read-Host -Prompt 'Video File Output:'
$audioOut = Read-Host -Prompt 'Audio File Output:'
Write-Output 'Memulakan muat turun audio dan video menggunakan yt-dlp'
yt-dlp --no-warnings --allow-u --referer=https://www.hotstar.com/ -f $videoID $mpd -o $videoOut -N 32
yt-dlp --no-warnings --allow-u --referer=https://www.hotstar.com/ -f $audioID $mpd -o $audioOut -N 32
Write-Output 'Muat turun video dan audio selesai'
Write-Output 'Mula untuk proses decrypt'
$keyTotal = Read-Host -Prompt 'Masukkan jumlah KID:KEY yang ada:'
if (1 -eq $keyTotal) {
    $key = Read-Host -Prompt 'Masukkan KID:KEY anda:'
    $videoFinal = Read-Host -Prompt 'Nama file video yang anda ingin selepas decrypt:'
    $audioFinal = Read-Host -Prompt 'Nama file audio yang anda ingin selepas decrypt:'
    Write-Output 'Decrypt Video Dimulakan'
    mp4decrypt --show-progress --key $key $videoOut $videoFinal
    Write-Output 'Decrypt Video Selesai'
    Write-Output 'Decrypt Audio Dimulakan'
    mp4decrypt --show-progress --key $key $audioOut $audioFinal
}
if (2 -eq $keyTotal) {
    $key1 = Read-Host -Prompt 'Masukkan KID:KEY pertama anda:'
    $key2 = Read-Host -Prompt 'Masukkan KID:KEY kedua anda:'
    $videoFinal = Read-Host -Prompt 'Nama file video yang anda ingin selepas decrypt:'
    $audioFinal = Read-Host -Prompt 'Nama file audio yang anda ingin selepas decrypt:'
    Write-Output 'Decrypt Video Dimulakan'
    mp4decrypt --show-progress --key $key1 --key $key2 $videoOut $videoFinal
    Write-Output 'Decrypt Video Selesai'
    Write-Output 'Decrypt Audio Dimulakan'
    mp4decrypt --show-progress --key $key1 --key $key2 $audioOut $audioFinal
}
if (3 -eq $keyTotal) {
    $key1 = Read-Host -Prompt 'Masukkan KID:KEY pertama anda:'
    $key2 = Read-Host -Prompt 'Masukkan KID:KEY kedua anda:'
    $key3 = Read-Host -Prompt 'Masukkan KID:KEY ketiga anda:'
    $videoFinal = Read-Host -Prompt 'Nama file video yang anda ingin selepas decrypt:'
    $audioFinal = Read-Host -Prompt 'Nama file audio yang anda ingin selepas decrypt:'
    Write-Output 'Decrypt Video Dimulakan'
    mp4decrypt --show-progress --key $key1 --key $key2 --key $key3 $videoOut $videoFinal
    Write-Output 'Decrypt Video Selesai'
    Write-Output 'Decrypt Audio Dimulakan'
    mp4decrypt --show-progress --key $key1 --key $key2 --key $key3 $audioOut $audioFinal
}
Write-Host 'Memulakan Penggabungan video dan audio'
$done = Read-Host -Prompt 'Masukkan nama file complete yang anda inginkan beserta format:'
ffmpeg -v quiet -stats -i $videofinal -i $audiofinal -c copy $done
Write-Host 'Selesai!, Selamat merilis'
