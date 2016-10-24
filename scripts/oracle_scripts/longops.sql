column username   format a30
column START_TIME format a20
column opname     format a30
column target     format a30
column UNITS      format a10
column MESSAGE    format a100
column SQL_TEXT   format a200

set lines 2000
set pages 2000

SELECT sid, 
       serial#, 
       context, 
       sofar, 
       totalwork,
       round(nvl(sofar,1)/nvl(totalwork,1)*100,2) "% Complete",
       sql_hash_value
FROM v$session_longops
WHERE opname NOT LIKE '%aggregate%'
  AND totalwork != 0
  AND sofar <> totalwork
/

select sid,
       serial#, 
       sql_hash_value,
       elapsed_seconds, 
       (nvl(sofar,1)/nvl(totalwork,1))*100,
       opname,
       to_char(start_time,'dd/mm/yy hh24:mi:ss')
from v$session_longops
where (nvl(sofar,1)/nvl(totalwork,1))*100 <> 100       
and elapsed_seconds <> 0
/

select (l.elapsed_seconds * (l.totalwork - nvl(l.sofar,1))) / decode(nvl(sofar,1), 0, 1) "TIME_REMAINING",
       l.TIME_REMAINING,
       ( nvl(l.sofar,1) / l.totalwork ) * 100 "% concluido",
       l.SID, 
       l.SERIAL#, 
       l.USERNAME, 
       s.osuser,
       to_char(start_time,'dd/mm/yy hh24:mi:ss') "START_TIME",
       l.opname, 
       l.target, 
       l.sofar, 
       l.totalwork, 
       l.units, 
       l.elapsed_seconds, 
       l.message
from v$session_longops l,
      v$session s
where l.sofar < l.totalwork  
  and l.sid = s.sid
  and l.serial# = s.serial#
/

select (l.elapsed_seconds * (nvl(l.totalwork,1) - l.sofar)) / nvl(decode(nvl(sofar,1), 0, 1),1) "TIME_REMAINING",
       l.TIME_REMAINING,
       ( l.sofar / l.totalwork ) * 100 "% concluido",
       l.SID, 
       l.SERIAL#, 
       l.USERNAME, 
       s.osuser,
       to_char(start_time,'dd/mm/yy hh24:mi:ss') "START_TIME",
       l.opname, 
       l.target, 
       l.sofar, 
       l.totalwork, 
       l.units, 
       l.elapsed_seconds, 
       l.message,
       l.SQL_address,
       l.SQL_HASH_VALUE,
       (select distinct v.sql_text 
        from v$sql v 
        where v.address = l.SQL_address
          and v.HASH_VALUE = l.SQL_HASH_VALUE) sql_text
from v$session_longops l,
      v$session s
where l.sofar < l.totalwork  
  and l.sid = s.sid
  and l.serial# = s.serial#
/
