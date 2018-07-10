FROM mcarans/hdx-python-api

MAINTAINER Michael Rans <rans@email.com>

RUN apk add --no-cache --update git && \
    git clone https://github.com/OCHA-DAP/hdxscraper-docker.git --single-branch && \
    cd hdxscraper-docker && \
    pip --no-cache-dir install -r requirements.txt && \
    apk del git && \
    rm -r /root/.cache && \
    rm -rf /var/lib/apk/*

CMD ["python3", "-m", "hdx.freshness"]
