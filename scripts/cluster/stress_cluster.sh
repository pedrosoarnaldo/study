#!/bin/bash

TIME=0

#rm -rf stress.log
:> stress.log

while [ "${TIME}" -lt "100" ];
do

  COUNT=0

  while [ "${COUNT}" -lt "20" ];
  do
    ./testa_cluster.pl >> stress.log 2>&1 &
    COUNT=`expr $COUNT + 1`
  done

  TIME=`expr $TIME + 1`
  echo $TIME
  sleep 8

done

