FROM ruby:3-alpine as ruby-base

RUN apk --no-cache update && apk --no-cache add build-base sqlite-dev

WORKDIR /app

RUN gem install bundler

COPY Gemfile* ./

FROM ruby-base AS development

RUN apk --no-cache add bash

FROM development AS test

RUN bundle install --jobs 4 --retry 5 --without "production"

COPY . .

FROM ruby-base AS production

RUN bundle install --jobs 4 --retry 5 --without "development test"

COPY . .

EXPOSE 3000
