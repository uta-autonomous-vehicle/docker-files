FROM  --platform=arm64 ros:kinetic-ros-core-xenial
CMD [ "apt-get update && apt-get install python-pip && apt-get install opencv-python" ]
ENTRYPOINT [ "/bin/bash" ]
ADD ../path_sense /path_sense
ADD ../datasets/dataset_staight_line/uta_racecar_2020-03-21.184839/ /dataset
