
FROM php:8.3-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libpq-dev \
        libonig-dev \
        libsqlite3-dev \
    && docker-php-ext-install pdo_pgsql pdo_sqlite mbstring \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/*

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
