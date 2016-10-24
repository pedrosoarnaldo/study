set lines 2000
set pages 2000

select
  s.username,
  s.sid,
  s.serial#,
  p.spid,
  round((sum(used_ublk*8)/1024),2) as MB,
  sa.sql_text
from
  gv$session s,
  gv$process p,
  gv$sqlarea sa,
  gv$transaction t
where
  s.paddr = p.addr
  and s.sql_address = sa.address
  and s.sql_hash_value = sa.hash_value
  and s.status = 'ACTIVE'
  and s.taddr = t.addr(+)
group by
  s.username,
  s.sid,
  s.serial#,
  p.spid,
  sa.sql_text
order by
  s.username
/
