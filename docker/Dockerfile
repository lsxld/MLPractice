FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y htop tree wget curl vim git g++ cmake
RUN apt-get install -y moreutils tmux screen build-essential

RUN rm /bin/sh && ln -s bash /bin/sh

CMD ["/bin/bash"]
