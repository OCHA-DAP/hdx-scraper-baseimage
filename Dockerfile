FROM mcarans/hdx-python-api

MAINTAINER Michael Rans <rans@email.com>

RUN curl -L https://github.com/OCHA-DAP/hdxscraper-docker/tarball/master | tar xz -C /root && \
    cd /root/OCHA* && \
    pip --no-cache-dir install cython && \
    pip --no-cache-dir install --no-build-isolation -r requirements.txt && \
    rm -r /root/.cache && \
    rm -rf /var/lib/apk/*

CMD ["python3", "-m", "hdx.freshness"]
