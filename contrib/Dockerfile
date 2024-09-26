FROM amd64/ubuntu:20.04 AS base

#If you found this docker image helpful please donate FTM to the maintainer
LABEL maintainer="RV9zdNeUTQUToZUcRp9uNF8gwH5LzDFtan"

EXPOSE 8766/tcp
EXPOSE 8767/tcp

ENV DEBIAN_FRONTEND=noninteractive

#Install runtime dependencies
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	bash wget net-tools libminiupnpc17 \
	libevent-2.1 libevent-pthreads-2.1 \
	libboost-system1.71 libboost-filesystem1.71 libboost-chrono1.71 \
	libboost-program-options1.71 libboost-thread1.71 \
	libzmq5 && \
	apt-get clean

FROM base AS build

#Install build dependencies
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	bash net-tools build-essential libtool autotools-dev automake \
	pkg-config libssl-dev libevent-dev bsdmainutils python3 \
	libboost-system1.71-dev libboost-filesystem1.71-dev libboost-chrono1.71-dev \
	libboost-program-options1.71-dev libboost-test1.71-dev libboost-thread1.71-dev \
	libzmq3-dev libminiupnpc-dev && \
	apt-get clean

#Copy source dir
COPY . /home/ftm/build/FTMcoin/
WORKDIR /home/ftm/build/FTMcoin

#build db4 from source
WORKDIR /home/ftm/build/FTMcoin/contrib
RUN ./install_db4.sh ../../

# build FTMcore
WORKDIR /home/ftm/build/FTMcoin
RUN ./autogen.sh && ./configure --disable-tests BDB_LIBS="-L/home/ftm/build/db4/lib -ldb_cxx-4.8" BDB_CFLAGS="-I/home/ftm/build/db4/include" --with-gui=no  && make -j4

FROM base AS final

#Add our service account user
RUN useradd -ms /bin/bash ftm && \
	mkdir /var/lib/ftm && \
	chown ftm:ftm /var/lib/ftm && \
	ln -s /var/lib/ftm /home/ftm/.ftm && \
	chown -h ftm:ftm /home/ftm/.ftm

VOLUME /var/lib/ftm

#Copy the compiled binaries from the build
COPY --from=build /home/ftm/build/FTMcoin/src/ftmd /usr/local/bin/ftmd
COPY --from=build /home/ftm/build/FTMcoin/src/ftm-cli /usr/local/bin/ftm-cli

WORKDIR /home/ftm
USER ftm

CMD /usr/local/bin/ftmd -datadir=/var/lib/ftm -printtoconsole -onlynet=ipv4
