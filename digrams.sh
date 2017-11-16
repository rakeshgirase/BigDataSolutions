#!/bin/sh
OUTDIR_REMOTE=/output
OUTDIR_LOCAL=./output

# copy the input (normally this will have to be done only once)
hadoop fs -copyFromLocal shakespeare.txt /shakespeare.txt
hadoop fs -rm -r $OUTDIR_REMOTE  #Hadoop will not overwrite output

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
     -input /shakespeare.txt \
     -output $OUTDIR_REMOTE \
     -mapper 'print_digrams.py lovely fair' \
     -file   'print_digrams.py' \
     -reducer 'uniq -c'

#     -numReduceTasks 2

# get output from HDFS into local machine
rm -rf $OUTDIR_LOCAL
hadoop fs -copyToLocal $OUTDIR_REMOTE $OUTDIR_LOCAL
