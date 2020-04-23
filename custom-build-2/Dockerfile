# FROM ubuntu:16.04
FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu16.04
RUN apt-get update
RUN apt-get update && apt-get install lsb-core -y
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update
RUN apt-get install ros-kinetic-desktop-full wget -y

RUN apt-cache search ros-kinetic
RUN apt-get install build-essential -y

RUN apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
RUN apt install python-rosdep -y

RUN rosdep init
RUN rosdep update

RUN mkdir -p ~/racecar-ws/src
RUN mkdir -p /etc/test
RUN cd /etc/test && wget https://stereolabs.sfo2.digitaloceanspaces.com/zedsdk/3.1/ZED_SDK_Ubuntu16_cuda9.0_v3.1.2.run
RUN chmod +x /etc/test/ZED_SDK_Ubuntu16_cuda9.0_v3.1.2.run && /etc/test/ZED_SDK_Ubuntu16_cuda9.0_v3.1.2.run -- silent
RUN cd ~/racecar-ws/src \
    && git clone https://github.com/stereolabs/zed-ros-wrapper.git \
    && git clone https://github.com/RacecarJ/vesc.git \
    && git clone https://github.com/RacecarJ/racecar.git \
    && git clone https://github.com/uta-autonomous-vehicle/uta-racecar.git \
    && git clone https://github.com/uta-autonomous-vehicle/usb_cam.git \
    && git clone https://github.com/mit-racecar/racecar_simulator.git 

RUN sudo echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash;cd ~/racecar-ws;rosdep install --from-paths src --ignore-src -r -y; catkin_make"
RUN sudo echo "source ~/racecar-ws/devel/setup.bash" >> ~/.bashrc

RUN sudo echo "ROS_IP=10.0.0.103" >> ~/.bashrc
RUN sudo echo "ROS_MASTER_URI=http://10.0.0.103:11311" >> ~/.bashrc

RUN curl -sSL http://get.gazebosim.org | sh

RUN apt-get update && apt-get install python-pip -y

RUN /bin/bash -c "mkdir -p /racecar/launch"
ADD update_repo.sh /racecar/launch

EXPOSE 8534

ENTRYPOINT [ "/racecar/launch/update_repo.sh" ]

# WORKDIR /home/ros/racecar-ws/src

# RUN sudo apt-get install vnc4server
# RUN vnc4server -geometry 1400x1000
# RUN export DISPLAY=<change this to the right DISPLAY name from vnc server output, see screenshot below>

# COPY . /racecar
# CMD [ "apt-get update && apt-get install python-pip && apt-get install opencv-python" ]
# RUN sh /racecar/setup.sh
# RUN touch /racecar/log.txt

# ENTRYPOINT [ "/bin/bash" ]
# COPY ../path_sense /path_sense
# COPY ../datasets/dataset_staight_line/uta_racecar_2020-03-21.184839/ /dataset



# https://github.com/henry2423/docker-ros-vnc
# https://github.com/ConSol/docker-headless-vnc-container
# http://wiki.ros.org/kinetic/Installation/Ubuntu
# FROM  --platform=arm64 ros:kinetic-ros-core-xenial