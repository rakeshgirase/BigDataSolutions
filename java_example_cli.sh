#!/bin/sh
hadoop fs -rm -r /javaoutput
hadoop jar solutions.jar com.roi.hadoop.wordcount.Main /shakespeare.txt /javaoutput
hadoop fs -cat /javaoutput/*
