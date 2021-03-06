#!/bin/sh
OUTDIR_REMOTE=/output
OUTDIR_LOCAL=./output

# copy the input (normally this will have to be done only once)
hadoop fs -copyFromLocal shakespeare.txt /shakespeare.txt
hadoop fs -rm -r $OUTDIR_REMOTE  #Hadoop will not overwrite output

# the script has to be copied to all the machines! Note the -file option
# run
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
     -input /shakespeare.txt \
     -output $OUTDIR_REMOTE \
     -mapper 'countwords.pl lovely fair' \
     -file  'countwords.pl' \
     -reducer aggregate

# get output from HDFS into local machine
rm -rf $OUTDIR_LOCAL
hadoop fs -copyToLocal $OUTDIR_REMOTE $OUTDIR_LOCAL
