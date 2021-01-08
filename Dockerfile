FROM quay.io/richiesams/ubuntu:bionic

RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        wget && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - && \
    apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main" && \
    apt-get update && \
    apt-get install -y \
        # Install Tools
        cmake \
        build-essential \
        clang-8 \
        clang-tidy-8 \
        clang-format-8 \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/Kitware/CMake/releases/download/v3.16.4/cmake-3.16.4-Linux-x86_64.sh /cmake-3.16.4-Linux-x86_64.sh
RUN mkdir /opt/cmake \
    && sh /cmake-3.16.4-Linux-x86_64.sh --prefix=/opt/cmake --skip-license \
    && ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake \
    && rm /cmake-3.16.4-Linux-x86_64.sh
