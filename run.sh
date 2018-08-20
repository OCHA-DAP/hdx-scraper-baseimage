#!/bin/bash

echo $2 > /root/.hdxkey
curl -so /root/.useragents.yml $3
cd /root/$1
python3 run.py
