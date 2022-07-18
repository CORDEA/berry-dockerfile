FROM ubuntu:latest

MAINTAINER Yoshihiro Tanaka <contact@cordea.jp>


RUN apt -y update && \
    apt -y install build-essential git python3 libreadline-dev

ENV HOME /root/

WORKDIR $HOME

RUN git clone https://github.com/berry-lang/berry.git

WORKDIR $HOME/berry

RUN make && \
    mv berry /usr/local/bin

WORKDIR $HOME

RUN rm -rf berry

ENTRYPOINT ["/bin/bash"]
