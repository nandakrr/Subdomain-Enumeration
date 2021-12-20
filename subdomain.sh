#!/bin/bash

url=$1

subfinder -d $1 | tee $1.txt