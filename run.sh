#!/bin/sh

cd /root
curl -H "Authorization: token $1" -L https://api.github.com/repos/UN-OCHA/hdxscraper-docker-private/tarball/master | tar xz -C . --strip-components=1
cd $2
python3 run.py

