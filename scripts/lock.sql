set lines 2000
set pages 2000

select 
  l1.sid, 
  ' IS BLOCKING ', 
  l2.sid
from 
  v$lock l1, 
  v$lock l2
where 
  l1.block =1 
  and l2.request > 0
  and l1.id1=l2.id1
  and l1.id2=l2.id2
/

select s1.username || '@' || s1.machine || ' ( SID=' || s1.sid || ' ) is blocking '
|| s2.username || '@' || s2.machine || ' ( SID=' || s2.sid ||') for last ' || sw.seconds_in_wait ||' seconds.' AS blocking_status
from v$lock l1, v$session s1, v$lock l2, v$session s2, v$session_wait sw where s1.sid=l1.sid and s2.sid=l2.sid
and l1.BLOCK=1 and l2.request > 0 and l1.id1 = l2.id1 and l2.id2 = l2.id2 and
sw.sid = l1.sid;
