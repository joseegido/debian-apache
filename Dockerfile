FROM debian

RUN apt-get update
RUN   apt-get install apache2 -y php libapache2-mod-php
RUN    apt-get install net-tools && \
    apt-get install -y vim && \
    apt-get install nano

COPY web2/public_html /var/www/html/web2/public_html
COPY web2/web2.com.conf /etc/apache2/sites-available

RUN a2ensite web2.com.conf

RUN mkdir -p /etc/apache2/tls/certs && mkdir /etc/apache2/tls/private

COPY web2/tls/certs/web2.crt /etc/apache2/tls/certs
COPY web2/tls/private/web2.csr /etc/apache2/tls/private
COPY web2/tls/private/web2.key /etc/apache2/tls/private

RUN a2enmod ssl

EXPOSE 80 443

ENTRYPOINT [ "apache2ctl","-D","FOREGROUND" ]