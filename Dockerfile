FROM mcarans/hdx-python-api

MAINTAINER Michael Rans <rans@email.com>

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    mkdir /root/hdxscraper-fts && \
    cd /root/hdxscraper-fts && \
    curl -L https://github.com/OCHA-DAP/hdxscraper-fts/tarball/master | \
        tar xz -C . --strip-components=1 && \
    mkdir /root/hdxscraper-acled && \
    cd /root/hdxscraper-acled && \
    curl -L https://github.com/OCHA-DAP/hdxscraper-acled/tarball/master | \
        tar xz -C . --strip-components=1 && \
    mkdir /root/hdxscraper-unesco && \
    cd /root/hdxscraper-unesco && \
    curl -L https://github.com/OCHA-DAP/hdxscraper-unesco/tarball/master | \
        tar xz -C . --strip-components=1 && \
    mkdir /root/hdxscraper-docker && \
    cd /root/hdxscraper-docker && \
    curl -L https://github.com/OCHA-DAP/hdxscraper-docker/tarball/master | \
        tar xz -C . --strip-components=1 && \
    chmod +x /root/hdxscraper-docker/run.sh && \
    apk add --no-cache --update build-base python3-dev py3-numpy@edge py-numpy-dev@edge py3-scipy@edge && \ 
    pip --no-cache-dir install --no-build-isolation -r requirements.txt && \
    apk del build-base python3-dev py-numpy-dev && \
    rm -rf /var/lib/apk/*

CMD ["sh", "/root/hdxscraper-docker/run.sh", "hdxscraper-fts"]
