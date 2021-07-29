FROM unocha/alpine-base:3.14

WORKDIR /srv

COPY . .

RUN apk add --no-cache --upgrade \
        python3 \
        py3-pip \
        py3-pandas && \
    apk add --no-cache --upgrade --virtual .build-deps \
        build-base \
        cargo \
        libffi-dev \
        libxml2-dev \
        libxslt-dev \
        llvm11-libs \
        postgresql-dev \
        python3-dev \
        py3-wheel && \
    pip --no-cache-dir install --upgrade -r requirements.txt --ignore-installed six && \
    rm -rf /srv/* && \
    mkdir /srv/tmp && \
    apk del .build-deps && \
    rm -rf ./target ~/.cargo /var/lib/apk/*


