FROM php:8.0-apache-buster

# Install CURL and MySQL extensions
RUN apt-get update && \
    apt-get install -y libcurl4-openssl-dev libpq-dev git && \
    docker-php-ext-install pdo_mysql mysqli

WORKDIR /var/www/html

# Copy the local repository
COPY . /var/www/html/

# 配置 Apache 服务器
RUN a2enmod rewrite

# 将容器的80端口暴露出来
EXPOSE 80
