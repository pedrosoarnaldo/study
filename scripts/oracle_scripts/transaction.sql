set head on
set echo on
set timin on

select
  s.sid,
  s.serial#,
  s.username,
  s.logon_time,
  round ((sum(used_ublk) * 8192) /1024 /1024,2) as MB
from
  gv$session s,
  gv$transaction t
where
  s.taddr = t.addr
group by
  s.sid,
  s.serial#,
  s.username,
  s.logon_time
/
