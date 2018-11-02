FROM unocha/alpine-base:3.8

WORKDIR /srv

COPY . .

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache --upgrade \
        libgfortran \
        libstdc++ \
        python3 && \
    apk add --no-cache --upgrade --virtual .build-deps \
        build-base \
        libffi-dev \
        libxml2-dev \
        libxslt-dev \
        musl-dev \
        openssl-dev \
        python3-dev && \
    apk add --no-cache --upgrade \
        py3-numpy@edge \
        py3-scipy@edge \
        py-numpy-dev@edge && \
    pip3 install --upgrade pip && \
    pip --no-cache-dir install --no-build-isolation -r requirements.txt && \
    rm -rf /srv/* && \
    apk del \
        .build-deps \
        py-numpy-dev && \
    rm -rf /var/lib/apk/*
