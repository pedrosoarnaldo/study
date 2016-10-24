set feedback off
set echo off
set head off
set serveroutput on

spool /tmp/pre_backup_swap.sql

select 'alter tablespace '||TABLESPACE_NAME||' begin backup;' from dba_tablespaces  where contents <> 'TEMPORARY' ;
exec dbms_output.put_line('exit;');

exit;
