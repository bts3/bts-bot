FROM ruby:2.5.1
LABEL maintainer "mozamimy <alice@mozami.me>"

RUN env DEBIAN_FRONTEND=noninteractive apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install -j4 --deployment --path vendor/bundle

CMD ["bundle", "exec", "exe/bts_bot"]
