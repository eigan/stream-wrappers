## Scripts to control my super-basic raspberry pi meteor-camaera

- Start streaming on my Raspberry Pi (mjpg_streamer)
- Start capture stream (with timestamp) on different-server (ffmpeg)
- Shortcut to control camera functions (focus, brightness etc)

## Steps to set up

- Use git clone <repo> to enable automatic updates when script is runned
    - If you want to edit the scripts, please fork so there is no conflicts when fetching git updates.
- Or, if no auto-updates, download tarball.

### On streaming server

- Install mjpeg_streamer and connect camera
- Download this project
- Test camera by running ./stream.sh
- If everything OK, stop stream and add this to /etc/rc.d : <path-to-scripts/stream.sh>


### On recording server

- Make sure you have ffmpeg with --enable-freetype (for timestamp)
- Download this project
- Copy config.sh.original to config.sh
- After stream is up, run capture.sh
- This is my cron config:

    */30 0,1,2,21,22,23 * * * pgrep ffmpeg > /dev/null || <Path-to-project>/record.sh >/dev/null 2>&1