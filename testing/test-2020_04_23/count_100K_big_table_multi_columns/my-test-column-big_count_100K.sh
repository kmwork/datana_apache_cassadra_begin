#!/bin/sh -v
clear
export JAVA_HOME=/home/lin/apps/jdk13
export PATH=$JAVA_HOME/bin:$PATH
./tools/bin/cassandra-stress user profile="file:///home/lin/work-lanit/my_datana_cassandra/etc/kostya-big-table-cassandra-stress.yaml" n=100000 "ops(insert=1,simple_big1=1)"
