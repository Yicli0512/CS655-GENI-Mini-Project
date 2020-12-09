#!/bin/bash

sudo apt-get update

sudo apt-get install python-pip

sudo apt-get install python-tk

pip install requests

pip install matplotlib

sudo wget https://raw.githubusercontent.com/Yicli0512/CS655-GENI-Mini-Project/master/withoutCache.py

python withoutCache.py
