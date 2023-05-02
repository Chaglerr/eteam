FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y build-essential cmake g++-multilib gcc-multilib && \
    rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture amd64 && \
    apt-get update && \
    apt-get install -y build-essential cmake g++-multilib gcc-multilib && \
    rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN mkdir build \
 && cd build \
 && cmake .. \
      -DCMAKE_BUILD_TYPE=Debug \
      -DCMAKE_CXX_FLAGS="-m64" \
      -DCMAKE_C_FLAGS="-m64" \
 && make

CMD ["./app"]
