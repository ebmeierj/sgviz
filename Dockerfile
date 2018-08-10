FROM ruby:2.2-jessie
MAINTAINER Firespring "info.dev@firespring.com"

WORKDIR /tmp

RUN apt-get update \
  && apt-get install -y graphviz graphviz-dev \
  && apt-get autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure nokogiri to use system libraries so we build faster
RUN bundle config build.nokogiri --use-system-libraries \
    && bundle config --global jobs $(grep -c ^processor /proc/cpuinfo) \
    && bundle config --global retry 3

# Copy library specs in which will invalidate the cache if any libraries have been changed
COPY Gemfile .
COPY Gemfile.lock .
COPY sgviz.gemspec .
COPY lib/sgviz/version.rb ./lib/sgviz/version.rb
RUN bundle install

# Copy in the actual code. Build and install the gem locally
COPY . /tmp
RUN rake install:local && rm -rf /tmp/*

VOLUME /diagrams
CMD ["sgviz", "--help"]
