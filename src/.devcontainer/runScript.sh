docker build -t ros-humble-vnc .
docker run -it --rm \
    --name ros-container \
    -p 8080:8080 \
    -p 5900:5900 \
    -e DISPLAY=:0.0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --privileged \
    ros-humble-vnc
