#!/bin/sh
OUTDIR_REMOTE=/output
OUTDIR_LOCAL=./output

# copy the input (normally this will have to be done only once)
hadoop fs -copyFromLocal ../datasets/transfers/transfers.txt /transfers.txt
hadoop fs -rm -r $OUTDIR_REMOTE  #Hadoop will not overwrite output

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
     -input /transfers.txt \
     -output $OUTDIR_REMOTE \
     -mapper 'transfers.py' \
     -file   'transfers.py' \
     -reducer aggregate

# get output from HDFS into local machine
rm -rf $OUTDIR_LOCAL
hadoop fs -copyToLocal $OUTDIR_REMOTE $OUTDIR_LOCAL

# now run R to create a graph
R --no-save < transfers.r
display transfers.png
