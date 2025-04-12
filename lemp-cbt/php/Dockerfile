FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip pdo pdo_mysql

WORKDIR /var/www/html

# Clone aplikasi dari GitHub
RUN git clone https://github.com/masipnu/zyacbt-2024.git .

# Ganti permission (opsional)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
