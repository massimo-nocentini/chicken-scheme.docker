
FROM debian:stable

WORKDIR /home

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget clang make build-essential git libuuid1 sudo


