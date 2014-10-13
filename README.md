## Scripts to control my super-basic raspberry pi meteor-camera

#### Features
- Start streaming on my Raspberry Pi (mjpg_streamer)
- Start capture stream (with timestamp) on different-server (ffmpeg)
- Shortcut to control camera functions (focus, brightness etc)

#### TODO
- Script to find activity (meteor / thunder) in captured videos

## Steps to set up
- Clone this repo to enable automatic updates when script is executed
    - If you want to edit the scripts, please fork so there is no conflicts when fetching git updates.
- Or, if no auto-updates, [download tarball](https://github.com/eigan/stream-wrappers/archive/master.zip).

### On streaming server
- Install mjpeg_streamer and connect camera. I have raspbian installed
- Download this project
- Test camera by running ./stream.sh
- If everything OK, add this to /etc/rc.local to initialize cam on boot

```
# Add before exit 0
# Fix path to project
./home/pi/stream-wrappers/stream.sh
```

### On capture server
- Make sure you have ffmpeg with --enable-freetype (for timestamp)
- Download or clone this project
- Copy config.sh.original to config.sh
- After stream is up, run capture.sh
- This is my cron config to force server to capture when its on

```bash
# pgrep makes sure the script is not initialized if ffmpeg is running
*/30 0,1,2,18,19,20,21,22,23 * * * pgrep ffmpeg > /dev/null || path-to-project/record.sh >/dev/null 2>&1
```
