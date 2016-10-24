set echo on
set timin on
set feedback on

sql_prompt (&&sid);

select
  *
from
  v$session_wait
where
  sid = &sid
/
