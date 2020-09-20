FROM naiveshen/power8:openjdk-8u212-alpine3.9

MAINTAINER visionken <visionken2017@qq.com>

# 更新安装源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories  && \
    apk --no-cache --update add tzdata curl bash tini ttf-dejavu && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
	rm -rf /var/cache/apk/*

RUN curl -sfSL http://27.154.58.94:6084/tu/jdk/8/local_policy.jar -o /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/policy/unlimited/local_policy.jar \
	&& curl -sfSL http://27.154.58.94:6084/tu/jdk/8/US_export_policy.jar -o /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/policy/unlimited/US_export_policy.jar

ENV JAVA_OPTS=""
VOLUME /tmp
