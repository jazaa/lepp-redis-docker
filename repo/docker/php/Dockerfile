FROM ubuntu:16.04

ENV PACKAGES   \
    php7.2         \   
    php7.2-cli     \  
    php7.2-common  \ 
    php7.2-curl    \ 
    php7.2-dev     \ 
    php7.2-fpm     \ 
    php7.2-gd      \ 
    php7.2-json    \ 
    php7.2-mbstring \
    php7.2-opcache  \ 
    php7.2-pgsql    \
    php7.2-readline \
    php7.2-soap     \
    php7.2-xml      \
    php7.2-zip      \
    composer        \
    php-pear        \
    php-json-schema \
    curl            \
    net-tools       \
    iputils-ping    \
    inetutils-traceroute    \
    libcurl3-openssl-dev

ENV TZ=Asia/Kolkata
RUN export TERM=linux && \
    apt update && \
    apt install -y tzdata && \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
	touch /var/log/webapp.log && \
	touch /var/log/webapp_daily.log && \
	chown www-data /var/log/webapp.log && \
	chown www-data /var/log/webapp_daily.log

RUN export TERM=linux && \
	apt install -y software-properties-common language-pack-en && \
    export LC_ALL=en_US.UTF-8 && \
    export LANG=en_US.UTF-8
    
RUN export TERM=linux && \
	LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
    apt update && \
    apt install -y libmcrypt-dev && \
    apt install -y $PACKAGES && \
    pecl channel-update pecl.php.net &&  \
    pecl install mcrypt lzf redis igbinary

ADD lzf.ini /etc/php/7.2/fpm/conf.d
ADD redis.ini /etc/php/7.2/fpm/conf.d
ADD igbinary.ini /etc/php/7.2/fpm/conf.d
ADD lzf.ini /etc/php/7.2/cli/conf.d
ADD redis.ini /etc/php/7.2/cli/conf.d
ADD igbinary.ini /etc/php/7.2/cli/conf.d
ADD mcrypt.ini /etc/php/7.2/cli/conf.d
CMD mkdir -p /usr/local/share/GeoIP
ADD GeoIP.dat.gz /usr/local/share/GeoIP
CMD gunzip /usr/local/share/GeoIP/GeoIP.dat.gz
ADD GeoLiteCity.dat.gz /usr/local/share/GeoIP
CMD gunzip /usr/local/share/GeoIP/GeoLiteCity.dat.gz