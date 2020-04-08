#!bin/bash



for i in `ls | grep -E "DS|DE"` ;

do

gzip -v -t ${i}

done

