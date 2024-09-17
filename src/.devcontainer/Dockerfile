# Use the official ROS Humble base image
FROM ros:humble
# Set arguments for the user creation
ARG USERNAME=ziyan
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# Switch to root to install packages
USER root
# Install necessary packages including X11 and Qt dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    python3-pip \
    ros-humble-desktop \
    ros-humble-gazebo-* \
    ros-humble-cartographer \
    ros-humble-cartographer-ros \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    libxcb-xinerama0 \
    x11-apps \
    libgl1-mesa-glx \
    libqt5gui5 \
    && rm -rf /var/lib/apt/lists/*
# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
# Set the default shell
ENV SHELL /bin/bash
# Set environment variables for GUI support
ENV DISPLAY=:0
ENV QT_X11_NO_MITSHM=1
ENV XDG_RUNTIME_DIR=/tmp/runtime-$USERNAME
# Set the working directory
WORKDIR /home/$USERNAME
# Source ROS environment in .bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> /home/$USERNAME/.bashrc
# Switch to the new user
USER $USERNAME
# Set the default command
CMD ["/bin/bash"]
