FROM azul/zulu-openjdk-alpine:8

MAINTAINER "thanhbv" <thanhbv@sandinh.net>

ARG APP_VERSION=2017.2
ARG APP_BUILD=5781

# preparing user+group
RUN apk add --no-cache --update-cache --repository="http://dl-cdn.alpinelinux.org/alpine/edge/community/" \
        shadow ca-certificates openssl && \
    useradd --system --user-group --uid 500 hub && \
# downloading build dependencies,
# downloading and unpacking the distribution, changing file permissions, removing bundled JVMs,
# removing build dependencies
    apk add -q --no-cache --virtual .build-deps wget unzip && \
    apk del .build-deps && \
    mkdir -p /opt && cd /opt && \
    wget -qO hub.zip https://download.jetbrains.com/hub/${APP_VERSION}/hub-ring-bundle-${APP_VERSION}.${APP_BUILD}.zip && \
    unzip -q hub.zip -x */internal/java/* && \
    mv hub-ring-bundle-${APP_VERSION}.${APP_BUILD} hub && \
    chown -R hub:hub /opt/hub && \
    rm hub.zip

USER hub
WORKDIR /opt/hub

EXPOSE 8080

ENTRYPOINT ["bin/hub.sh"]
CMD ["run"]
