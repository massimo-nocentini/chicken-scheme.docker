
FROM --platform=$BUILDPLATFORM ubuntu:latest

WORKDIR /home/ubuntu

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget clang make build-essential git libuuid1 sudo cmake rlwrap

RUN wget https://code.call-cc.org/releases/6.0.0/chicken-6.0.0.tar.gz --no-verbose \
	&& tar xf chicken-6.0.0.tar.gz && cd chicken-6.0.0 \
	&& ./configure \
	&& make C_COMPILER=clang CXX_COMPILER=clang++ LINKER=clang \
	&& make C_COMPILER=clang CXX_COMPILER=clang++ LINKER=clang install \
	&& cd .. && rm -rf chicken-6.0.0*

ENTRYPOINT [ "rlwrap", "csi" ]
