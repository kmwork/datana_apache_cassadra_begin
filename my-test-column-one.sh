#!/bin/sh
./tools/bin/cassandra-stress user profile=/home/lin/work-lanit/my_datana_cassandra/kostya-one-column-table-cassandra-stress.yaml n=1 "ops(insert=1,simple1=0)"