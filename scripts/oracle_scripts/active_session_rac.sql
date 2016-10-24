set lines 2000
set pages 2000

select
  s.username,
  s.sid,
  s.serial#,
  round((sum(used_ublk*8)/1024),2) as MB,
  sa.sql_text
from
  gv$session s,
  gv$sqlarea sa,
  gv$transaction t
where
  s.sql_address = sa.address
  and s.sql_hash_value = sa.hash_value
  and s.status = 'ACTIVE'
  and s.taddr = t.addr(+)
group by
  s.username,
  s.sid,
  s.serial#,
  sa.sql_text
order by
  s.username
/
