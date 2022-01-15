FROM ruby:3.0.3-alpine

RUN apk add --update --no-cache \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \
    linux-headers \
    libxml2-dev \
    libxslt-dev \
    make \
    netcat-openbsd \
    nodejs \
    yarn \
    openssl \
    pkgconfig \
    sqlite \
    sqlite-dev \
    python3 \
    tzdata \
    bash \
    fish

RUN gem install bundler foreman

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . ./

EXPOSE 3000

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]