FROM ubuntu:14.04

ENV APP_PATH /opt/app

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository ppa:kirillshkrogalev/ffmpeg-next \
    && apt-add-repository ppa:brightbox/ruby-ng \
    && add-apt-repository ppa:chris-lea/node.js \
    && apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y --no-install-recommends \
        git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev libmysqlclient-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties \
        imagemagick \
        ffmpeg \
        ghostscript \
        phantomjs \
        pngcrush \
        libturbojpeg \
        ruby2.3 ruby2.3-dev \
        nodejs \
    && apt-get autoremove -y \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p $APP_PATH

# Different layer for gems installation
WORKDIR $APP_PATH
COPY Gemfile $APP_PATH/
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc \
    && gem update --system \
    && gem2.3 install bundler --version=1.8.0 \
    && bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

# # install nodejs dependencies ( in separate dir due to docker cache)
# ADD package.json /opt/app
# RUN cd /opt/app && npm install

WORKDIR $APP_PATH/src
ADD  . $APP_PATH/src
VOLUME $APP_PATH/src

# this is for virtual host purposes
EXPOSE 3000 3001 8080 5000
CMD ["rails", "server", "-b", "0.0.0.0"]
