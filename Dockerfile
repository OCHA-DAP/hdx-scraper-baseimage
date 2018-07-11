FROM mcarans/hdx-python-api

MAINTAINER Michael Rans <rans@email.com>

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \ 
    curl -L https://github.com/OCHA-DAP/hdxscraper-docker/tarball/master | tar xz -C /root && \
    apk add --no-cache --update build-base python3-dev py3-numpy@edge py-numpy-dev@edge py3-scipy@edge && \ 
    cd /root/OCHA* && \
    pip --no-cache-dir install --no-build-isolation -r requirements.txt && \
    apk del build-base python3-dev py-numpy-dev && \
    rm -r /root/.cache && \
    rm -rf /var/lib/apk/*

CMD ["sh", "/root/OCHA*/run.sh", "hdxscraper-fts"]
