FROM unocha/alpine-base:3.10.2

WORKDIR /srv

COPY . .

RUN echo "@edgemain http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \ 
    echo "@other https://github.com/astronomer/ap-airflow/raw/master/1.10.5/alpine3.10/apks/repo" >> /etc/apk/repositories && \
    apk update --allow-untrusted && \
    apk add --no-cache --upgrade --virtual .build-deps --allow-untrusted \
        build-base \
        libffi-dev \
        postgresql-dev \
        python3-dev && \
    apk add --no-cache --upgrade --allow-untrusted \
        py3-six@edgemain \
        py3-pandas@other && \
    pip3 --no-cache-dir install --upgrade pip && \
    pip3 --no-cache-dir install -r requirements.txt && \
    rm -rf /srv/* && \
    mkdir /srv/tmp && \
    apk del --allow-untrusted .build-deps && \
    rm -rf /var/lib/apk/*

