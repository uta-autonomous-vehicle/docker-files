HOME="~/"
WS="${HOME}racecar-ws/"

remotes=("https://github.com/stereolabs/zed-ros-wrapper.git" \
        "https://github.com/RacecarJ/vesc.git" \
        "https://github.com/RacecarJ/racecar.git"
        "https://github.com/uta-autonomous-vehicle/uta-racecar.git" \
        "https://github.com/mit-racecar/racecar_simulator.git" \
# "https://github.com/ros-drivers/urg_node.git" \
# "https://github.com/ros-perception/slam_gmapping"
# "https://github.com/sudrag/line_follower_turtlebot" \
# "https://github.com/RacecarJ/vesc.git" \
# "https://github.com/ros/geometry2" \
# "https://github.com/ros-drivers/ackermann_msgs" \
# "https://github.com/ros-perception/openslam_gmapping" \
# "https://github.com/ros-perception/laser_proc" \
# "https://github.com/ros-drivers/urg_c" \
# "https://github.com/KristofRobot/razor_imu_9dof" \
# "https://github.com/ros-drivers/joystick_drivers" \
)

# rosdep update
# rosdep install --from-paths src --ignore-src -r -y
# rosdep install --from-paths src --ignore-src --rosdistro kinetic -y --skip-keys "libqt5-core libqt5-gui libqt5-opengl libqt5-opengl-dev libqt5-widgets qt5-qmake qtbase5-dev"
# wget "https://stereolabs.sfo2.digitaloceanspaces.com/zedsdk/3.1/ZED_SDK_Tegra_JP43_v3.1.2.run"

# mkdir -p ${WS}
cd "/home/ros/racecar-ws/" && rosdep init

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654
sudo apt-get update -y
# sudo apt-get upgrade -y

for repo in "${remotes[@]}"; do
    cd "/home/ros/racecar-ws/src" && git clone ${repo}
done
# cd racecar-ws/src/uta-racecar/scripts && git clone "https://github.com/uta-autonomous-vehicle/path_sense.git"
# cd $(WS) && catkin-make

rosdep install --from-paths src --ignore-src -r -y