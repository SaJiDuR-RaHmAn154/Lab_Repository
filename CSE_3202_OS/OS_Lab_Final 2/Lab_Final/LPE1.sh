#!/bin/bash

echo "Reading from students.txt"

while read line
do
	echo "Hello,"$line
done < students.txt