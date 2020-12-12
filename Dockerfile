FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  git \
  tcl8.6 \
  tk8.6 \
  tcllib \
  libsqlite3-tcl \
  libtk-img \
  unzip \
  wget \
  openjdk-14-jre-headless \
  zip

WORKDIR /root
RUN wget -O drakon_editor.zip https://sourceforge.net/projects/drakon-editor/files/drakon_editor1.31.zip/download
RUN unzip drakon_editor.zip -d drakon_editor

WORKDIR /
RUN git clone https://github.com/stepan-mitkin/drakonhub.git drakonhub
WORKDIR /drakonhub
RUN chmod +x static/drnjs app/drnlua
RUN ./build
