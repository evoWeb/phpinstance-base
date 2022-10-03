FROM php:7.4-fpm
USER root

RUN groupmod -g 82 www-data \
    && usermod -u 82 www-data

RUN apt-get update -y \
    && apt-get -y install \
    locales \
    mariadb-client \
    bzip2 \
    libbz2-dev \
    libcurl4-openssl-dev \
    graphicsmagick \
    libfreetype6 \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libpng-dev \
    libwebp-dev \
    libonig-dev \
    libxml2 \
    libxml2-dev \
    unzip \
    libzip-dev
RUN docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp
RUN docker-php-ext-install \
    bcmath \
    bz2 \
    gd \
    intl \
    mysqli \
    opcache \
    pdo_mysql \
    soap \
    zip
RUN apt-get remove -y \
    libbz2-dev \
    libfreetype6-dev \
    libjpeg-dev \
    libpng-dev \
    libwebp-dev \
    libxml2-dev \
    libzip-dev
RUN cp "${PHP_INI_DIR}/php.ini-production" "${PHP_INI_DIR}/php.ini" \
    && echo "de_DE.UTF-8 UTF-8\nen_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

WORKDIR /usr/local/apache2/htdocs
USER www-data
