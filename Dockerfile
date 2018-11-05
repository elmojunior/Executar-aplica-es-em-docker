FROM ubuntu:latest
MAINTAINER "elmojunior" <elmo@elmojunior.com>

RUN apt update \
    && apt install -y $APLICAÇÃO \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
    && useradd -m dockeruser

USER dockeruser
