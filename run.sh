#!/bin/sh

curl -so /root/.hdxkey $2
curl -so /root/.useragents.yml $3
curl -so /root/.extraparams.yml $4
cd /root/$1
python3 run.py
