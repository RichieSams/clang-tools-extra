FROM quay.io/richiesams/ubuntu:jammy

RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        wget && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - && \
    apt-add-repository "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main" && \
    apt-get update && \
    apt-get install -y \
        # Install Tools
        build-essential \
        clang-15 \
        clang-tidy-15 \
        clang-format-15 \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/Kitware/CMake/releases/download/v3.16.4/cmake-3.16.4-Linux-x86_64.sh /cmake-3.16.4-Linux-x86_64.sh
RUN mkdir /opt/cmake \
    && sh /cmake-3.16.4-Linux-x86_64.sh --prefix=/opt/cmake --skip-license \
    && ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake \
    && rm /cmake-3.16.4-Linux-x86_64.sh
