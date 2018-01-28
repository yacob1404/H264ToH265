#Pass in media folder
#param( [string]$media )
#Create Folders for files
#mkdir x264 >$null 2>&1
#mkdir x265 >$null 2>&1
#Find all files in media folder, will scan recursively
#$files=(Get-ChildItem $media -Recurse)
#Grab each file and push to relative directory
#foreach ($file in $files) {
#$codec=(ffprobe -v quiet $file.FullName -show_streams | Select-String -Pattern "codec_name=h264")
#    if ($codec -like "codec_name=h264"){
#        Write-Host "Currently moving $file"
#        cp $file.FullName .\x264
#    }
#}
#Begin encoding process and push output to x265 folder
$newFiles=(Get-ChildItem .\x264)
foreach ($newfile in $newFiles) {
ffmpeg -i ".\x264\$newFile" -c:v libx265 -crf 28 -preset medium ".\x265\$newFile"
}