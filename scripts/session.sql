set lines 2000
set pages 2000

select 
  s.username,
  s.sid,
  s.serial#,
  p.spid,
  s.status,
  sa.sql_text
from 
  v$session s,
  v$process p,
  v$sqlarea sa
where 
  s.sid = &v_sid
  and s.paddr = p.addr
  and s.sql_address = sa.address
  and s.sql_hash_value = sa.hash_value
order by
  s.sid,
  sa.address
/