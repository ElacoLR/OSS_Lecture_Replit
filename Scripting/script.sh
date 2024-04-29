#!/bin/bash

echo hello world # 주석 달기

echo "$#" # O
echo '$#' # X

name="$1"
echo $name

echo $*