FROM kechako/jupyter
MAINTAINER Tomato Ketchup <r@554.jp>

ENV RUBY_MAJOR 2.4
ENV RUBY_VERSION 2.4.0

# skip installing gem documentation
RUN echo 'install: --no-document\nupdate: --no-document' >> "$HOME/.gemrc"

# Build Ruby
RUN apt-get update \
    && apt-get install --no-install-recommends -y -q gcc make autoconf automake libssl-dev libncurses5-dev libreadline-dev bison libgdbm-dev \
    && mkdir -p /usr/src/ruby \
    && curl -L "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.xz" | tar -C /usr/src/ruby --strip-components=1 -xJ \
    && cd /usr/src/ruby \
    && ./configure --disable-install-doc \
    && make \
    && make install \
# Install rbczmq 
    && apt-get install --no-install-recommends -y -q libtool-bin g++ \
    && gem install rbczmq \
# Cleanup
    && apt-get purge -y --auto-remove libtool-bin \
    && rm -rf /var/lib/apt/lists/* \
    && rm -r /usr/src/ruby

# Install iruby
RUN gem install iruby
# Register iruby
RUN iruby register
