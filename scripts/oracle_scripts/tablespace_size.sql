set echo on
set timin on
set feedback on

sql_prompt (&tablespace);

select
  file_name,
  sum(bytes) /1024 /1024 as MB
from
  dba_data_files
where
  tablespace_name = upper('&tablespace')
group by
  file_name
/
