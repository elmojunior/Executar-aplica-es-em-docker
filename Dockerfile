FROM ubuntu:latest
MAINTAINER "seunome" <email@dominio.com>

RUN apt update \
    && apt install -y $APLICAÇÃO \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
    && useradd -m dockeruser

USER dockeruser
