#!/bin/sh -v
./tools/bin/cassandra-stress user profile="file:///home/lin/work-lanit/my_datana_cassandra/etc/my-test-column-one.sh" n=1 "ops(insert=1,simple1=0)"