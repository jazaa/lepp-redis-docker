FROM postgres:10-alpine

ADD init-db.sh /docker-entrypoint-initdb.d

RUN apk update && \
    apk add net-tools iputils tzdata

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	echo $TZ > /etc/timezone