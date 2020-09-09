FROM naiveshen/power8:openjdk-8u212-alpine3.9

MAINTAINER visionken <visionken2017@qq.com>

# 基于alpine的镜像时区修改为中国
RUN apk --no-cache add tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

ENV JAVA_OPTS=""
VOLUME /tmp

# Install curl and bash for the entry script
RUN apk --update add curl bash tini ttf-dejavu && \
	rm -rf /var/cache/apk/*
