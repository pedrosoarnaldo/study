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
