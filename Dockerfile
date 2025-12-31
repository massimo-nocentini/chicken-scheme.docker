
FROM --platform=$BUILDPLATFORM ubuntu:latest

WORKDIR /home/ubuntu

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget clang make build-essential git libuuid1 sudo cmake

RUN wget https://code.call-cc.org/releases/5.4.0/chicken-5.4.0.tar.gz --no-verbose \
	&& tar xf chicken-5.4.0.tar.gz && cd chicken-5.4.0 \
	&& make C_COMPILER=clang CXX_COMPILER=clang++ LINKER=clang \
	&& make C_COMPILER=clang CXX_COMPILER=clang++ LINKER=clang install \
	&& cd .. && rm -rf chicken-5.4.0*

ENTRYPOINT [ "csi" ]
