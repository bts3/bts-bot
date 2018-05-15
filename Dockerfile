FROM ruby:2.5.1
LABEL maintainer "mozamimy <alice@mozami.me>"

RUN env DEBIAN_FRONTEND=noninteractive apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

RUN mkdir /app
COPY Gemfile Gemfile.lock /tmp/
RUN cd /tmp && bundle install -j4 --deployment --path /gems

WORKDIR /app
COPY . /app

CMD ["bundle", "exec", "ruby", "main.rb"]
