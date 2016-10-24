set lines 1000
set pages 1000

exec dbms_output.put_line('This will show the maximum PGA usage per process:');

select
   max(pga_used_mem) max_pga_used_mem
   , max(pga_alloc_mem) max_pga_alloc_mem
   , max(pga_max_mem) max_pga_max_mem
from v$process
/

exec dbms_output.put_line('This displays the sum of all current PGA usage per process:');


select
   sum(pga_used_mem) sum_pga_used_mem
   , sum(pga_alloc_mem) sum_pga_alloc_mem
   , sum(pga_max_mem) sum_pga_max_mem
from v$process
/

exec dbms_output.put_line('Pga Advice:');

select *
from v$pga_target_advice
order by pga_target_for_estimate
/