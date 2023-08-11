FROM debian:11-slim

ARG VERSION

RUN apt update && \
    apt upgrade -y && \
    apt install -y wget unzip curl

RUN wget https://dl.illwieckz.net/share/xonotic/release/xonotic-${VERSION}.zip

RUN unzip xonotic-${VERSION}.zip

RUN rm xonotic-${VERSION}.zip

RUN cp /Xonotic/server/server.cfg /Xonotic/data/

WORKDIR /Xonotic/server

EXPOSE 26000/udp

CMD bash server_linux.sh
