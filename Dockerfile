FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://bitcoincore.org/bin/bitcoin-core-28.0/bitcoin-28.1-x86_64-linux-gnu.tar.gz
RUN tar zxvf bitcoin-28.1-x86_64-linux-gnu.tar.gz
RUN mv bitcoin-28.1/bin/* /usr/bin/
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/bitcoind -printtoconsole
