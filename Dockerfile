FROM unocha/hdx-pandas-baseimage:stable

WORKDIR /srv

COPY . .

RUN apk add --no-cache --upgrade --virtual .build-deps \
        build-base \
        libffi-dev \
        postgresql-dev \
        python3-dev && \
    pip --no-cache-dir install --no-build-isolation -r requirements.txt && \
    rm -rf /srv/* && \
    apk del .build-deps && \
    rm -rf /var/lib/apk/*
