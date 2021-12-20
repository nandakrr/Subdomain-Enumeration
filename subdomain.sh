#!/bin/bash

url=$1

findomain -t $1 | tee $1.txt
