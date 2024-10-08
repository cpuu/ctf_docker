FROM ubuntu:22.04

ENV PATH="${PATH}:/usr/local/lib/python3.10/dist-packages/bin"
ENV LC_CTYPE=C.UTF-8

RUN apt update
RUN apt install -y \
    cmake \
    gcc \
    cpp \
    g++ \
    make \
    git \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    ruby \
    sudo \
    tmux \
    vim \
    ninja-build \
    wget

# install pwntools
RUN pip3 install --upgrade pip
RUN pip3 install poetry 
RUN pip3 install pwntools

# install pwndbg
WORKDIR /root
RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR /root/pwndbg
#RUN git checkout 2023.03.19
RUN ./setup.sh

# install angr
RUN pip3 install angr

# install rizin
RUN pip3 install meson tomli
WORKDIR /root
RUN git clone https://github.com/rizinorg/rizin
WORKDIR /root/rizin
RUN meson setup build
RUN meson compile -C build
RUN meson install -C build
RUN ldconfig
## install rz-pipe
RUN git clone https://github.com/rizinorg/rz-pipe
RUN pip3 install ./rz-pipe/python

## install rz-pm & rz-ghidra
RUN wget https://github.com/rizinorg/rz-pm/releases/download/v0.3.3/rz-pm-linux-x86_64
RUN chmod +x rz-pm-linux-x86_64
RUN ./rz-pm-linux-x86_64 --debug install rz-ghidra

# install one_gadget command
WORKDIR /root
RUN gem install one_gadget

