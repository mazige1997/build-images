FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install -y locales sudo \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN adduser --disabled-password --gecos '' docker \
 && adduser docker sudo \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get update && apt-get install -y \
    build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 libssl-dev \
    python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp \
    texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint \
    device-tree-compiler g++-multilib antlr3 gperf wget swig rsync curl wget \
 && rm -rf /var/lib/apt/lists/*

USER docker
