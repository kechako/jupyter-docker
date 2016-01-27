FROM kechako/jupyter
MAINTAINER Tomato Ketchup <r@554.jp>

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.4

# skip installing gem documentation
RUN echo 'install: --no-document\nupdate: --no-document' >> "$HOME/.gemrc"

# Build Ruby
RUN apt-get update \
    && apt-get install --no-install-recommends -y -q bison libgdbm-dev ruby \
    && mkdir -p /usr/src/ruby \
    && curl -L "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.xz" | tar -C /usr/src/ruby --strip-components=1 -xJ \
    && cd /usr/src/ruby \
    && ./configure --disable-install-doc \
    && make \
    && make install \
    && rm -rf /var/lib/apt/lists/* \
    && rm -r /usr/src/ruby

# Install rbczmq 
RUN apt-get update \
    && apt-get install --no-install-recommends -y -q libtool-bin \
    && gem install rbczmq \
    && apt-get purge -y --auto-remove libtool-bin \
    && rm -rf /var/lib/apt/lists/*
    
# Install iruby
RUN gem install iruby
# Register iruby
RUN iruby register
