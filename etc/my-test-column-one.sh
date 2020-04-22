#!/bin/sh -v
clear
export JAVA_HOME=/home/lin/apps/jdk13
export PATH=$JAVA_HOME/bin:$PATH
./tools/bin/cassandra-stress user profile="file:///home/lin/work-lanit/my_datana_cassandra/etc/kostya-one-column-table-cassandra-stress.yaml" n=500000 "ops(insert=500000,simple1=500000)" truncate=always