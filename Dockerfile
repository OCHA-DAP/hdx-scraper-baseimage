FROM unocha/alpine-base:3.8

MAINTAINER Michael Rans <rans@email.com>

RUN apk add --no-cache --upgrade python3 build-base musl-dev python3-dev libffi-dev openssl-dev libxml2-dev libxslt-dev git && \
    cd /root && \
    curl -so get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip --no-cache-dir install setuptools --upgrade && \
    pip --no-cache-dir install hdx-python-api && \
    apk del build-base musl-dev python3-dev libffi-dev openssl-dev libxml2-dev libxslt-dev && \
    apk add --no-cache --upgrade libstdc++ && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    git clone https://github.com/OCHA-DAP/hdxscraper-fts && \
    git clone https://github.com/OCHA-DAP/hdxscraper-acled && \
    git clone https://github.com/OCHA-DAP/hdxscraper-unesco && \
    git clone https://github.com/OCHA-DAP/hdxscraper-docker && \
    chmod a+x hdxscraper-docker/run.sh && \
    apk add --no-cache --update build-base python3-dev py3-numpy@edge py-numpy-dev@edge py3-scipy@edge && \ 
    pip --no-cache-dir install --no-build-isolation -r requirements.txt && \
    apk del build-base python3-dev py-numpy-dev git && \
    rm -r .cache && \
    rm -rf /var/lib/apk/*

CMD ["sh", "/root/hdxscraper-docker/run.sh", "hdxscraper-fts"]

