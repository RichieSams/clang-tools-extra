FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        wget && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - && \
    apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main" && \
    apt-get update && \
    apt-get install -y \
        # Install Tools
        clang-tidy-8 \
        clang-format-8 \
    && rm -rf /var/lib/apt/lists/*
