FROM lsiobase/alpine
MAINTAINER Alex Phillips <ahp118@gmail.com>

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
    apk add --no-cache \
    ffmpeg \
    git \
    nginx \
    nodejs \
    openssl \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-mbstring \
    php7-zlib \
    php7-curl \
    php7-dom \
    php7-simplexml \
    php7-zip \
    php7-xmlwriter \
    php7-tokenizer \
    php7-xml \
    php7-sqlite3 \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-session \
    php7-fpm \
    php7-ctype \
    php7-exif \
    php7-fileinfo \
    rsync \
    sqlite \
    yarn \

 # install composer
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv /composer.phar /usr/bin/composer \

 # get app code
 && git clone https://github.com/phanan/koel.git /app \
    && cd /app \
    && git checkout v3.6.2

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config
