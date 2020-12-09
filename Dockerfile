FROM ubuntu:18.04

RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php
RUN apt-get install -y graphviz aspell ghostscript clamav php-pspell php-curl php-gd php-intl php-mysql php-xml php-xmlrpc php-ldap php-zip php-soap php-mbstring

COPY moodle /var/www/html/moodle

RUN mkdir /var/moodledata

RUN chown -R www-data /var/moodledata && \
    chmod -R 777 /var/moodledata && \
    chmod -R 777 /var/www/html/moodle

RUN service apache2 restart

EXPOSE 80

CMD ["apachectl","-D","FOREGROUND"]