FROM unocha/alpine-base:3.8

MAINTAINER Michael Rans <rans@email.com>

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache --upgrade python3 build-base libstdc++ musl-dev python3-dev libffi-dev openssl-dev libxml2-dev libxslt-dev libgfortran py3-numpy@edge py-numpy-dev@edge py3-scipy@edge git && \ 
    cd /root && \
    curl -so get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip --no-cache-dir install setuptools --upgrade && \
    git clone https://github.com/OCHA-DAP/hdxscraper-docker && \
    cd hdxscraper-docker && \
    pip --no-cache-dir install --no-build-isolation -r requirements.txt && \
    apk del build-base musl-dev python3-dev libffi-dev openssl-dev libxml2-dev libxslt-dev py-numpy-dev git && \
    rm -rf /var/lib/apk/*

CMD ["sh"]

