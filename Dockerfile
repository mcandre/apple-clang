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
        libgcc-10-dev \
        libgmp-dev \
        libmpc-dev \
        libmpfr-dev \
        libssl-dev \
        libstdc++-10-dev \
        libxml2-dev \
        lzma-dev \
        ninja-build \
        python \
        python3 \
        unzip \
        wget \
        zlib1g-dev && \
    update-alternatives --set c++ /usr/bin/clang++ && \
    update-alternatives --set cc /usr/bin/clang
RUN git clone https://github.com/apple/llvm-project.git
RUN cd /llvm-project && \
    cmake \
        -S /llvm-project/llvm \
        -B build \
        -G Ninja \
        -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi" \
        -DCMAKE_INSTALL_PREFIX=/usr/local/apple-clang \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_INCLUDE_EXAMPLES=OFF \
        -DLLVM_INCLUDE_TESTS=OFF \
        -DLLVM_INCLUDE_BENCHMARKS=OFF \
        -DLLVM_ENABLE_LIBPFM=OFF \
        -DLLVM_ENABLE_DIA_SDK=OFF && \
    cmake --build build
RUN update-alternatives --set c++ /usr/local/apple-clang/bin/clang++ && \
    update-alternatives --set cc /usr/local/apple-clang/bin/clang && \
    apt-get remove --autoremove -y \
        ca-certificates \
        clang \
        cmake \
        file \
        git \
        libgcc-10-dev \
        libgmp-dev \
        libmpc-dev \
        libmpfr-dev \
        libssl-dev \
        libstdc++-10-dev \
        libxml2-dev \
        lzma-dev \
        ninja-build \
        python \
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
