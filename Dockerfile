FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        clang \
        cmake \
        file \
        git \
        libclang-dev \
        libgmp-dev \
        libmpc-dev \
        libmpfr-dev \
        libssl-dev \
        libxml2-dev \
        lzma-dev \
        python3 \
        unzip \
        wget \
        zlib1g-dev && \
    update-alternatives --set c++ /usr/bin/clang++ && \
    update-alternatives --set cc /usr/bin/clang && \
    git clone https://github.com/apple/llvm-project.git && \
    cd /llvm-project && \
    cmake \
        -S llvm \
        -B build \
        -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;libunwind;compiler-rt;lld" \
        -DCMAKE_INSTALL_PREFIX=/usr/local/apple-clang \
        -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build && \
    update-alternatives --set c++ /usr/local/apple-clang/bin/clang++ && \
    update-alternatives --set cc /usr/local/apple-clang/bin/clang && \
    apt-get remove --autoremove -y \
        ca-certificates \
        clang \
        cmake \
        file \
        git \
        libclang-dev \
        libgmp-dev \
        libmpc-dev \
        libmpfr-dev \
        libssl-dev \
        libxml2-dev \
        lzma-dev \
        python3 \
        unzip \
        wget \
        zlib1g-dev && \
	rm -rf \
        /master.zip \
        /llvm-project \
        /var/lib/apt/lists/* \
        /var/cache/apt/pkgcache.bin \
        /var/cache/apt/srcpkgcache.bin
