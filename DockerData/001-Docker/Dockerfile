FROM debian:9
LABEL mantainer=BlueKrow

RUN	apt update -y && \
	apt upgrade -y && \
	apt install -y  apache2 curl libapache2-mod-php7.0 php-mysql php-gd php-redis && \
	apt-get clean && \
	curl -o latest.tar.gz https://wordpress.org/latest.tar.gz && \
	tar zxf latest.tar.gz && \
	cp -r wordpress/* /var/www/html/. &&\
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log && \
	rm latest.tar.gz && \
	rm -f /var/www/html/index.html
EXPOSE 80
CMD ["usr/sbin/apache2ctl", "-D", "FOREGROUND"]
