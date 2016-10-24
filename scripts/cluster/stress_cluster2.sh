#!/bin/bash

TIME=0

#rm -rf stress.log
:> stress2.log

while [ "${TIME}" -lt "100" ];
do

  COUNT=0

  while [ "${COUNT}" -lt "5" ];
  do
    ./testa_cluster2.pl >> stress2.log 2>&1 &
    COUNT=`expr $COUNT + 1`
  done

  TIME=`expr $TIME + 1`
  echo $TIME
  sleep 10

done

