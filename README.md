# Collaborative-Autonomous-Multi-Agent-SLAM
## Table of Contents
- [Setup Development Environment](#setup-development-environment)
  - [ROS](#ros)
  - [Gazebo](#gazebo)
  - [Python](#python)
- [Troubleshooting Help](#troubleshooting-help)
- [Interacting with the Platform](#interacting-with-the-platform)
- [Resources](#resources)

## Setup Development Environment

### ROS
To set up the ROS environment, follow these steps:

1. **Install ROS**
   - Open the "x64 Native Tools Command Prompt for VS 2019" as Administrator.
   - Install Chocolatey package manager:
     ```sh
     @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
     ```
   - Install Git:
     ```sh
     choco upgrade git -y
     ```
   - Install ROS:
     ```sh
     mkdir c:\opt\chocolatey
     set ChocolateyInstall=c:\opt\chocolatey
     choco source add -n=ros-win -s="https://aka.ms/ros/public" --priority=1
     choco upgrade ros-noetic-desktop_full -y --execution-timeout=0
     ```

2. **Source the ROS Environment**
   - Open the Visual Studio Command Prompt as Administrator.
   - Source the setup script:
     ```sh
     c:\opt\ros\noetic\x64\setup.bat
     ```

3. **Verify the ROS Installation**
   - Check the ROS version:
     ```sh
     rosversion -d
     ```

For more detailed instructions, refer to the [Installing and Configuring Your ROS Environment](https://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment) tutorial.

### Gazebo
To set up Gazebo, follow these steps:

1. **Install Gazebo**
   - Use the ROS package manager to install Gazebo:
     ```sh
     sudo apt-get install ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control
     ```

2. **Verify the Gazebo Installation**
   - Run Gazebo to ensure it's installed correctly:
     ```sh
     gazebo
     ```

### Python
To set up Python for ROS:

1. **Install Python**
   - Download and install Python from the [official website](https://www.python.org/downloads/).

2. **Install ROS Python Dependencies**
   - Install the necessary Python packages for ROS:
     ```sh
     pip install -U rosdep rosinstall_generator wstool rosinstall six vcstools
     ```

## Troubleshooting Help
If you encounter issues during setup, here are some common troubleshooting steps:

- Ensure all paths are correctly set in your environment variables.
- Verify that you are running the commands in the appropriate shell (e.g., Visual Studio Command Prompt for VS 2019).
- Check for any typos or syntax errors in the commands.
- Refer to the [ROS Troubleshooting Guide](https://wiki.ros.org/ROS/Installation/Windows#Troubleshooting).

## Interacting with the Platform
To start working with the platform, follow these steps:

1. **Create a Catkin Workspace**
   ```sh
   mkdir -p ~/catkin_ws/src
   cd ~/catkin_ws/
   catkin_make
   source devel/setup.bash
   cd ~/catkin_ws/src
   catkin_create_pkg my_package std_msgs rospy roscpp
   cd ~/catkin_ws
   catkin_make



