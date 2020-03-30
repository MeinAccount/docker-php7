FROM php:7.3-fpm
RUN mkdir -p /usr/share/man/man1
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev libjpeg-dev \
    libpq-dev \
    pdftk \
    libzip-dev \
    zlib1g-dev libicu-dev g++ \
    libxslt-dev \
 && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-configure intl
RUN docker-php-ext-install \
    gd \
    mbstring \
    pdo \
    pdo_mysql \
    mysqli \
    zip \
    intl \
    xsl

WORKDIR /var/www
COPY php.ini /usr/local/etc/php/
