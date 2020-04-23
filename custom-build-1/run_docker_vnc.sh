docker run -p 5901:5901 -e USER=nvidia -e PASSWD=nvidia \
    --volume $(pwd):/etc/files \
    --volume /Users/harshilpatel/Documents/projects/racecar/:/etc/racecar \
    henry2423/ros-vnc-ubuntu:kinetic