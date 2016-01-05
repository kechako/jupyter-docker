FROM kechako/jupyter
MAINTAINER Tomato Ketchup <r@554.jp>

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.4

# skip installing gem documentation
RUN echo 'install: --no-document\nupdate: --no-document' >> "$HOME/.gemrc"

# Update package list
RUN apt-get update

# Build Ruby
RUN apt-get install --no-install-recommends -y -q bison libgdbm-dev ruby \
    && mkdir -p /usr/src/ruby \
    && curl -L "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.xz" | tar -C /usr/src/ruby --strip-components=1 -xJ \
    && cd /usr/src/ruby \
    && ./configure --disable-install-doc \
    && make \
    && make install

# Install rbczmq 
RUN apt-get install --no-install-recommends -y -q libtool-bin \
    && gem install rbczmq
    
# Install iruby
RUN gem install iruby
# Register iruby
RUN iruby register

# Cleanup
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove bison libgdbm-dev ruby libtool-bin \
    && rm -r /usr/src/ruby
