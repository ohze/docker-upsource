FROM azul/zulu-openjdk-alpine:8

MAINTAINER "thanhbv" <thanhbv@sandinh.net>

ARG APP_VERSION=2017.1
ARG APP_BUILD=1922

# preparing user+group
RUN useradd --system --user-group --uid 500 upsource && \
# downloading build dependencies,
# downloading and unpacking the distribution, changing file permissions, removing bundled JVMs,
# removing build dependencies
    apk add -q --no-cache --virtual .build-deps wget unzip && \
    apk del .build-deps && \
    cd /opt && \
    wget -qO upsource.zip https://download.jetbrains.com/upsource/upsource-${APP_VERSION}.${APP_BUILD}.zip && \
    unzip -q upsource.zip -x */internal/java/* && \
    mv upsource-${APP_VERSION}.${APP_BUILD} upsource && \
    chown -R upsource:upsource /opt/upsource && \
    rm upsource.zip

USER upsource
WORKDIR /opt/upsource

EXPOSE 8080
ENTRYPOINT ["bin/upsource.sh"]
CMD ["run"]
