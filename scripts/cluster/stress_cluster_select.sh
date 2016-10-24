#!/bin/bash

TIME=0

#rm -rf stress_select.log
:> stress_select.log

while [ "${TIME}" -lt "100" ];
do

  COUNT=0

  while [ "${COUNT}" -lt "5" ];
  do
    ./testa_cluster_select.pl >> stress_select.log 2>&1 &
    COUNT=`expr $COUNT + 1`
  done

  TIME=`expr $TIME + 1`
  echo $TIME
  sleep 10

done

