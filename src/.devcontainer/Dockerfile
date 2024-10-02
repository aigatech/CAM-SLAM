# Use the official ROS Humble base image
FROM ros:humble
# Set arguments for user creation
ARG USERNAME=krish
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# Switch to root to install packages
USER root
RUN apt-get update && apt-get install -y \
    curl \
    && curl -sSL 'http://packages.ros.org/ros.key' | apt-key add - \
    && echo "deb http://packages.ros.org/ros2/ubuntu jammy main" > /etc/apt/sources.list.d/ros2-latest.list \
    && apt-get update
# Set up the ROS 2 repository
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    sudo \
    python3-pip \
    mesa-utils \
    x11-apps \
    xorg \
    xorg-dev \
    openbox \
    xauth \
    mesa-common-dev \
    libglu1-mesa-dev \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libturbojpeg-dev \
    libxtst-dev \
    opencl-headers \
    ocl-icd-opencl-dev \
    libxcb-keysyms1-dev \
    ros-humble-desktop \
    ros-humble-cartographer \
    ros-humble-cartographer-ros \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-rviz2 \
    x11-xserver-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
# Set the default shell
ENV SHELL /bin/bash
# Set environment variables for GUI support
#ENV DISPLAY=$DISPLAY
ENV DISPLAY=host.docker.internal:0
ENV LIBGL_ALWAYS_INDIRECT=1
# Enable software rendering
#ENV LIBGL_ALWAYS_SOFTWARE=1
ENV QT_X11_NO_MITSHM=1
ENV QT_QPA_PLATFORM=xcb
# Grant access to the X server
#RUN apt-get install -y xauth
# Set the working directory
WORKDIR /home/$USERNAME
# Source ROS environment in .bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> /home/$USERNAME/.bashrc
# Switch to the new user
USER $USERNAME
# Set the default command
CMD ["/bin/bash"]