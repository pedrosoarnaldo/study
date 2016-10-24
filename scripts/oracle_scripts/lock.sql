set lines 2000
set pages 2000

select 
  l1.sid, 
  ' IS BLOCKING ', 
  l2.sid
from 
  gv$lock l1, 
  gv$lock l2
where 
  l1.block =1 
  and l2.request > 0
  and l1.id1=l2.id1
  and l1.id2=l2.id2
/

select sid, sql_text
from gv$session s, gv$sql q
where sid in (select sid
from gv$session where state in ('WAITING')
and wait_class != 'Idle' and event='enq: TX - row lock contention'
and (
q.sql_id = s.sql_id or
q.sql_id = s.prev_sql_id));


select blocking_session, sid, serial#, wait_class, seconds_in_wait from gv$session where blocking_session is not NULL order by blocking_session;

