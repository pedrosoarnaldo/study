#!/bin/bash

source ~apedroso/.ssh_agent.txt

:> /tmp/ping.log

PING=`ping www.google.com.br -c 1 >> /tmp/ping.log 2>&1`
TOT_PING=`cat /tmp/ping.log | grep -i unknown | wc -l`

if [ "${TOT_PING}" == "1" ]; then
  sudo /etc/init.d/network restart
  PS=`ps -ef | grep -i ssh | grep -i 8080 | awk '{ print $2 '}`
  if [ "${PS}" != "" ]; then
    kill -9 ${PS}
  fi
fi

RETURN=`ssh apedroso@shortlog.org sudo nmap localhost | grep -i ^7001 | wc -l`

if [ "${RETURN}" == "0" ]; then
  (ssh -R 7001:localhost:666 -D localhost:8080 apedroso@shortlog.org vmstat 10 &)
fi
