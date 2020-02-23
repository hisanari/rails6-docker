FROM ruby:2.7
ENV LANG C.UTF-8
ENV APP_HOME /myapp

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list


RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    yarn \
 && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
