FROM unocha/alpine-base:3.10.2

WORKDIR /srv

COPY . .

RUN echo "@edgemain http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \ 
    echo "@edgetest http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache --upgrade \
        libgfortran \
        libstdc++ \
        python3 && \
    apk add --no-cache --upgrade \
        py3-six@edgemain && \
    apk add --no-cache --upgrade \
        py3-pandas@edgetest && \
    apk add --no-cache --upgrade --virtual .build-deps \
        build-base \
        libffi-dev \
        postgresql-dev \
        python3-dev && \
    pip3 --no-cache-dir install --upgrade pip && \
    pip3 --no-cache-dir install -r requirements.txt && \
    rm -rf /srv/* && \
    mkdir /srv/tmp && \
    apk del .build-deps && \
    rm -rf /var/lib/apk/*
