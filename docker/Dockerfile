FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y htop tree wget curl vim git g++ cmake
RUN apt-get install -y moreutils tmux screen build-essential

RUN apt-get install -y python-dev python-pip

RUN apt-get install -y python-virtualenv

RUN pip install --upgrade pip

RUN pip install --upgrade pytest
RUN pip install --upgrade tensorflow-gpu
RUN pip install ipython numpy scipy
RUN pip install keras
RUN pip install h5py

##Install torch
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN cd ~/torch \
    && sed 's/sudo //g' install-deps > install-deps.root \
    && bash install-deps.root \
    && ./install.sh

RUN rm /bin/sh && ln -s bash /bin/sh

CMD ["/bin/bash"]
