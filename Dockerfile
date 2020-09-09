FROM naiveshen/power8:openjdk-8u212-alpine3.9

MAINTAINER visionken <visionken2017@qq.com>

# 更新安装源
RUN echo https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.9/main > /etc/apk/repositories && \
    apk --no-cache --update add tzdata curl bash tini ttf-dejavu && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
	rm -rf /var/cache/apk/*

ENV JAVA_OPTS=""
VOLUME /tmp
