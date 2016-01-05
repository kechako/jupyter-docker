FROM python:3.5.1
MAINTAINER Tomato Ketchup <r@554.jp>

ENV LIBSODIUM_VERSION 1.0.8
ENV ZEROMQ_VERSION 4.1.4

# Install zeromq
RUN mkdir -p /usr/src/libsodium \
    && curl -L https://download.libsodium.org/libsodium/releases/libsodium-$LIBSODIUM_VERSION.tar.gz | tar -C /usr/src/libsodium --strip-components=1 -xz \
    && cd /usr/src/libsodium \
    && ./configure \
    && make \
    && make install \
    && rm -rf /usr/src/libsodium \
    && mkdir -p /usr/src/zeromq \
    && curl -L http://download.zeromq.org/zeromq-$ZEROMQ_VERSION.tar.gz | tar -C /usr/src/zeromq --strip-components=1 -xz \
    && cd /usr/src/zeromq \
    && ./configure \
    && make \
    && make install \
    && rm -rf /usr/src/zeromq

# Install jupyter
RUN pip3 install 'jupyter'

# Set settings to run
WORKDIR /notebook
VOLUME ["/notebook"]
EXPOSE 8888
ENTRYPOINT ["/usr/local/bin/jupyter"]
CMD ["notebook", "--ip=0.0.0.0", "--no-browser"]
