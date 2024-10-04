FROM ruby:3.2.1-alpine

RUN apk add --update --no-cache build-base nodejs yarn tzdata ncurses bash git openjdk8
RUN apk add --no-cache chromium mysql-dev openssh curl-dev postgresql libpq-dev
RUN apk add --no-cache libxml2-dev pixman tiff giflib libpng libjpeg licurl fontconfig
RUN apk add --no-cache freetype libgomp msttcorefonts-installer fontconfig poppler-utils
RUN apk add --no-cache vim
RUN update-ms-fonts

# ARM dependencies
RUN apk add --no-cache gcompat

ENV LANG=C.UTF-8 BUNDLEJOBS=3 BUNDLE_RETRY=3 BUNDLE_WITHOUT=production:staging
ENV APP_PATH /app
ENV PATH $APP_PATH/bin:$PATH

WORKDIR $APP_PATH
COPY Gemfile .
COPY Gemfile.lock .
COPY vendor vendor
RUN gem install bundler
RUN bundle install

# Copy application
COPY . .

EXPOSE 3000