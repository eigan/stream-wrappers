#
# Stream from camera to web
# 
if [ ! -f config.sh ]; then
    echo "Please copy config.sh.example to config.sh"
    exit
fi

. config.sh

# TODO: Do we need -n in output?
sudo mjpg_streamer  -i "/usr/local/lib/input_uvc.so -f $stream_fps -r $stream_resolution" -o "/usr/local/lib/output_http.so -n -w $stream_path -p $stream_port"