FROM redis:alpine

ADD bootsync.sh /var/lib/boot2docker

RUN apk update && \
    apk add net-tools iputils tzdata

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	echo $TZ > /etc/timezone
