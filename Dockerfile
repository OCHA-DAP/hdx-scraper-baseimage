FROM unocha/alpine-base:3.10.2

WORKDIR /srv

COPY . .

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache --upgrade \
        libgfortran \
        libstdc++ \
        python3 && \
    apk add --no-cache --upgrade \
        py3-numpy \
        py3-scipy \
        py3-pandas@edge && \
    apk add --no-cache --upgrade --virtual .build-deps \
        build-base \
        libffi-dev \
        postgresql-dev \
        python3-dev && \
    pip3 --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install -r requirements.txt && \
    rm -rf /srv/* && \
    mkdir /srv/tmp && \
    apk del .build-deps && \
    rm -rf /var/lib/apk/*
