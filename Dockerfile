FROM debian:11-slim

ARG XONOTIC_VERSION=0.8.5

RUN apt update && \
    apt upgrade -y && \
    apt install -y wget unzip curl

RUN wget https://dl.illwieckz.net/share/xonotic/release/xonotic-${XONOTIC_VERSION}.zip

RUN unzip xonotic-${XONOTIC_VERSION}.zip

RUN rm xonotic-${XONOTIC_VERSION}.zip

RUN cp /Xonotic/server/server.cfg /Xonotic/data/

WORKDIR /Xonotic/server

EXPOSE 26000/udp

CMD bash server_linux.sh
