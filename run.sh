#!/bin/sh

cd /root
git clone https://$1@github.com/UN-OCHA/hdxscraper-docker-private.git
cd $2
python3 run.py

