#!/bin/sh -v
clear
export JAVA_HOME=/home/lin/apps/jdk13
export PATH=$JAVA_HOME/bin:$PATH
./tools/bin/cassandra-stress user profile="file://kostya-one-column-table-cassandra-stress.yaml" n=1 "ops(insert=1,simple1=0)"