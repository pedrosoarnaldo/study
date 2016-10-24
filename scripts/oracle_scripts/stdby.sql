set lines 1000
set pages 1000
set feedback off
set timi off

exec dbms_output.put_line('Verifica todos os archives rececibos');
select sequence#, thread#, applied from v$archived_log order by 1,2 ; 
exec dbms_output.put_line('');

exec dbms_output.put_line('');
exec dbms_output.put_line('');
exec dbms_output.put_line('Ultimo archive rececibo');
select max(l.SEQUENCE#), l.THREAD# from v$log l, v$archived_log a where l.SEQUENCE# = a.SEQUENCE# and l.THREAD# = a.THREAD# group by l.thread# ;
exec dbms_output.put_line('');

exec dbms_output.put_line('');
exec dbms_output.put_line('');
exec dbms_output.put_line('Ultimo archive aplicado');
exec dbms_output.put_line('');
select max(l.SEQUENCE#), l.THREAD# from v$log l, v$archived_log a where l.SEQUENCE# = a.SEQUENCE# and l.THREAD# = a.THREAD# and a.applied = 'YES' group by l.thread# ;

exec dbms_output.put_line('');
exec dbms_output.put_line('');
exec dbms_output.put_line ('GAP');
exec dbms_output.put_line('');
exec dbms_output.put_line ('--------');
SELECT * FROM V$ARCHIVE_GAP;
exec dbms_output.put_line ('--------');

exec dbms_output.put_line('');
exec dbms_output.put_line('');
exec dbms_output.put_line ('Andamento do processo de apply');
SELECT PROCESS, STATUS, THREAD#, SEQUENCE#, BLOCK#, BLOCKS FROM V$MANAGED_STANDBY;
exec dbms_output.put_line('');

exec dbms_output.put_line('');
exec dbms_output.put_line('');
