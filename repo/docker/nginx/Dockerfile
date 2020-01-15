FROM ubuntu:16.04

RUN apt update && \
    apt install -y nginx net-tools iputils-ping tzdata

RUN rm /etc/nginx/sites-enabled/default

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	echo $TZ > /etc/timezone
