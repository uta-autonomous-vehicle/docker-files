docker run -it -p 5901:5901 \
    --volume $(pwd):/etc/files \
    --volume /Users/harshilpatel/Documents/projects/racecar/:/etc/racecar \
    henry2423/ros-vnc-ubuntu:kinetic bash