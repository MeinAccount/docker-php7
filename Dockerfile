FROM php:7-fpm
RUN mkdir -p /usr/share/man/man1
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
    libpq-dev \
    pdftk \
    libzip-dev \
    zlib1g-dev libicu-dev g++ \
    libonig-dev \
 && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-configure intl
RUN docker-php-ext-install -j$(nproc) \
    gd \
    mbstring \
    pdo \
    pdo_mysql \
    mysqli \
    zip \
    intl

WORKDIR /var/www
COPY php.ini /usr/local/etc/php/
