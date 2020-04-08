#!bin/bash



for i in `ls | grep -E "DS|DE" | grep ".fq" | sed "s/_1.fq//"| sed "s/_2.fq//" | uniq` ;

do

tar ${i}.fq

done

