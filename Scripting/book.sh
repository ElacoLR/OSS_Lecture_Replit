#!/bin/bash

input="$1"

echo $1의 전화번호는 : $( grep "$input" book.txt | cut -d " " -f 4)