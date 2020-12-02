FROM bitnami/php-fpm:7.4.12-prod

RUN rm /opt/bitnami/php/bin/composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --2 --install-dir=/opt/bitnami/php/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

RUN apt-get update && \
    apt-get install -y git openssh-client curl

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash
RUN apt-get install -y nodejs
RUN npm install -g yarn shipit-deploy shipit-cli