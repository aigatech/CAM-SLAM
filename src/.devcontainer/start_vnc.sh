#!/bin/bash
# Ensure Xvfb is launched on display :0
export DISPLAY=:0
Xvfb :0 -screen 0 1280x1024x24 > /tmp/xvfb.log 2>&1 &
sleep 2
# Start Fluxbox window manager
fluxbox &
# Start VNC server on display :0
x11vnc -display :0 -forever -usepw -create > /tmp/x11vnc.log 2>&1 &
# Keep the container running
tail -f /dev/null
