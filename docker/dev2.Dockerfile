FROM ruby:3.2.1-alpine

RUN apk add --no-cache ca-certificates
RUN update-ca-certificates
RUN apk add --no-cache build-base nodejs yarn tzdata ncurses bash git openjdk8 vim
RUN apk add --no-cache openssh curl-dev postgresql libpq-dev libxml2-dev
RUN rm -rf /usr/share/doc /usr/share/man

ENV RAILS_LOG_TO_STDOUT=1

WORKDIR /api
COPY Gemfile .
# COPY Gemfile.lock .
RUN gem install bundler
RUN bundle install

# Copy application
COPY . .

EXPOSE 3000