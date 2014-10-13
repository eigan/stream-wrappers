#
# Capture video from stream
#
if [ ! -f config.sh ]; then
    echo "Please copy config.sh.example to config.sh"
    exit
fi

. config.sh

# Update script 
git pull

# Check response from stream
check_host=$(curl --write-out %{http_code} --silent --output /dev/null $host:$stream_port)
if [[ $check_host != 200 ]]
  then
    echo "Cannot connect to host server. Aborting record"
    exit
fi

## Create the folder
mkdir -p $output_folder

## Start recording
ffmpeg -f $stream_format -use_wallclock_as_timestamps 1 -i "$stream_url" -vf "drawtext=fontfile=$fontfile: text='%{localtime}': fontcolor=white@0.8: x=20: y=main_h-text_h-20: borderw=1:" -f segment -segment_time $output_segments_length -c copy -map 0 -an -b:v $output_bitrate -reset_timestamps 1 -vcodec $output_vcodec $output_folder/$output_prefix%d.mp4