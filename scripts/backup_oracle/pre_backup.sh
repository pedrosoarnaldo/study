#!/bin/bash

INSTANCE_NUMBER=${1}

if [ "${INSTANCE_NUMBER}" == ""  ]; then
  echo "usage `basename ${0}` INSTANCE_NUMBER"
  echo "INSTANCE_NUMBER = Instance found in 'source oenv'" 
  exit 0
fi

source oenv ${INSTANCE_NUMBER}

sqlplus "/ as sysdba" @pre_backup.sql
sqlplus "/ as sysdba" @/tmp/pre_backup_swap.sql

