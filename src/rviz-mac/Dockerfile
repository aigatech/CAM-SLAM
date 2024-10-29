# Use the official ROS Humble base image
FROM ros:humble
# Update apt sources to use Tsinghua mirrors
RUN sed -i 's/ports\.ubuntu\.com/mirrors\.tuna\.tsinghua\.edu\.cn/g' /etc/apt/sources.list && \
    sed -i 's/packages\.ros\.org/mirrors\.tuna\.tsinghua\.edu\.cn/g' /etc/apt/sources.list.d/ros2-latest.list
# Install necessary packages
RUN apt-get update && apt-get install -y \
    iputils-ping \
    net-tools \
    wget \
    sudo \
    python3-pip \
    mesa-utils \
    mesa-utils-extra \
    ros-humble-desktop \
    ros-humble-cartographer \
    ros-humble-cartographer-ros \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-rviz2 \
    bash \
    fluxbox \
    git \
    novnc \
    supervisor \
    x11vnc \
    xterm \
    xvfb && \
    rm -rf /var/lib/apt/lists/*
# Create a workspace
RUN mkdir -p /root/catkin_ws
WORKDIR /root/catkin_ws
# Source ROS environment
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
# Set environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes \
    ROS_MASTER_URI=http://172.16.0.240:11311 \
    ROS_HOSTNAME=ros
# Copy application files
COPY . /app
# Set the default command
CMD ["/app/entrypoint.sh"]
# Expose port
EXPOSE 8080