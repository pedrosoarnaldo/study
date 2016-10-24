
-- pga_init.sql
-- use to initialize PGA automatic memory management
-- use pga.sql to determine size to start with

alter system set pga_aggregate_target = 500m;
alter system set workarea_size_policy = auto;

begin
	
	for prec in (
		select value
		from v$parameter
		where name like 'statistics_level'
	) loop

		if prec.value != 'TYPICAL' then
			execute immediate 'alter system set statistics_level = TYPICAL';
			dbms_output.put_line('!!WARNING!!');
			dbms_output.put_line('  The setting for statistics level was ' || prec.value);
			dbms_output.put_line('  It was reset to TYPICAL via ALTER SYSTEM');
			dbms_output.put_line('  Please change it to TYPICAL in the init.ora file');
			dbms_output.put_line('!!WARNING!!');
		end if;

	end loop;

end;
/



