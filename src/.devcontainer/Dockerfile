# Use the official ROS Humble base image
FROM ros:humble

# Set arguments for user creation and VNC password
ARG USERNAME=krish
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG VNC_PASSWORD=vncpassword

# Switch to root to install packages
USER root

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    curl build-essential cmake git sudo python3-pip x11vnc mesa-utils \
    libgl1-mesa-dri libgl1-mesa-glx libglu1-mesa-dev x11-apps xorg xorg-dev \
    openbox xauth libxtst-dev libxcb-keysyms1-dev \
    ros-humble-desktop ros-humble-cartographer ros-humble-cartographer-ros \
    ros-humble-navigation2 ros-humble-nav2-bringup ros-humble-rviz2 \
    libosmesa6-dev wget \
    xvfb fluxbox x11vnc net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create X11 socket directory
RUN mkdir -p /tmp/.X11-unix && chmod 1777 /tmp/.X11-unix
RUN touch /home/$USERNAME/.Xauthority && \
    chown $USERNAME:$USERNAME /home/$USERNAME/.Xauthority

# Set up VNC password
RUN mkdir -p /home/$USERNAME/.vnc && \
    x11vnc -storepasswd $VNC_PASSWORD /home/$USERNAME/.vnc/passwd && \
    chmod 600 /home/$USERNAME/.vnc/passwd && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME/.vnc

# Create Fluxbox configuration
RUN mkdir -p /home/$USERNAME/.fluxbox && \
    echo "[begin] (Fluxbox)" > /home/$USERNAME/.fluxbox/menu && \
    echo "[exec] (Terminal) {x-terminal-emulator}" >> /home/$USERNAME/.fluxbox/menu && \
    echo "[exit] (Exit)" >> /home/$USERNAME/.fluxbox/menu && \
    echo "[end]" >> /home/$USERNAME/.fluxbox/menu && \
    touch /home/$USERNAME/.fluxbox/init && \
    touch /home/$USERNAME/.fluxbox/keys && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME/.fluxbox

# Add a script to start VNC server
COPY start_vnc.sh /start_vnc.sh
RUN chmod +x /start_vnc.sh

# Set the default shell
ENV SHELL=/bin/bash

# Set environment variables for GUI support
ENV DISPLAY=:0
ENV LIBGL_ALWAYS_INDIRECT=1
ENV LIBGL_ALWAYS_SOFTWARE=1
ENV GALLIUM_DRIVER=llvmpipe
ENV MESA_GL_VERSION_OVERRIDE=3.3
ENV QT_X11_NO_MITSHM=1
ENV QT_QPA_PLATFORM=xcb

# Set the working directory
WORKDIR /home/$USERNAME

# Source ROS environment in .bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> /home/$USERNAME/.bashrc

# Expose VNC port
EXPOSE 5900

# Switch to the new user
USER $USERNAME

# Set the default command to start VNC
CMD ["/start_vnc.sh"]