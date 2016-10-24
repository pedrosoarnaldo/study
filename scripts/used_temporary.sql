column sid_serial format a10
column username format a15
column spid format 999999
column program format a40
column mb_used format 9999999
column tablespace format a15
column statements format 9999

SELECT 
distinct
  S.sid || ',' || S.serial# sid_serial,
  s.inst_id, 
  S.username, 
  P.spid,
  P.program, 
  SUM (T.blocks) * TBS.block_size / 1024 / 1024 mb_used, 
  T.tablespace,
  COUNT(*) statements
FROM 
  gv$sort_usage T, 
  gv$session S, 
  dba_tablespaces TBS, 
  gv$process P
WHERE 
  T.session_addr = S.saddr AND 
  S.paddr = P.addr AND 
  T.tablespace = TBS.tablespace_name AND
  T.inst_id = S.inst_id AND
  P.inst_id = S.inst_id
GROUP BY 
  S.sid, 
  S.serial#,
  s.inst_id, 
  S.username, 
  P.spid, 
  P.program, 
  TBS.block_size, 
  T.tablespace
ORDER BY 
  mb_used;


SELECT A.tablespace_name tablespace, D.mb_total,
SUM (A.used_blocks * D.block_size) / 1024 / 1024 mb_used,
D.mb_total - SUM (A.used_blocks * D.block_size) / 1024 / 1024 mb_free
FROM v$sort_segment A,
(
SELECT B.name, C.block_size, SUM (C.bytes) / 1024 / 1024 mb_total
FROM gv$tablespace B, gv$tempfile C
WHERE B.ts#= C.ts#
GROUP BY B.name, C.block_size
) D
WHERE A.tablespace_name = D.name
GROUP by A.tablespace_name, D.mb_total;

