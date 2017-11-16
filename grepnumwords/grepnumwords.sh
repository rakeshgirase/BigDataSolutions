#!/bin/sh
hadoop fs -copyFromLocal /home/student/roi_hadoop/datasets/shakespeare.txt /shakespeare.txt
hadoop fs -rm -r /javaoutput
hadoop jar /home/student/roi_hadoop/solutions/grepnumwords/target/grepnumwords-1.0.0.jar com.roi.hadoop.grepnumwords.Main /shakespeare.txt /javaoutput hungry fair
hadoop fs -cat /javaoutput/*
