#!/bin/bash

TIME=0

rm -rf stress.log

while [ "${TIME}" -lt "1" ];
do

  COUNT=0

  while [ "${COUNT}" -lt "51" ];
  do
    ./threads.pl >> stress.log 2>&1 &
    COUNT=`expr $COUNT + 1`
  done

  TIME=`expr $TIME + 1`
  echo $TIME
  sleep 70

done

