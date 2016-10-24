#!/bin/bash

TIME=0

rm -rf stress.log

while [ "${TIME}" -lt "1" ];
do

  COUNT=0

  while [ "${COUNT}" -lt "10" ];
  do
    (sqlplus arnaldo/bd54l0m3@PUBZOADO &)
    COUNT=`expr $COUNT + 1`
  done

  TIME=`expr $TIME + 1`
  echo $TIME
  sleep 300

done

