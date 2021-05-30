FROM unocha/alpine-base:3.13

WORKDIR /srv

COPY . .

RUN apk add --no-cache --upgrade \
        python3 \
        py3-pip && \
    apk add --no-cache --upgrade -X http://dl-cdn.alpinelinux.org/alpine/edge/main --virtual .build-deps1 \
        llvm11-libs && \
    apk add --no-cache --upgrade -X http://dl-cdn.alpinelinux.org/alpine/edge/community --virtual .build-deps2 \
        py3-wheel \
        cargo && \
    apk add --no-cache --upgrade --virtual .build-deps3 \
        build-base \
        libffi-dev \
        postgresql-dev \
        python3-dev && \
    apk add --no-cache --upgrade -X http://dl-cdn.alpinelinux.org/alpine/edge/community \
        py3-pandas && \
    pip3 --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install -r requirements.txt --ignore-installed six && \
    rm -rf /srv/* && \
    mkdir /srv/tmp && \
    apk del .build-deps1 && \
    apk del .build-deps2 && \
    apk del .build-deps3 && \
    rm -rf ./target ~/.cargo /var/lib/apk/*


