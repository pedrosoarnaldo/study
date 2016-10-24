
-- pga.sql
-- 9i+ only
-- display PGA stats 
-- display sum of current pga usage for all sessions
-- display max of current pga usage for individual sessions

@pgacols

clear break

select *
from v$pgastat
order by lower(name)
/

select 
	sum(pga_used_mem) sum_pga_used_mem
	, sum(pga_alloc_mem) sum_pga_alloc_mem
	, sum(pga_max_mem) sum_pga_max_mem
from v$process
/

select 
	max(pga_used_mem) max_pga_used_mem
	, max(pga_alloc_mem) max_pga_alloc_mem
	, max(pga_max_mem) max_pga_max_mem
from v$process
/


