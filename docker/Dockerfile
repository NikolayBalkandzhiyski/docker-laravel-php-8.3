FROM php:8.3-fpm

# Sync User IDs (Default to 1000)
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN usermod -u ${USER_ID} www-data && \
    groupmod -g ${GROUP_ID} www-data

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libmagickwand-dev \
    libzip-dev \
    zip \
    unzip \
    curl

# Install ImageMagick PHP extension via PECL
RUN pecl install imagick && docker-php-ext-enable imagick

# Configure and install built-in PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install \
    pdo_mysql \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd \
    opcache \
    intl \
    zip

RUN pecl install redis && docker-php-ext-enable redis
RUN pecl install xdebug && docker-php-ext-enable xdebug


# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Custom php.ini (build-time fallback; overridden by volume in compose)
COPY docker/php.ini /usr/local/etc/php/conf.d/zz-custom.ini

WORKDIR /var/www

# Copy project and set permissions
COPY . .
RUN chown -R www-data:www-data /var/www/

USER www-data

EXPOSE 9000
CMD ["php-fpm"]
