#!/bin/sh
cat shakespeare.txt | ./print_digrams.pl lovely fair | sort | uniq -c
