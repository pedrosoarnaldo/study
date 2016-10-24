mkdir -p /iG/dbms/oracle/admin/trbprd2/bdump
mkdir -p /iG/dbms/oracle/admin/trbprd2/cdump
mkdir -p /iG/dbms/oracle/admin/trbprd2/udump
mkdir -p /iG/dbms/oracle/admin/trbprd2/create

mkdir -p /iG/u01/oradata/trbprd2/ctl/
mkdir -p /iG/u01/oradata/trbprd2/arch

mkdir -p /iG/u01/oradata/trbprd2/rbs
mkdir -p /iG/u01/oradata/trbprd2/redo
mkdir -p /iG/u01/oradata/trbprd2/indx
mkdir -p /iG/u01/oradata/trbprd2/sys
mkdir -p /iG/u01/oradata/trbprd2/data
mkdir -p /iG/u01/oradata/trbprd2/tmp


cd $ORACLE_HOME/dbs

orapwd file=orapwtrbprd2 password=flamingo_gerente entries=50

export ORACLE_SID=trbprd2

sqlplus "/ as sysdba"
startup nomount pfile=/iG/dbms/oracle/product/9.2.0/dbs/inittrbprd2.ora

create database trbprd2
 user SYS identified by  od5v16l34
 user SYSTEM identified by od5v16l34
controlfile REUSE
logfile group 1 ('/iG/u01/oradata/trbprd2/redo/redo_01_1.log',
                 '/iG/u01/oradata/trbprd2/redo/redo_01_2.log') size 100M reuse,
        group 2 ('/iG/u01/oradata/trbprd2/redo/redo_02_1.log',
                 '/iG/u01/oradata/trbprd2/redo/redo_02_2.log') size 100M reuse,
        group 3 ('/iG/u01/oradata/trbprd2/redo/redo_03_1.log',
                 '/iG/u01/oradata/trbprd2/redo/redo_03_2.log') size 100M reuse,
        group 4 ('/iG/u01/oradata/trbprd2/redo/redo_04_1.log',
                 '/iG/u01/oradata/trbprd2/redo/redo_04_2.log') size 100M reuse
MAXLOGFILES 30
MAXLOGMEMBERS 3
MAXLOGHISTORY 200
MAXDATAFILES 999
MAXINSTANCES 1
archivelog
character set WE8ISO8859P1
datafile '/iG/u01/oradata/trbprd2/sys/system_01.dbf' SIZE 200M
   autoextend on next 100M maxsize unlimited
   extent management local
default temporary tablespace TSTEMP01
   tempfile '/iG/u01/oradata/trbprd2/tmp/tstemp01_01.dbf' SIZE 300M,
            '/iG/u01/oradata/trbprd2/tmp/tstemp01_02.dbf' SIZE 300M
undo tablespace UNDO
    datafile '/iG/u01/oradata/trbprd2/rbs/tsundo01_01.dbf' SIZE 300M,
             '/iG/u01/oradata/trbprd2/rbs/tsundo01_02.dbf' SIZE 300M
/


@$ORACLE_HOME/rdbms/admin/catalog.sql
@$ORACLE_HOME/rdbms/admin/catproc.sql

disconnect

connect system/<senha>
@$ORACLE_HOME/sqlplus/admin/pupbld.sql

connect sys / as sysdba
create spfile from pfile;

shutdown immediate;
startup;

create tablespace TOOLS
  datafile '/iG/u01/oradata/trbprd2/data/data_tools_01.dbf' size 250M,
           '/iG/u01/oradata/trbprd2/data/data_tools_02.dbf' size 250M
  extent management local SEGMENT SPACE MANAGEMENT AUTO uniform size 128k
/


create tablespace DATA_INFOQUEST_CRM_01
  datafile '/iG/u01/oradata/trbprd2/data/data_infoquest_crm_01.dbf' size 5120M,
           '/iG/u01/oradata/trbprd2/data/data_infoquest_crm_02.dbf' size 5120M,
		   '/iG/u01/oradata/trbprd2/data/data_infoquest_crm_03.dbf' size 5120M,
		   '/iG/u01/oradata/trbprd2/data/data_infoquest_crm_04.dbf' size 5120M
  extent management local SEGMENT SPACE MANAGEMENT AUTO uniform size 1024k
/

create tablespace INDX_INFOQUEST_CRM_01
  datafile '/iG/u01/oradata/trbprd2/data/indx_infoquest_crm_01.dbf' size 5120M,
           '/iG/u01/oradata/trbprd2/data/indx_infoquest_crm_02.dbf' size 5120M,
		   '/iG/u01/oradata/trbprd2/data/indx_infoquest_crm_03.dbf' size 5120M,
		   '/iG/u01/oradata/trbprd2/data/indx_infoquest_crm_04.dbf' size 5120M
  extent management local SEGMENT SPACE MANAGEMENT AUTO uniform size 10240k
/

alter tablespace DATA_INFOQUEST_CRM_01
add datafile '/iG/u01/oradata/trbprd2/data/data_infoquest_crm_05.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_06.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_07.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_08.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_09.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_10.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_11.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_12.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_13.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_14.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_15.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_16.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_17.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_18.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_19.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_20.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_21.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_22.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_23.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_24.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_25.dbf' size 5120M,
'/iG/u01/oradata/trbprd2/data/data_infoquest_crm_26.dbf' size 5120M
/

create user infoquest_crm identified by flamingo_gerente default tablespace DATA_INFOQUEST_CRM_01
temporary tablespace TSTEMP01
/

grant connect to infoquest_crm; 

grant resource to infoquest_crm; 

grant create session to infoquest_crm;

grant create materialized view to infoquest_crm;

grant create database link to infoquest_crm;

-- Na máquina TRBPRD1

sqlplus system/

create tablespace TS_MATERIALIZEDVIEW_LOG
  datafile '/iG/u01/oradata/trbprd1/data/data_tsmaterializedviewlog_01.dbf' size 500M,
           '/iG/u01/oradata/trbprd1/data/data_tsmaterializedviewlog_02.dbf' size 500M
  extent management local SEGMENT SPACE MANAGEMENT AUTO uniform size 1024k
/

create user snapshot_replicador identified by r3pl1c4t04r default tablespace TOOLS temporary tablespace TEMP;

grant create session to snapshot_replicador;

grant connect to snapshot_replicador;

alter user infoquest_crm quota UNLIMITED on TS_MATERIALIZEDVIEW_LOG;

-- Na máquina TRBPRD2

connect infoquest_crm/

create database link db_trbprd1 connect to snapshot_replicador identified by r3pl1c4t04r using 'trbprd1';


BEGIN
   DBMS_REFRESH.MAKE(
     name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '',
     next_date => SYSDATE,
     interval => '/*30:Min*/ sysdate + (30/24/60)',
     implicit_destroy => FALSE,
     lax => FALSE,
     job => 0,
     rollback_seg => NULL,
     push_deferred_rpc => FALSE,
     refresh_after_errors => FALSE,
     purge_option => NULL,
     parallelism => NULL,
     heap_size => NULL);
END;
/

commit;




-- master

CREATE SNAPSHOT LOG ON infoquest_crm.CRM_CLIENTE
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_CLIENTE to snapshot_replicador;
grant select on infoquest_crm.CRM_CLIENTE to snapshot_replicador;


CREATE SNAPSHOT LOG ON infoquest_crm.CNT_LANCAMENTO
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CNT_LANCAMENTO to snapshot_replicador;
grant select on infoquest_crm.CNT_LANCAMENTO to snapshot_replicador;


CREATE SNAPSHOT LOG ON infoquest_crm.CRM_PLANOASSINATURA
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_PLANOASSINATURA to snapshot_replicador;
grant select on infoquest_crm.CRM_PLANOASSINATURA to snapshot_replicador;

CREATE SNAPSHOT LOG ON infoquest_crm.CRM_TIPOPLANOASSINATURA
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_TIPOPLANOASSINAT to snapshot_replicador;
grant select on infoquest_crm.CRM_TIPOPLANOASSINATURA to snapshot_replicador;


CREATE SNAPSHOT LOG ON infoquest_crm.CRM_ASSINATURACOMISSIONAMENTO
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_ASSINATURACOMISS to snapshot_replicador;
grant select on infoquest_crm.CRM_ASSINATURACOMISSIONAMENTO to snapshot_replicador;


CREATE SNAPSHOT LOG ON infoquest_crm.CRM_ASSINATURAPAGAMENTO with rowid
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_ASSINATURAPAGAME to snapshot_replicador;
grant select on infoquest_crm.CRM_ASSINATURAPAGAMENTO to snapshot_replicador;



CREATE SNAPSHOT LOG ON infoquest_crm.CRM_ASSINATURAPAGAME_STAHIST
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_ASSINATURACOMISS to snapshot_replicador;
grant select on infoquest_crm.CRM_ASSINATURAPAGAME_STAHIST to snapshot_replicador;


select 'create snapshot log on infoquest_crm.'||table_name||' TABLESPACE TS_MATERIALIZEDVIEW_LOG;' from tables_to_replicate_tmp where flg_rowid = 'N';
select 'grant select on infoquest_crm.'||table_name||' to snapshot_replicador;' from tables_to_replicate_tmp;


select 
  'grant select, update, delete on infoquest_crm.'||b.LOG_TABLE||' to snapshot_replicador;' 
from 
  tables_to_replicate_tmp a,
  dba_snapshot_logs b 
where 
  a.table_name = b.master
/


select 'CREATE MATERIALIZED VIEW INFOQUEST_CRM.'||table_name||' TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.'||table_name||'@db_trbprd1;' 
from tables_to_replicate_tmp where flg_rowid = 'Y';


set lines 1000
set pages 1000
set trimspool off
set head off

spool group.sql
select 'BEGIN DBMS_REFRESH.ADD(name => ''"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"'', list => ''"INFOQUEST_CRM"."'||table_name||'"'', lax => TRUE); END;'
from tables_to_replicate_tmp where flg_rowid = 'Y';
spool off




-- primary

CREATE SNAPSHOT LOG ON infoquest_crm.CRM_REMESSAPAG
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_ASSINATURACOMISS to snapshot_replicador;
grant select on infoquest_crm.CRM_ASSINATURAPAGAME_STAHIST to snapshot_replicador;

-- slave

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_REMESSAPAG" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND
AS
select * from infoquest_crm.CRM_REMESSAPAG@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_REMESSAPAG"',
     lax => TRUE);
END;
/

COMMIT
/

create public synonym  CRM_REMESSAPAG for INFOQUEST_CRM.CRM_REMESSAPAG;

CREATE  INDEX INFOQUEST_CRM.IDX_CRM_REMESSAPAG_DATA_CHAVE ON INFOQUEST_CRM.CRM_REMESSAPAG(REM_DATA,REM_PAGCHAVE) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;
CREATE  INDEX INFOQUEST_CRM.IDX_CRM_REMESSAPAG_PAGCHAVE ON INFOQUEST_CRM.CRM_REMESSAPAG(REM_PAGCHAVE) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;
CREATE  INDEX INFOQUEST_CRM.IDX_REM_COD_REM_PAGCHAVE ON INFOQUEST_CRM.CRM_REMESSAPAG(REM_COD,REM_PAGCHAVE) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;

alter index INFOQUEST_CRM.IDX_CRM_REMESSAPAG_DATA_CHAVE noparallel;
alter index INFOQUEST_CRM.IDX_CRM_REMESSAPAG_PAGCHAVE noparallel;
alter index INFOQUEST_CRM.IDX_REM_COD_REM_PAGCHAVE noparallel;


CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_PAYMENT_NEGOTIATION_BKP" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND with rowid
AS
select * from infoquest_crm.CRM_ASSINATURAPAGAMENTO@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_PAYMENT_NEGOTIATION_BKP"',
     lax => TRUE);
END;
/

COMMIT
/


CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_ASSINATURACOMISSIONAMENTO" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND 
AS
select * from infoquest_crm.CRM_ASSINATURACOMISSIONAMENTO@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_ASSINATURACOMISSIONAMENTO"',
     lax => TRUE);
END;
/

COMMIT
/


CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_TIPOPLANOASSINATURA" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND 
AS
select * from infoquest_crm.CRM_TIPOPLANOASSINATURA@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_TIPOPLANOASSINATURA"',
     lax => TRUE);
END;
/

COMMIT
/

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_PLANOASSINATURA" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND 
AS
select * from infoquest_crm.CRM_PLANOASSINATURA@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_PLANOASSINATURA"',
     lax => TRUE);
END;
/

COMMIT
/

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_CLIENTE" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND 
AS
select * from infoquest_crm.CRM_CLIENTE@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_CLIENTE"',
     lax => TRUE);
END;
/

COMMIT
/

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CNT_LANCAMENTO" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND 
AS
select * from infoquest_crm.CNT_LANCAMENTO@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CNT_LANCAMENTO"',
     lax => TRUE);
END;
/

COMMIT
/


CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_CANALHISTORICO TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_CANALHISTORICO@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_CLIENTE_HIST_LOGIN TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_CLIENTE_HIST_LOGIN@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_CLIENTE_HIST_SENHA TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_CLIENTE_HIST_SENHA@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_CLIENTE_NAO_VENDA TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_CLIENTE_NAO_VENDA@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_DDD TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_DDD@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_FINANCIALMAILINGSOPTOUT TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_FINANCIALMAILINGSOPTOUT@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_IMPORT_ARQUIVO TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_IMPORT_ARQUIVO@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_IMPORT_BASETURBO TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_IMPORT_BASETURBO@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_IMP_FATURAMENTO_REG TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_IMP_FATURAMENTO_REG@db_trbprd1;

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_PAGAMENTOS_CONSOLIDADOS TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_PAGAMENTOS_CONSOLIDADOS@db_trbprd1;  

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_PAYMENT_NEGOTIATION_BKP TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_PAYMENT_NEGOTIATION_BKP@db_trbprd1;                        
                 
CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_PAGAMENTO_BB_CODIGORETORNO TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND AS select * from infoquest_crm.CRM_PAGAMENTO_BB_CODIGORETORNO@db_trbprd1;


grant select, update, delete on infoquest_crm.MLOG$_CRM_PAGAMENTO_BB_COD to snapshot_replicador;
grant select on infoquest_crm.CRM_PAGAMENTO_BB_CODIGORETORNO to snapshot_replicador;

---

BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_CANALHISTORICO"', lax => TRUE); END;                   
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_CLIENTE_HIST_LOGIN"', lax => TRUE); END;               
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_CLIENTE_HIST_SENHA"', lax => TRUE); END;               
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_CLIENTE_NAO_VENDA"', lax => TRUE); END;                
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_DDD"', lax => TRUE); END;                              
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_FINANCIALMAILINGSOPTOUT"', lax => TRUE); END;          
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_IMPORT_ARQUIVO"', lax => TRUE); END;                   
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_IMPORT_BASETURBO"', lax => TRUE); END;                 
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_IMP_FATURAMENTO_REG"', lax => TRUE); END;              
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_PAGAMENTOS_CONSOLIDADOS"', lax => TRUE); END;          
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_PAYMENT_NEGOTIATION_BKP"', lax => TRUE); END;          
/
BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_PAGAMENTO_BB_CODIGORETORNO"', lax => TRUE); END;       
/
commit;


set lines 1000
set pages 1000
set trimspool on
set head off
spool materialized_view.sql


select 'CREATE MATERIALIZED VIEW INFOQUEST_CRM.'||table_name||' TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.'||table_name||'@db_trbprd1;' 
from tables_to_replicate_tmp where flg_rowid = 'N' order by table_name;

spool off

spool group.sql

select 'BEGIN DBMS_REFRESH.ADD(name => ''"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"'', list => ''"INFOQUEST_CRM"."'||table_name||'"'', lax => TRUE); END;'
from tables_to_replicate_tmp where flg_rowid = 'N' order by table_name;
spool off


create public synonym CRM_CLIENTE for INFOQUEST_CRM.CRM_CLIENTE;
create public synonym CRM_PLANOASSINATURA for INFOQUEST_CRM.CRM_PLANOASSINATURA;
create public synonym CRM_TIPOPLANOASSINATURA for INFOQUEST_CRM.CRM_TIPOPLANOASSINATURA;
create public synonym CRM_ASSINATURACOMISSIONAMENTO for INFOQUEST_CRM.CRM_ASSINATURACOMISSIONAMENTO;
create public synonym CRM_ASSINATURAPAGAMENTO for INFOQUEST_CRM.CRM_ASSINATURAPAGAMENTO;
create public synonym CRM_PAYMENT_NEGOTIATION_BKP for INFOQUEST_CRM.CRM_PAYMENT_NEGOTIATION_BKP;
create public synonym CRM_CANALHISTORICO for INFOQUEST_CRM.CRM_CANALHISTORICO;
create public synonym CRM_CLIENTE_HIST_LOGIN for INFOQUEST_CRM.CRM_CLIENTE_HIST_LOGIN;
create public synonym CRM_CLIENTE_HIST_SENHA for INFOQUEST_CRM.CRM_CLIENTE_HIST_SENHA;
create public synonym CRM_CLIENTE_NAO_VENDA for INFOQUEST_CRM.CRM_CLIENTE_NAO_VENDA;
create public synonym CRM_DDD for INFOQUEST_CRM.CRM_DDD;
create public synonym CRM_FINANCIALMAILINGSOPTOUT for INFOQUEST_CRM.CRM_FINANCIALMAILINGSOPTOUT;
create public synonym CRM_IMPORT_ARQUIVO for INFOQUEST_CRM.CRM_IMPORT_ARQUIVO;
create public synonym CRM_IMPORT_BASETURBO for INFOQUEST_CRM.CRM_IMPORT_BASETURBO;
create public synonym CRM_IMP_FATURAMENTO_REG for INFOQUEST_CRM.CRM_IMP_FATURAMENTO_REG;
create public synonym CNT_LANCAMENTO for INFOQUEST_CRM.CNT_LANCAMENTO;
create public synonym CRM_PAGAMENTOS_CONSOLIDADOS for INFOQUEST_CRM.CRM_PAGAMENTOS_CONSOLIDADOS;
create public synonym CRM_PAGAMENTO_BB_CODIGORETORNO for INFOQUEST_CRM.CRM_PAGAMENTO_BB_CODIGORETORNO;
create public synonym CRM_ASSINATURA_STATUS_HIST for INFOQUEST_CRM.CRM_ASSINATURA_STATUS_HIST;
create public synonym CNT_CONTA for INFOQUEST_CRM.CNT_CONTA;
create public synonym CNT_CONTAGRUPO for INFOQUEST_CRM.CNT_CONTAGRUPO;
create public synonym CNT_CONTATIPO for INFOQUEST_CRM.CNT_CONTATIPO;
create public synonym CNT_OBJETOCONTABIL for INFOQUEST_CRM.CNT_OBJETOCONTABIL;
create public synonym CNT_PERFIL for INFOQUEST_CRM.CNT_PERFIL;
create public synonym CNT_PERFIL_ACAO for INFOQUEST_CRM.CNT_PERFIL_ACAO;
create public synonym CRM_ACCESSCONFIGURATIONPOLL for INFOQUEST_CRM.CRM_ACCESSCONFIGURATIONPOLL;
create public synonym CRM_ACCESSPRDETXREVALIDATION for INFOQUEST_CRM.CRM_ACCESSPRDETXREVALIDATION;
create public synonym CRM_ACCORD for INFOQUEST_CRM.CRM_ACCORD;
create public synonym CRM_ACTIVECAMPAIGNHIST for INFOQUEST_CRM.CRM_ACTIVECAMPAIGNHIST;
create public synonym CRM_ATENDIMENTO for INFOQUEST_CRM.CRM_ATENDIMENTO;
create public synonym CRM_ATENDIMENTOTIPO for INFOQUEST_CRM.CRM_ATENDIMENTOTIPO;
create public synonym CRM_BANCOS for INFOQUEST_CRM.CRM_BANCOS;
create public synonym CRM_BANK_BRANCH for INFOQUEST_CRM.CRM_BANK_BRANCH;
create public synonym CRM_BRTURBO_ACCOMPANIMENT for INFOQUEST_CRM.CRM_BRTURBO_ACCOMPANIMENT;
create public synonym CRM_BUYER for INFOQUEST_CRM.CRM_BUYER;
create public synonym CRM_CAMPANHA for INFOQUEST_CRM.CRM_CAMPANHA;
create public synonym CRM_CAMPANHA_AUTOMATICA for INFOQUEST_CRM.CRM_CAMPANHA_AUTOMATICA;
create public synonym CRM_CANAL for INFOQUEST_CRM.CRM_CANAL;
create public synonym CRM_CANALCATEGORIA for INFOQUEST_CRM.CRM_CANALCATEGORIA;
create public synonym CRM_CANALFILIAL for INFOQUEST_CRM.CRM_CANALFILIAL;
create public synonym CRM_CANALGRUPOCANAL for INFOQUEST_CRM.CRM_CANALGRUPOCANAL;
create public synonym CRM_CANALSTATUS for INFOQUEST_CRM.CRM_CANALSTATUS;
create public synonym CRM_CANCELAMENTOMOTIVO for INFOQUEST_CRM.CRM_CANCELAMENTOMOTIVO;
create public synonym CRM_CANCELAMENTOMOTIVOGRUPO for INFOQUEST_CRM.CRM_CANCELAMENTOMOTIVOGRUPO;
create public synonym CRM_CARTAO_BANDEIRA for INFOQUEST_CRM.CRM_CARTAO_BANDEIRA;
create public synonym CRM_CLASSE_CAMPANHA for INFOQUEST_CRM.CRM_CLASSE_CAMPANHA;
create public synonym CRM_CLIENTCONTINGENCY for INFOQUEST_CRM.CRM_CLIENTCONTINGENCY;
create public synonym CRM_CLIENTETIPO for INFOQUEST_CRM.CRM_CLIENTETIPO;
create public synonym CRM_CLIENTE_LOG_ACESSOS for INFOQUEST_CRM.CRM_CLIENTE_LOG_ACESSOS;
create public synonym CRM_CLIENTSYNCHRONIZE for INFOQUEST_CRM.CRM_CLIENTSYNCHRONIZE;
create public synonym CRM_COMISSIONAMENTO for INFOQUEST_CRM.CRM_COMISSIONAMENTO;
create public synonym CRM_COMMISSIONINGCONDITIONS for INFOQUEST_CRM.CRM_COMMISSIONINGCONDITIONS;
create public synonym CRM_CONCILIATIONCONTROL for INFOQUEST_CRM.CRM_CONCILIATIONCONTROL;
create public synonym CRM_CONCILIATIONREPORT for INFOQUEST_CRM.CRM_CONCILIATIONREPORT;
create public synonym CRM_CONFIGACCESSOBJ for INFOQUEST_CRM.CRM_CONFIGACCESSOBJ;
create public synonym CRM_CONFIGACCESSRULE for INFOQUEST_CRM.CRM_CONFIGACCESSRULE;
create public synonym CRM_CONTRATOGRUPOCANAL for INFOQUEST_CRM.CRM_CONTRATOGRUPOCANAL;
create public synonym CRM_CPNLOGONHIST for INFOQUEST_CRM.CRM_CPNLOGONHIST;
create public synonym CRM_CPNPAGEACCESSHIST for INFOQUEST_CRM.CRM_CPNPAGEACCESSHIST;
create public synonym CRM_CPNPAGENAMES for INFOQUEST_CRM.CRM_CPNPAGENAMES;
create public synonym CRM_CUSTOMERGENDERVALIDATION for INFOQUEST_CRM.CRM_CUSTOMERGENDERVALIDATION;
create public synonym CRM_CUSTOMERGENDERVALIDHIST for INFOQUEST_CRM.CRM_CUSTOMERGENDERVALIDHIST;
create public synonym CRM_DBMEXECUTIONROUTINE for INFOQUEST_CRM.CRM_DBMEXECUTIONROUTINE;
create public synonym CRM_DESCONTO for INFOQUEST_CRM.CRM_DESCONTO;
create public synonym CRM_DOMINIO_LISTANEGRA for INFOQUEST_CRM.CRM_DOMINIO_LISTANEGRA;
create public synonym CRM_EACANCELLATIONREASON for INFOQUEST_CRM.CRM_EACANCELLATIONREASON;
create public synonym CRM_EDUCATIONLEVEL for INFOQUEST_CRM.CRM_EDUCATIONLEVEL;
create public synonym CRM_EMAILCONFIG for INFOQUEST_CRM.CRM_EMAILCONFIG;
create public synonym CRM_EMPLOYEENUMBER for INFOQUEST_CRM.CRM_EMPLOYEENUMBER;
create public synonym CRM_ENTIREXREVALIDATION for INFOQUEST_CRM.CRM_ENTIREXREVALIDATION;
create public synonym CRM_ENTIREX_FLAGGED_SALES for INFOQUEST_CRM.CRM_ENTIREX_FLAGGED_SALES;
create public synonym CRM_ENTIREX_RETURN for INFOQUEST_CRM.CRM_ENTIREX_RETURN;
create public synonym CRM_ENTIREX_VERIFICATION for INFOQUEST_CRM.CRM_ENTIREX_VERIFICATION;
create public synonym CRM_ESTADO_UF for INFOQUEST_CRM.CRM_ESTADO_UF;
create public synonym CRM_EXTERNALACCOUNT for INFOQUEST_CRM.CRM_EXTERNALACCOUNT;
create public synonym CRM_EXTERNALACCOUNTEVENTACTION for INFOQUEST_CRM.CRM_EXTERNALACCOUNTEVENTACTION;
create public synonym CRM_EXTERNALACCOUNTEVENTQUEUE for INFOQUEST_CRM.CRM_EXTERNALACCOUNTEVENTQUEUE;
create public synonym CRM_EXTERNALACCOUNTSTATUS for INFOQUEST_CRM.CRM_EXTERNALACCOUNTSTATUS;
create public synonym CRM_FINANCIALREPOSITION for INFOQUEST_CRM.CRM_FINANCIALREPOSITION;
create public synonym CRM_FINANCIALREPOSITIONHIST for INFOQUEST_CRM.CRM_FINANCIALREPOSITIONHIST;
create public synonym CRM_ADDRESS for INFOQUEST_CRM.CRM_ADDRESS;
create public synonym CRM_ADDRESSEETYPE for INFOQUEST_CRM.CRM_ADDRESSEETYPE;
create public synonym CRM_ADDRESSEETYPE_CLIENT for INFOQUEST_CRM.CRM_ADDRESSEETYPE_CLIENT;
create public synonym CRM_AFFILIATEREMITTANCE for INFOQUEST_CRM.CRM_AFFILIATEREMITTANCE;
create public synonym CRM_AFFILIATESALES for INFOQUEST_CRM.CRM_AFFILIATESALES;
create public synonym CRM_AREA for INFOQUEST_CRM.CRM_AREA;
create public synonym CRM_AREAGRUPO for INFOQUEST_CRM.CRM_AREAGRUPO;
create public synonym CRM_AREAGRUPO_PERMISSAO for INFOQUEST_CRM.CRM_AREAGRUPO_PERMISSAO;
create public synonym CRM_AREAPERMISSIONHIST for INFOQUEST_CRM.CRM_AREAPERMISSIONHIST;
create public synonym CRM_AREAUSERHIST for INFOQUEST_CRM.CRM_AREAUSERHIST;
create public synonym CRM_AREA_USUARIO for INFOQUEST_CRM.CRM_AREA_USUARIO;
create public synonym CRM_ASSINATURABOLETO for INFOQUEST_CRM.CRM_ASSINATURABOLETO;
create public synonym CRM_ASSINATURAPAGAMENTO_BOLETO for INFOQUEST_CRM.CRM_ASSINATURAPAGAMENTO_BOLETO;
create public synonym CRM_ASSINATURASTATUS for INFOQUEST_CRM.CRM_ASSINATURASTATUS;
create public synonym CRM_ASSINATURASTATUSGRUPO for INFOQUEST_CRM.CRM_ASSINATURASTATUSGRUPO;
create public synonym CRM_ASSINATURA_DESCCONCEDER for INFOQUEST_CRM.CRM_ASSINATURA_DESCCONCEDER;
create public synonym CRM_FINANCIALREPOSITIONSTATUS for INFOQUEST_CRM.CRM_FINANCIALREPOSITIONSTATUS;
create public synonym CRM_FORMAPAGAMENTO for INFOQUEST_CRM.CRM_FORMAPAGAMENTO;
create public synonym CRM_GRUPOCANAL for INFOQUEST_CRM.CRM_GRUPOCANAL;
create public synonym CRM_GRUPOCANALCOMISSAO for INFOQUEST_CRM.CRM_GRUPOCANALCOMISSAO;
create public synonym CRM_GRUPOCANALMETA for INFOQUEST_CRM.CRM_GRUPOCANALMETA;
create public synonym CRM_GRUPOCANALTIPO for INFOQUEST_CRM.CRM_GRUPOCANALTIPO;
create public synonym CRM_HOLIDAYS for INFOQUEST_CRM.CRM_HOLIDAYS;
create public synonym CRM_IGPROMOTIONCOMMISSION for INFOQUEST_CRM.CRM_IGPROMOTIONCOMMISSION;
create public synonym CRM_IMPORT_ARQUIVOTIPO for INFOQUEST_CRM.CRM_IMPORT_ARQUIVOTIPO;
create public synonym CRM_IMP_FATURAMENTO_ARQ for INFOQUEST_CRM.CRM_IMP_FATURAMENTO_ARQ;
create public synonym CRM_INTEGRATELEMARCONFIG for INFOQUEST_CRM.CRM_INTEGRATELEMARCONFIG;
create public synonym CRM_INTEGRATELEMARERROR for INFOQUEST_CRM.CRM_INTEGRATELEMARERROR;
create public synonym CRM_INTEGRATION_ERROR_ACTION for INFOQUEST_CRM.CRM_INTEGRATION_ERROR_ACTION;
create public synonym CRM_INTEGRATION_ERROR_QUEUE for INFOQUEST_CRM.CRM_INTEGRATION_ERROR_QUEUE;
create public synonym CRM_INTERVENTIONPAGECANDIDATE for INFOQUEST_CRM.CRM_INTERVENTIONPAGECANDIDATE;
create public synonym CRM_INTTELEMARRETURN_ASS for INFOQUEST_CRM.CRM_INTTELEMARRETURN_ASS;
create public synonym CRM_KINSHIPDEGREE for INFOQUEST_CRM.CRM_KINSHIPDEGREE;
create public synonym CRM_LISTANEGRA_APPEND for INFOQUEST_CRM.CRM_LISTANEGRA_APPEND;
create public synonym CRM_LISTANEGRA_TEL for INFOQUEST_CRM.CRM_LISTANEGRA_TEL;
create public synonym CRM_LOGGEDCLIENT for INFOQUEST_CRM.CRM_LOGGEDCLIENT;
create public synonym CRM_MAILINGCLASSIFICATIONDATA for INFOQUEST_CRM.CRM_MAILINGCLASSIFICATIONDATA;
create public synonym CRM_MAILINGCLASSIFICATIONTASK for INFOQUEST_CRM.CRM_MAILINGCLASSIFICATIONTASK;
create public synonym CRM_MARITALSTATUS for INFOQUEST_CRM.CRM_MARITALSTATUS;
create public synonym CRM_MCAFEEACCOUNTIG for INFOQUEST_CRM.CRM_MCAFEEACCOUNTIG;
create public synonym CRM_MCAFEEREPORTDATA for INFOQUEST_CRM.CRM_MCAFEEREPORTDATA;
create public synonym CRM_MCAFEE_ACCOUNT for INFOQUEST_CRM.CRM_MCAFEE_ACCOUNT;
create public synonym CRM_MEASUREUNIT for INFOQUEST_CRM.CRM_MEASUREUNIT;
create public synonym CRM_MUNICIPIO for INFOQUEST_CRM.CRM_MUNICIPIO;
create public synonym CRM_NEGOTIATION_RESULT for INFOQUEST_CRM.CRM_NEGOTIATION_RESULT;
create public synonym CRM_NEGOTIATION_RESULTREASON for INFOQUEST_CRM.CRM_NEGOTIATION_RESULTREASON;
create public synonym CRM_NETMOVIESPAYMENT for INFOQUEST_CRM.CRM_NETMOVIESPAYMENT;
create public synonym CRM_ONLINECANCELLATIONATTEMPT for INFOQUEST_CRM.CRM_ONLINECANCELLATIONATTEMPT;
create public synonym CRM_ONLINECANCELLATIONHISTORY for INFOQUEST_CRM.CRM_ONLINECANCELLATIONHISTORY;
create public synonym CRM_OPERADORATELEFONE for INFOQUEST_CRM.CRM_OPERADORATELEFONE;
create public synonym CRM_OPERADORATELEFONE_ESTADO for INFOQUEST_CRM.CRM_OPERADORATELEFONE_ESTADO;
create public synonym CRM_OPERADORTIPO for INFOQUEST_CRM.CRM_OPERADORTIPO;
create public synonym CRM_OPERADORTIPO_TABELACAMPO for INFOQUEST_CRM.CRM_OPERADORTIPO_TABELACAMPO;
create public synonym CRM_ORIGEM for INFOQUEST_CRM.CRM_ORIGEM;
create public synonym CRM_PAGAMENTOSTATUS for INFOQUEST_CRM.CRM_PAGAMENTOSTATUS;
create public synonym CRM_PAGAMENTO_VISA_MENSAGEM for INFOQUEST_CRM.CRM_PAGAMENTO_VISA_MENSAGEM;
create public synonym CRM_PAYMENTMETHODCOMMISSION for INFOQUEST_CRM.CRM_PAYMENTMETHODCOMMISSION;
create public synonym CRM_PAYMENT_NEGOTIATION for INFOQUEST_CRM.CRM_PAYMENT_NEGOTIATION;
create public synonym CRM_PAYMENT_RETURN_CATEGORY for INFOQUEST_CRM.CRM_PAYMENT_RETURN_CATEGORY;
create public synonym CRM_PAYMENT_RETURN_SUBSTATUS for INFOQUEST_CRM.CRM_PAYMENT_RETURN_SUBSTATUS;
create public synonym CRM_PERIODOPAGAMENTO for INFOQUEST_CRM.CRM_PERIODOPAGAMENTO;
create public synonym CRM_PHONETYPE for INFOQUEST_CRM.CRM_PHONETYPE;
create public synonym CRM_PLANO_CAMPANHA for INFOQUEST_CRM.CRM_PLANO_CAMPANHA;
create public synonym CRM_PLANO_OPERADORATELEFONE for INFOQUEST_CRM.CRM_PLANO_OPERADORATELEFONE;
create public synonym CRM_PRESALE for INFOQUEST_CRM.CRM_PRESALE;
create public synonym CRM_PRESALEPRIORIZATION for INFOQUEST_CRM.CRM_PRESALEPRIORIZATION;
create public synonym CRM_PRESALEREASON for INFOQUEST_CRM.CRM_PRESALEREASON;
create public synonym CRM_PRESALEREASONGROUP for INFOQUEST_CRM.CRM_PRESALEREASONGROUP;
create public synonym CRM_QUALIFICACAO for INFOQUEST_CRM.CRM_QUALIFICACAO;
create public synonym CRM_QUALIFICACAOGRUPO for INFOQUEST_CRM.CRM_QUALIFICACAOGRUPO;
create public synonym CRM_QUALIFICACAOTIPO for INFOQUEST_CRM.CRM_QUALIFICACAOTIPO;
create public synonym CRM_REPOSITIONREASON for INFOQUEST_CRM.CRM_REPOSITIONREASON;
create public synonym CRM_SALE_TERMINAL_NOTINSTALLED for INFOQUEST_CRM.CRM_SALE_TERMINAL_NOTINSTALLED;
create public synonym CRM_SEGMENTO for INFOQUEST_CRM.CRM_SEGMENTO;
create public synonym CRM_SERVICE for INFOQUEST_CRM.CRM_SERVICE;
create public synonym CRM_SERVICECONFIG for INFOQUEST_CRM.CRM_SERVICECONFIG;
create public synonym CRM_SERVICECONFIGVALUE for INFOQUEST_CRM.CRM_SERVICECONFIGVALUE;
create public synonym CRM_SERVICEPARAMETER for INFOQUEST_CRM.CRM_SERVICEPARAMETER;
create public synonym CRM_SERVICEPARAMETERTYPE for INFOQUEST_CRM.CRM_SERVICEPARAMETERTYPE;
create public synonym CRM_SERVICEPARAMETERVALUE for INFOQUEST_CRM.CRM_SERVICEPARAMETERVALUE;
create public synonym CRM_SERVICEPARAMETER_SERVICE for INFOQUEST_CRM.CRM_SERVICEPARAMETER_SERVICE;
create public synonym CRM_SERVICEPRODUCT_ACCOUNT for INFOQUEST_CRM.CRM_SERVICEPRODUCT_ACCOUNT;
create public synonym CRM_SERVICE_PRODUCT for INFOQUEST_CRM.CRM_SERVICE_PRODUCT;
create public synonym CRM_SERVICOOPERADORA for INFOQUEST_CRM.CRM_SERVICOOPERADORA;
create public synonym CRM_SYNCFIELD for INFOQUEST_CRM.CRM_SYNCFIELD;
create public synonym CRM_SYNCHRONIZESTATUS for INFOQUEST_CRM.CRM_SYNCHRONIZESTATUS;
create public synonym CRM_SYNCRETURN for INFOQUEST_CRM.CRM_SYNCRETURN;
create public synonym CRM_SYNCRETURNGROUP for INFOQUEST_CRM.CRM_SYNCRETURNGROUP;
create public synonym CRM_USERACTIVATIONHIST for INFOQUEST_CRM.CRM_USERACTIVATIONHIST;
create public synonym CRM_USERCONTINGENCY for INFOQUEST_CRM.CRM_USERCONTINGENCY;
create public synonym CRM_USERSYNCHRONIZE for INFOQUEST_CRM.CRM_USERSYNCHRONIZE;
create public synonym CRM_USUARIOTIPO for INFOQUEST_CRM.CRM_USUARIOTIPO;
create public synonym CRM_WELCOMECALLACCOUNT for INFOQUEST_CRM.CRM_WELCOMECALLACCOUNT;
create public synonym CRM_WELCOMECALLCONFIGVALUE for INFOQUEST_CRM.CRM_WELCOMECALLCONFIGVALUE;
create public synonym CRM_WELCOMECALLPROCESS for INFOQUEST_CRM.CRM_WELCOMECALLPROCESS;
create public synonym CRM_WELCOMECALLRETURN for INFOQUEST_CRM.CRM_WELCOMECALLRETURN;
create public synonym CRM_WIFI_HOTSPOT for INFOQUEST_CRM.CRM_WIFI_HOTSPOT;
create public synonym CRM_WIFI_HOTSPOTREDE for INFOQUEST_CRM.CRM_WIFI_HOTSPOTREDE;
create public synonym CRM_WIFI_HOTSPOTTIPO for INFOQUEST_CRM.CRM_WIFI_HOTSPOTTIPO;
create public synonym CRM_WIFI_LOGINADICIONAL for INFOQUEST_CRM.CRM_WIFI_LOGINADICIONAL;
create public synonym CRM_WIFI_RADIUS_ACESSO for INFOQUEST_CRM.CRM_WIFI_RADIUS_ACESSO;
create public synonym DBTABLELOCK for INFOQUEST_CRM.DBTABLELOCK;
create public synonym HDK_ORGANIZACAO for INFOQUEST_CRM.HDK_ORGANIZACAO;
create public synonym PERMISSAO for INFOQUEST_CRM.PERMISSAO;
create public synonym CRM_ACCESS_RADIUS for INFOQUEST_CRM.CRM_ACCESS_RADIUS;
create public synonym CRM_AREA_GERENTE for INFOQUEST_CRM.CRM_AREA_GERENTE;
create public synonym CRM_AREA_PERMISSAO for INFOQUEST_CRM.CRM_AREA_PERMISSAO;
create public synonym CRM_BANCO_PAGAMENTOREMESSA for INFOQUEST_CRM.CRM_BANCO_PAGAMENTOREMESSA;
create public synonym CRM_CLIENTEDICIONARIO for INFOQUEST_CRM.CRM_CLIENTEDICIONARIO;
create public synonym CRM_CLIENTE_HIST_ESTUF for INFOQUEST_CRM.CRM_CLIENTE_HIST_ESTUF;
create public synonym CRM_CODEMAPPING for INFOQUEST_CRM.CRM_CODEMAPPING;
create public synonym CRM_DDDUF for INFOQUEST_CRM.CRM_DDDUF;
create public synonym CRM_FIM_CONSOLIDADO for INFOQUEST_CRM.CRM_FIM_CONSOLIDADO;
create public synonym RMN_REPORTCACHE for INFOQUEST_CRM.RMN_REPORTCACHE;
create public synonym RMN_REPORTGROUPCONFIGURATION for INFOQUEST_CRM.RMN_REPORTGROUPCONFIGURATION;
create public synonym TAB_ANO for INFOQUEST_CRM.TAB_ANO;
create public synonym TAB_DATA for INFOQUEST_CRM.TAB_DATA;
create public synonym TAB_DATA2 for INFOQUEST_CRM.TAB_DATA2;
create public synonym TAB_DIA for INFOQUEST_CRM.TAB_DIA;
create public synonym TAB_MES for INFOQUEST_CRM.TAB_MES;
create public synonym USUARIO for INFOQUEST_CRM.USUARIO;
create public synonym USUARIO_PERMISSAO for INFOQUEST_CRM.USUARIO_PERMISSAO;


create user sydle_reporter identified by mudar123 default tablespace tools temporary tablespace TSTEMP01;

grant connect to sydle_reporter;
grant create session to sydle_reporter;
grant select any table to sydle_reporter;

-- primary

CREATE SNAPSHOT LOG ON infoquest_crm.crm_assinatura
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_ASSINATURA to snapshot_replicador;
grant select on infoquest_crm.CRM_ASSINATURA to snapshot_replicador;


CREATE SNAPSHOT LOG ON infoquest.usuario
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest.MLOG$_USUARIO to snapshot_replicador;
grant select on infoquest.usuario to snapshot_replicador;


CREATE SNAPSHOT LOG ON infoquest_crm.radacctlog with rowid
/

grant select, update, delete on infoquest_crm.MLOG$_RADACCTLOG to snapshot_replicador;
grant select on infoquest_crm.radacctlog to snapshot_replicador;


CREATE SNAPSHOT LOG ON infoquest_crm.CRM_ADSLPORTASTATUSESTACAO with rowid
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_ADSLPORTASTATUSE to snapshot_replicador;
grant select on infoquest_crm.CRM_ADSLPORTASTATUSESTACAO to snapshot_replicador;


--

CREATE MATERIALIZED VIEW INFOQUEST_CRM.CRM_ADSLPORTASTATUSESTACAO TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND with rowid AS select * from infoquest_crm.CRM_ADSLPORTASTATUSESTACAO@db_trbprd1;


BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."CRM_ADSLPORTASTATUSESTACAO"', lax => TRUE); END;                   
/

commit;


CREATE MATERIALIZED VIEW INFOQUEST_CRM.INFOQUEST_USUARIO TABLESPACE DATA_INFOQUEST_CRM_01 BUILD IMMEDIATE USING INDEX TABLESPACE INDX_INFOQUEST_CRM_01 REFRESH FAST ON DEMAND AS select * from infoquest.usuario@db_trbprd1;


BEGIN DBMS_REFRESH.ADD(name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"', list => '"INFOQUEST_CRM"."INFOQUEST_USUARIO"', lax => TRUE); END;                   
/

commit;

create view CRM_ASSINATURA_CANCEL_HIST as
select
hist_novo.ASSSTAH_ASSCOD as ASSCANH_ASSCOD,
hist_novo.ASSSTAH_STACOD as ASSCANH_STACOD,
hist_novo.ASSSTAH_PLACOD as ASSCANH_PLACOD,
hist_novo.ASSSTAH_DATA as ASSCANH_DATA,
hist_novo.ASSSTAH_CANCEL_MOTCOD as ASSCANH_CANCEL_MOTCOD,
hist_antigo.ASSSTAH_STACOD as ASSCANH_STACOD_OLD
from crm_assinaturastatus status_antigo, crm_assinatura_status_hist hist_antigo,
crm_assinatura_status_hist hist_novo, crm_assinaturastatus status_novo
where
hist_novo.ASSSTAH_STACOD=status_novo.asssta_cod
and hist_antigo.ASSSTAH_STACOD=status_antigo.asssta_cod
and status_novo.asssta_valido<>status_antigo.asssta_valido
and hist_antigo.ASSSTAH_DATA=
(
        select max(ASSSTAH_DATA)
        from crm_assinatura_status_hist
	where ASSSTAH_DATA<hist_novo.ASSSTAH_DATA
        and ASSSTAH_assCOD=hist_novo.ASSSTAH_assCOD
)
and hist_antigo.ASSSTAH_DATA<hist_novo.ASSSTAH_DATA
and hist_novo.ASSSTAH_assCOD=hist_antigo.ASSSTAH_assCOD
          AND status_antigo.asssta_grpcod <> (select assstagrp_cod from crm_assinaturastatusgrupo where assstagrp_nome = 'Pré-venda ativo')
/


create view CRM_ASSINATURA_GRUPO_HIST as
select
hist_novo.ASSSTAH_ASSCOD as ASSGRPH_ASSCOD,
hist_novo.ASSSTAH_STACOD as ASSGRPH_STACOD,
status_novo.asssta_grpcod as ASSGRPH_STAGRPCOD,
hist_novo.ASSSTAH_PLACOD as ASSGRPH_PLACOD,
hist_novo.ASSSTAH_DATA as ASSGRPH_DATA,
hist_novo.ASSSTAH_CANCEL_MOTCOD as ASSGRPH_CANCEL_MOTCOD,
hist_antigo.ASSSTAH_STACOD as ASSGRPH_STACOD_OLD,
status_antigo.asssta_grpcod as ASSGRPH_STAGRPCOD_OLD
from
crm_assinatura_status_hist hist_antigo, 
crm_assinatura_status_hist hist_novo,
crm_assinaturastatus status_antigo, 
crm_assinaturastatus status_novo
where
hist_antigo.ASSSTAH_DATA < hist_novo.ASSSTAH_DATA
and hist_novo.ASSSTAH_STACOD = status_novo.asssta_cod
and hist_antigo.ASSSTAH_STACOD=
status_antigo.asssta_cod
--and status_novo.asssta_grpcod=5
and hist_antigo.ASSSTAH_DATA=
(
        select max(ASSSTAH_DATA) from crm_assinatura_status_hist
        where ASSSTAH_DATA<hist_novo.ASSSTAH_DATA
        and ASSSTAH_assCOD=hist_novo.ASSSTAH_assCOD
)
and hist_novo.ASSSTAH_assCOD = hist_antigo.ASSSTAH_assCOD
and status_novo.asssta_grpcod <> status_antigo.asssta_grpcod
/


create view CRM_ASSINATURA_PLANO_HIST as
select
hist_novo.ASSSTAH_ASSCOD as ASSSTAP_ASSCOD,
hist_novo.ASSSTAH_DATA as ASSSTAP_DATA,
hist_novo.ASSSTAH_CANCEL_MOTCOD as ASSSTAP_CANCEL_MOTCOD,
hist_novo.ASSSTAH_PLACOD as ASSSTAP_PLACOD,
hist_novo.ASSSTAH_STACOD as ASSSTAP_STACOD,
hist_antigo.ASSSTAH_PLACOD as ASSSTAP_PLACOD_OLD
from crm_assinatura_status_hist hist_antigo, crm_assinatura_status_hist hist_novo
where hist_antigo.ASSSTAH_PLACOD<>hist_novo.ASSSTAH_PLACOD
and hist_antigo.ASSSTAH_DATA=
(
        select max(ASSSTAH_DATA) from
crm_assinatura_status_hist
        where ASSSTAH_DATA<hist_novo.ASSSTAH_DATA and ASSSTAH_assCOD=hist_novo.ASSSTAH_assCOD
)
and hist_antigo.ASSSTAH_DATA<hist_novo.ASSSTAH_DATA
and hist_novo.ASSSTAH_assCOD=hist_antigo.ASSSTAH_assCOD
and not exists (select asssta_cod from crm_assinaturastatus 
where hist_antigo.ASSSTAH_stacod=asssta_cod and asssta_grpcod = 5)
/


create view CRM_LISTANEGRA as
select distinct cli_hdkOrgCod, cli_cpf cpf
from
        crm_cliente,
        crm_assinatura,
        crm_assinaturapagamento,
        crm_pagamentostatus,
        crm_assinaturastatus,
        crm_clientetipo
 where
        cli_cod = ass_clicod
        --and cli_cod=-1 -- Ambiente de teste
        and ass_cod = pag_asscod
        and pag_foipago = pagsta_cod
        and (pagsta_isfinal=0 or (pagsta_cod= 41))
        and ass_stacod = asssta_cod and ASSSTA_VALIDO = 0
        and clitip_cod=cli_tipcod and clitip_cobrar=1
UNION
select LSTAPP_ORGCOD, lstapp_cpf as cpf
from crm_listanegra_append
where lstapp_tipo=1
and (lstapp_dataval > TO_CHAR(sysdate,'YYYYMMDDHH24MIss') OR lstapp_dataval is null)
MINUS
select LSTAPP_ORGCOD, lstapp_cpf
from crm_listanegra_append
where lstapp_tipo=2
and (lstapp_dataval > TO_CHAR(sysdate,'YYYYMMDDHH24MIss') OR lstapp_dataval is null)
/


create view CRM_VW_ACCOUNTDEFAULTER as
select
        cli_cod         as acd_clicod,
        ass_cod         as acd_asscod,
        ass_forcod      as acd_assforcod,
        ass_datager     as acd_assdatager,
        ass_datastatus  as acd_assdatastatus,
        ass_arecodger   as acd_arecodger,
        pla_cod         as acd_placod,
        tippla_cod      as acd_tipplacod,
        tippla_orgcod   as acd_orgcod,
        (select count(distinct
pag_chave) from crm_assinaturapagamento, crm_pagamentostatus where pag_foipago=pagsta_cod and pagsta_tipcod=2 and pag_asscod=ass_cod) as acd_qtdpagos
from
        crm_cliente,
        crm_assinatura,
        crm_clientetipo,
        crm_tipoplanoassinatura,
        crm_planoassinatura
where
        ass_clicod=cli_cod
        and clitip_cod=cli_tipcod
        and ass_placod=pla_cod
        and clitip_cobrar=1
        and clitip_suspender = 1
        and pla_tipcod=tippla_cod
        and tippla_suspender=1
        and ass_stacod=7 -- Inadimplente
        and ass_asscod_conjunta is null
/



create view CRM_VW_ACCOUNTPROMOTIONDATES as
SELECT 
  cam.cam_cod AS apd_camcod,
  cam.cam_nome AS apd_camnome,
  cam.cam_tipo AS apd_camtipo,
  ass.ass_cod AS apd_asscod,
  tipo_referencia apd_tiporeferencia,
  (CASE WHEN
    (camp_referencia.tipo_referencia = 1 OR camp_referencia.tipo_referencia = 4) THEN
      TO_DATE(ass.ass_datager, 'yyyymmddhh24miss')
     ELSE
       (TO_DATE(data_campanha.min_assstah_data, 'yyyymmddhh24miss'))
  END) apd_dataentrada,
  ADD_MONTHS(CASE WHEN (camp_referencia.tipo_referencia = 1 OR camp_referencia.tipo_referencia = 4) THEN
      TO_DATE(ass.ass_datager, 'yyyymmddhh24miss')
    ELSE
      TO_DATE(data_campanha.min_assstah_data, 'yyyymmddhh24miss')
  END, camp_referencia.MAX) AS apd_datasaida
FROM 
  crm_assinatura ass,
  crm_cliente c,
  crm_campanha cam,
  crm_planoassinatura p,
  (SELECT 
     cam.cam_cod AS cam_cod,
     (SELECT des_tipo_referencia
      FROM 
	    crm_desconto des,
        (SELECT 
		   des_cam_cod AS cam_cod,
           MAX(CASE
		     WHEN des_numero_mensalidade_fim IS NOT NULL THEN
               des_numero_mensalidade_fim
             WHEN des_numero_mensalidade_fim IS NULL AND DES_TIPO_REFERENCIA IN (5, 4) THEN
               1000
             ELSE
               des_numero_mensalidade
      END) AS MAX
    FROM 
	  crm_desconto
    GROUP BY des_cam_cod
	) maxmensalidade
WHERE 
  des.des_cam_cod = maxmensalidade.cam_cod
  AND maxmensalidade.cam_cod = cam.cam_cod
  AND (des_numero_mensalidade = maxmensalidade.MAX 
  OR nvl(des_numero_mensalidade_fim, 1000) = maxmensalidade.MAX)
  AND ROWNUM < 2) AS tipo_referencia,
  (SELECT 
     maxmensalidade.MAX 
   FROM 
     crm_desconto des,
     (SELECT
	    des_cam_cod AS cam_cod,
        MAX(CASE WHEN des_numero_mensalidade_fim IS NOT NULL THEN
		  des_numero_mensalidade_fim
                 WHEN des_numero_mensalidade_fim IS NULL AND DES_TIPO_REFERENCIA IN (5, 4) THEN
          1000
                 ELSE
                   des_numero_mensalidade
            END) AS MAX
       FROM 
	     crm_desconto
       GROUP BY des_cam_cod) maxmensalidade
   WHERE 
     des.des_cam_cod = maxmensalidade.cam_cod
     AND maxmensalidade.cam_cod = cam.cam_cod
     AND (des_numero_mensalidade = maxmensalidade.MAX OR nvl(des_numero_mensalidade_fim, 1000) = maxmensalidade.MAX)
     AND ROWNUM < 2) AS MAX
          FROM crm_campanha cam) camp_referencia,
       (SELECT assstah_asscod, assstah_camcod, MIN(assstah.assstah_data) min_assstah_data
          FROM crm_assinatura_status_hist assstah
         WHERE assstah.assstah_data > nvl((SELECT MAX(assstah2.assstah_data)
FROM crm_assinatura_status_hist assstah2
WHERE assstah2.assstah_asscod = assstah.assstah_asscod
AND (assstah2.assstah_camcod <> assstah.assstah_camcod OR
assstah2.assstah_camcod IS NULL)),'2001')
GROUP BY assstah_asscod, assstah_camcod) data_campanha
 WHERE data_campanha.assstah_asscod = ass.ass_cod
   AND data_campanha.assstah_camcod = ass.ass_cam_cod
   AND ass.ass_cam_cod = cam.cam_cod
   AND ass.ass_clicod = c.cli_cod
   AND ass.ass_placod = p.pla_cod
   AND cam.cam_cod = camp_referencia.cam_cod
   AND camp_referencia.tipo_referencia IS NOT NULL
/

create view CRM_VW_ACCOUNTRESCUE as
SELECT cli_cod       AS acr_clicod,
       ass_cod       AS acr_asscod,
       ass_datager   AS acr_assdatager,
       pla_tipcod    AS accr_tipplacod,
       pla_cod       AS acr_placod,
       tippla_orgcod AS acr_orgcod
  FROM crm_cliente,
       crm_assinaturastatus,
       crm_assinatura,
       crm_planoassinatura,
       crm_tipoplanoassinatura
 WHERE NOT EXISTS
        (SELECT pag_chave
FROM crm_assinaturapagamento, crm_pagamentostatus
         WHERE ass_cod = pag_asscod
AND pag_foipago = pagsta_cod
           AND ((pag_forcod = 4 AND pagsta_isfinal = 0 AND SUBSTR(
pag_vencimento, 1, 8) <= TO_CHAR(SYSDATE, 'YYYYMMDD') AND pag_foipago <> 43)
                OR (pag_forcod = 1 AND pagsta_tipcod IN (5, 6) AND pag_foipago NOT IN (42, 43) AND pag_retcod <> 'EENC')
OR (pag_forcod = 2 AND pagsta_tipcod IN (5, 6) AND pag_foipago NOT IN (42, 43))
OR (pag_forcod = 3 AND pagsta_tipcod IN (5, 6) AND pag_foipago NOT IN (42, 43)))
        )
   AND ass_clicod = cli_cod
   AND ass_placod = pla_cod
   AND pla_tipcod = tippla_cod
   AND ass_asscod_conjunta IS NULL
   AND ass_stacod = asssta_cod
   AND asssta_sistema = 1
/


create view CRM_VW_ACCOUNTSUSPENDED as
select
        cli_cod         as acs_clicod,
        ass_cod         as acs_asscod,
        ass_forcod      as acs_assforcod,
        ass_datager     
as acs_assdatager,
        ass_datastatus  as acs_assdatastatus,
        ass_arecodger   as acs_arecodger,
        ass_stacod       as acs_assstacod,
        pla_cod         as acs_placod,
        tippla_cod      as acs_tipplacod,
        tippla_orgcod   as acs_orgcod,
        ass_cancel_motcod       as acs_cancelmotcod
from
        crm_cliente,
        crm_assinatura,
        crm_assinaturastatus,
        crm_clientetipo,
        crm_tipoplanoassinatura,
        crm_planoassinatura
where
        ass_clicod=cli_cod
        and ass_stacod=asssta_cod
        and clitip_cod=cli_tipcod
        and ass_placod=pla_cod
        and pla_tipcod=tippla_cod
        and asssta_valido=0
        and asssta_grpcod<>5 -- Cancelado e deletado
        and ass_asscod_conjunta IS NULL
/

create view CRM_VW_ALL_LOGINS as
select cli_cod as lgn_cliCod, cli_login as lgn_login
from crm_cliente
UNION
select ass_clicod, wifi_login
from infoquest_crm.Crm_Assinatura,         
infoquest_crm.crm_wifi_loginadicional     
where ass_cod = wifi_asscod         
UNION
select usu_clicod, login
from infoquest_crm.infoquest_usuario
/


create view CRM_VW_BASE_PORDIA as
SELECT DISTINCT assstah_stacod AS basdia_stacod,
                ass_clicod AS basdia_clicod,
ass_cod AS basdia_asscod,
                DECODE(asssta_grpcod, 2, 11, assstah_cancel_motcod) AS basdia_cancel_motcod,
                data AS basdia_dia,
                assstah_placod AS basdia_placod
  FROM crm_assinatura_status_hist,
       crm_assinatura,
       crm_assinaturastatus,
tab_data
 WHERE ass_asscod_conjunta IS NULL
   AND assstah_asscod = ass_cod
   AND assstah_stacod = asssta_cod
   AND assstah_data = (SELECT MAX(ASSSTAH_DATA)
                         FROM crm_assinatura_status_hist
                        WHERE ass_cod = ASSSTAH_ASSCOD
AND assstah_data < data || 'XX'
                        GROUP BY assstah_asscod)
/



create view TAB_ANOMES as
select distinct ano||mes as data_anomes
from tab_ano, tab_mes
/

create view CRM_VW_BASE_PORMES as
SELECT distinct 
        assstah_stacod AS basmes_stacod,
        ass_clicod AS basmes_clicod,
        ass_cod AS basmes_asscod,
        DECODE(asssta_grpcod, 2, 11, assstah_cancel_motcod) AS basmes_cancel_motcod,
        data_anomes AS basmes_anomes,
        assstah_placod AS basmes_placod,
        ass_forcod AS basmes_forcod
FROM
        crm_assinatura_status_hist,
        crm_assinatura,
        crm_assinaturastatus, 
        tab_anomes
WHERE
        ass_asscod_conjunta IS NULL
        AND assstah_asscod = ass_cod
        AND assstah_stacod = asssta_cod
        AND assstah_data >= 
        (
                select 
                        min(ASSSTAH_DATA) 
                from
                        crm_assinatura_status_hist, 
                        crm_assinaturastatus
                where
                        ass_cod = ASSSTAH_ASSCOD
                        and assstah_stacod = asssta_cod
                        and asssta_grpcod <> 5
                group by
                        assstah_asscod
        )
        AND assstah_data = 
        (
        select 
                        max(ASSSTAH_DATA) 
                from
                        crm_assinatura_status_hist
                where
                        ASSSTAH_ASSCOD = ass_cod
                        and assstah_data < data_anomes||'XX'
                group by 
                        assstah_asscod
        )
/


create view CRM_VW_CANCELAMENTOS as
SELECT assgrph_stacod AS cnc_stacod,
                assgrph_asscod AS cnc_asscod,
                DECODE(antigo.asssta_grpcod,
2, 11, assgrph_cancel_motcod) AS cnc_cancel_motcod,
                assgrph_data AS cnc_data,
                assgrph_placod AS
cnc_placod,
                assgrph_stacod_old AS cnc_stacod_antigo
        FROM
                crm_assinatura_grupo_hist,
                crm_assinatura,
                crm_assinaturastatus antigo,
                crm_assinaturastatus novo
        WHERE
                ass_asscod_conjunta IS NULL
                AND assgrph_asscod = ass_cod
                AND assgrph_stacod = novo.asssta_cod
                AND assgrph_stacod_old =antigo.asssta_cod
                AND novo.asssta_grpcod = 5
                AND antigo.asssta_grpcod <> (select assstagrp_cod from crm_assinaturastatusgrupo where assstagrp_nome = 'Pré-venda ativo')
/


create view CRM_VW_INVOICINGINCREASE as
select pag_ano ano,
       pag_mes mes,
       tippla_nom familia,
       pla_nome plano,
cam_nome as campanha,
       asssta_nome as status,
       substr(ass_datager, 1, 6) as mes_venda,
       count(pag_chave) qtd,
       to_char(sum(pag_preco / 100), '999999999999999990D00', 'NLS_NUMERIC_CHARACTERS='',.''') soma,
       to_char(avg(pag_preco / 100), '999999999999999990D00', 'NLS_NUMERIC_CHARACTERS='',.''') media,
       pag_ano || pag_mes as reference_date
  from crm_assinaturapagamento fora,
       crm_planoassinatura,
       crm_campanha,
       crm_assinaturastatus,
       crm_assinatura,
       crm_tipoplanoassinatura
 where not exists (select pag_chave
from crm_assinaturapagamento
         where to_number(pag_mes) = to_number(decode(fora.pag_mes, '01','12',fora.pag_mes - 1))
           and to_number(pag_ano) = to_number(decode(fora.pag_mes, '01', pag_ano - 1, pag_ano))
           and pag_asscod = fora.pag_asscod
           and pag_multa <> 1
        )
   and ass_cod = pag_asscod
   and asssta_cod = ass_stacod
   and pag_camcod = cam_cod(+)
   and pag_multa <> 1
   and pag_placod = pla_cod
   and pla_tipcod = tippla_cod
 group
by pag_ano,
          pag_mes,
          tippla_nom,
          pla_nome,
          cam_nome,
asssta_nome,
          substr(ass_datager, 1, 6)
/



create view CRM_VW_INVOICINGREDUCTION as
select decode(fora.pag_mes, '12', fora.pag_ano, fora.pag_ano + 1) ano,
       decode(fora.pag_mes,'12', '01', fora.pag_mes + 1) mes,
       tippla_nom familia,
       pla_nome plano,
       cam_nome as campanha,
       asssta_nome as status,
       substr(ass_datager, 1, 6) as mes_venda,
count(pag_chave) qtd,
       to_char(sum(pag_preco / 100),
               '999999999999999990D00',
               'NLS_NUMERIC_CHARACTERS='',.''') soma,
       to_char(avg(pag_preco / 100),
'999999999999999990D00',
               'NLS_NUMERIC_CHARACTERS='',.''') media,
pag_ano || pag_mes reference_date
  from crm_assinaturapagamento fora,
       crm_planoassinatura,
       crm_campanha,
       crm_assinaturastatus,
       crm_assinatura,
       crm_tipoplanoassinatura
 where not exists
 (select pag_chave
          from crm_assinaturapagamento
where to_number(pag_mes) =
               to_number(decode(fora.pag_mes, '12', '01', fora.pag_mes
+ 1))
           and to_number(pag_ano) =
               to_number(decode(fora.pag_mes,
'12',
                                fora.pag_ano + 1,
fora.pag_ano))
           and pag_asscod = fora.pag_asscod
     )
   and ass_cod = pag_asscod
   and asssta_cod = ass_stacod
   and pag_camcod = cam_cod(+)
   and pag_placod = pla_cod
   and pla_tipcod = tippla_cod
   and pag_multa <> 1
 group by pag_ano,
pag_mes,
          tippla_nom,
          pla_nome,
          cam_nome,
          asssta_nome,
          substr(ass_datager, 1, 6)
/


create view CRM_VW_LONGOPS as
SELECT   s.SID, s.SERIAL#,
              lo.MESSAGE,
              ROUND (time_remaining / 60, 2) remaining,
              ROUND (elapsed_seconds / 60, 2) Elapsed,
              ROUND (sofar / totalwork * 100, 2) Completo,
              SQL.sql_text,
              s.sql_address,
              s.process
       FROM   v$session_longops lo, gv$sql SQL, v$session s
      WHERE   sofar <> totalwork
AND totalwork <> 0
          AND lo.sql_hash_value = SQL.hash_value
          AND lo.SID = s.SID
   ORDER BY   remaining DESC, 1, 4
/

create view CRM_VW_PAYMENTERROR as
SELECT cli_cod AS pme_clicod,
          NVL (ass_asscod_conjunta, ass_cod) AS pme_asscod,
ass_forcod AS pme_assforcod, ass_datager AS pme_assdatager,
          ass_stacod AS pme_assstacod, 
		  ass_datastatus AS pme_assdatastatus,
          ass_arecodger AS pme_arecodger, pla_cod AS pme_placod,
          tippla_cod AS pme_tipplacod, tippla_orgcod AS pme_orgcod,
          pag_chave AS pme_pagchave,
          SUBSTR (pag_vencimento, 1, 8) || '235959' AS pme_pagvencimento,
          pag_ano AS pme_pagano, pag_mes AS pme_pagmes,
          pag_forcod AS pme_pagforcod, pag_stadata AS pme_pagstadata,
          TRIM (pag_retcod) AS pme_pagretcod,
          pag_remcod_atual AS pme_pagremcodatual,
          pag_cobranca_force AS pme_pagcobrancaforce,
          pagsta_cod as pme_pagstacod
     FROM crm_assinaturapagamento,
          crm_assinatura,
          crm_cliente,
          crm_assinaturastatus,
          crm_clientetipo,
          crm_tipoplanoassinatura,
          crm_planoassinatura,
          crm_pagamentostatus
    WHERE ass_cod = pag_asscod
      AND ass_clicod = cli_cod
AND clitip_cod = cli_tipcod
      AND ass_placod = pla_cod
      AND pla_tipcod = tippla_cod
AND ass_stacod = asssta_cod
      AND pag_foipago = pagsta_cod
      AND asssta_valido = 1
      AND pagsta_tipcod IN (5, 6)                                 -- Erro / Cancelado
      AND pagsta_cod NOT IN (42, 43)                              -- Contestado / Devolvido
      AND pag_retcod <> 'EENC'
-- Erro 51351 não deve ser suspenso
      AND SUBSTR (pag_vencimento, 1, 8) < TO_CHAR (SYSDATE, 'YYYYMMDD')
/



create view CRM_VW_PAYMENTOPEN as
select 
        cli_cod         as pmo_clicod,
        nvl(ass_asscod_conjunta,ass_cod) as pmo_asscod,
        ass_forcod      as pmo_assforcod,
        ass_datager     as pmo_assdatager,
        ass_stacod      as pmo_assstacod,
        ass_datastatus  as pmo_assdatastatus,
        ass_arecodger   as pmo_arecodger,
        pla_cod         as pmo_placod,
        tippla_cod      as pmo_tipplacod,
        tippla_orgcod   as pmo_orgcod,
        pag_chave       as pmo_pagchave,
        substr(pag_vencimento,1,8)||'235959'        as pmo_pagvencimento,   
        pag_ano         as pmo_pagano,
        pag_mes         as pmo_pagmes,
        pag_foipago     as pmo_pagstacod,
        pag_forcod      as pmo_pagforcod,
        pag_stadata     as pmo_pagstadata,
        case when (substr(pag_vencimento,1,8) < to_char(sysdate, 'YYYYMMDD')) then 1 else 0 end as pmo_vencido
from 
        crm_cliente, 
        crm_assinatura,
        crm_assinaturastatus, 
        crm_clientetipo,
        crm_assinaturapagamento,
        crm_pagamentostatus,
        crm_tipoplanoassinatura,
        crm_planoassinatura
where
        ass_cod=pag_asscod
        and ass_clicod=cli_cod 
        and pagsta_cod=pag_foipago
        and ass_placod=pla_cod 
        and ass_stacod=asssta_cod 
        and pla_tipcod=tippla_cod
        and clitip_cod=cli_tipcod
        and asssta_valido=1
        and pagsta_isfinal=0
        and pag_preco > 0
        and pagsta_cod<>2 -- Processando
/

create view CRM_VW_PLAASSFATORCONTEUDO as
select pla.*,
       (case
         when pla_tipcod in (1, 13, 21) then
          (case when pla_valorreferencia <= 19.9 and pla_premen > 0 then
                 pla_valorreferencia/pla_premen
            when pla_valorreferencia > 19.9 then 19.9/pla_premen
            else
                 null
           end)
         else
              null
        end) as pla_fatorconteudo
from (select pla.*,
     (case
       when pla_tipcod in (1, 13, 21) then
            0.6657 * (case pla_temsuporte
                       when 1 then
                            pla.pla_premen - 5.0
                       when 0 then
                            pla.pla_premen
							else
                            null
                      end)
       when pla_tipcod = 110 then
            6.51
       else
            null
      end) as pla_valorreferencia
  from crm_planoassinatura pla) pla
/


create view CRM_VW_RECEIVEDPAYMENTS as
select
        tippla_orgcod as rca_orgcod,
        tippla_cod as rca_tipplacod,
        cta_cod as rca_ctacod,
        pag_ano as rca_reference_year,
        pag_mes as rca_reference_month,
sum(decode(LAN_OPERACAO,'D',lan_valor,-lan_valor)) as rca_value
from 
        crm_assinaturapagamento,
        cnt_conta,
        cnt_lancamento,
        crm_planoassinatura,
        crm_tipoplanoassinatura
where 
        --joins
        lan_ctacod = cta_cod
        and lan_transacao= pag_last_transacao
        and lan_obcchave = pag_chave
        and lan_tipolancamento = 'A'
        and lan_placod = pla_cod
        and pla_tipcod = tippla_cod
        --condicoes
        and lan_obccod = 1
        and cta_grpcod = 4 --contas de recebimento
group by
        tippla_orgcod, tippla_cod, cta_cod, pag_ano, pag_mes
/


create view CRM_VW_RELATEDORGANIZATIONS as
select org_orgcodpai as org_parent, nvl(org_cod, org_orgcodpai) as org_child
from hdk_organizacao
group by cube(org_orgcodpai, org_cod)
having org_orgcodpai is not null
union
select org_cod as org_parent, org_cod as org_child
from hdk_organizacao a
where not exists (
select org_orgcodpai
from hdk_organizacao b
where b.org_orgcodpai = a.org_cod)
order by 1, 2
/


create view CRM_VW_RESGATES as
SELECT assgrph_stacod AS rsg_stacod,
                ass_clicod AS rsg_clicod,
                assgrph_asscod AS rsg_asscod,
                DECODE(antigo.asssta_grpcod, 2, 11, assgrph_cancel_motcod) AS rsg_cancel_motcod,
                assgrph_data AS rsg_data,
                assgrph_placod AS rsg_placod,
                assgrph_stacod_old AS rsg_stacod_antigo
        FROM
                crm_assinatura_grupo_hist,
                crm_assinatura,
                crm_assinaturastatus antigo,
                crm_assinaturastatus novo
        WHERE
                ass_asscod_conjunta IS NULL
                AND assgrph_asscod = ass_cod
                AND assgrph_stacod_old = antigo.asssta_cod
                AND assgrph_stacod = novo.asssta_cod
                AND
                (
                        (
                            assgrph_data > (
                                select min(ASSSTAH_DATA)
                                from
                                                crm_assinatura_status_hist,
                                                crm_assinaturastatus
 where
                                                assgrph_asscod = ASSSTAH_ASSCOD
                                                and assstah_stacod = asssta_cod
                                                and asssta_valido = 1
                                group by
                                                assstah_asscod
                            )
                                and antigo.asssta_grpcod = 5
                        )
                        OR (
                                antigo.asssta_grpcod <> 5
                        )
                )
                AND novo.asssta_valido = 1
                AND antigo.asssta_valido = 0
    -- não resgatar suspensões por Inadimplência por pagamento parcial de fatura
    AND assgrph_cancel_motcod <> 19
/


create view CRM_VW_REVENUE_MONTH as
select
        lan_ref AS rev_reference,
        LAN_OBCCOD as rev_obcCod,
        LAN_OBCCHAVE rev_obcKey,
        lan_estuf as rev_estUf,
        substr(LAN_DATA,1,6) as rev_date,
    SUM(DECODE(LAN_OPERACAO,'C',lan_valor,0)) AS rev_fullValue,
    SUM(DECODE(LAN_OPERACAO,'D',lan_valor,0)) AS rev_discountValue,
        LAN_PLACOD as rev_obcPlaCod
FROM
    cnt_lancamento
WHERE
        LAN_CTACOD IN (59,75) -- Receita prestação de serviços
        AND lan_valor <> 0 -- retirar lancamentos de valor 0, inserido dia 07/11/2004
GROUP BY
        lan_ref,
        lan_estuf,
        substr(LAN_DATA,1,6),
        LAN_OBCCOD,
        LAN_PLACOD,
        LAN_OBCCHAVE
Having
        SUM(DECODE(LAN_OPERACAO,'C',lan_valor,-lan_valor)) <> 0
/


create view CRM_VW_SALDOASSPAGAMENTO as
SELECT
pag_chave as sap_chave,
pag_estuf as sap_estuf,
pag_placod as sap_placod,
pag_ano || pag_mes|| '01' as sap_pagamento,
pag_periodo_ano || pag_periodo_mes || '01' as sap_periodopagamento,
months_between(to_date(pag_periodo_ano || pag_periodo_mes,'YYYYMM'), to_date(pag_ano || pag_mes,'YYYYMM'))
as sap_periodo,
(select count(distinct(substr(lan_data,1,6)))
from cnt_lancamento
where lan_obcchave = pag_chave
and lan_prfcod = 53 and lan_ctacod = 75
) as sap_parcelas,
SUM(DECODE(cnt1.lan_operacao, 'C', cnt1.lan_valor, -cnt1.lan_valor)) as sap_saldo,
max(cnt1.lan_ref) as sap_ref
FROM
crm_assinatura,
crm_assinaturastatus,
crm_assinaturapagamento ap,
cnt_lancamento cnt1
WHERE
cnt1.lan_obccod =1
AND cnt1.lan_ctacod = 75
and ap.pag_chave = cnt1.lan_obcchave
and months_between(to_date(pag_periodo_ano || pag_periodo_mes,'YYYYMM'), to_date(pag_ano || pag_mes,'YYYYMM')) > 1
and pag_asscod = ass_cod
and ass_stacod = asssta_cod
and asssta_valido = 1
GROUP BY
pag_chave,
pag_estuf,
pag_placod,
pag_ano,
pag_mes,
pag_periodo_ano, pag_periodo_mes,
months_between(to_date(pag_periodo_ano || pag_periodo_mes,'YYYYMM'), to_date(pag_ano || pag_mes,'YYYYMM'))
HAVING SUM(DECODE(cnt1.lan_operacao, 'C', cnt1.lan_valor, -cnt1.lan_valor)) > 0
/


create view CRM_VW_SUSPENSOES as
SELECT ASSCANH_stacod AS spn_stacod, 
                ass_clicod AS spn_clicod, 
                ASSCANH_asscod AS spn_asscod,
                DECODE(novo.asssta_grpcod, 2, 11, ASSCANH_cancel_motcod) AS spn_cancel_motcod, 
                ASSCANH_data AS spn_data, 
                ASSCANH_placod AS spn_placod, 
                ASSCANH_stacod_old AS spn_stacod_antigo 
        FROM
                CRM_ASSINATURA_CANCEL_HIST, 
                crm_assinatura, 
                crm_assinaturastatus novo 
        WHERE 
                ass_asscod_conjunta IS NULL 
                AND ASSCANH_asscod = ass_cod 
                AND ASSCANH_stacod = novo.asssta_cod 
       AND novo.asssta_grpcod IN (3, 4)
/



create view CRM_VW_VENDA as
SELECT DISTINCT assstah_data AS vnd_data, assstah_placod AS vnd_placod,
                   asssta_cod AS vnd_stacod, ass_cod AS vnd_asscod,
                   ass_clicod AS vnd_clicod, ass_usucodger AS vnd_usucodger,
                   ass_arecodger AS vnd_arecodger,
                   assstah_camcod AS vnd_asscamcod,
                   ass_midcod AS vnd_assmidcod,
                   DECODE
(ass_asscodpagamento,
                       NULL, ass_forcod,
(SELECT ass_forcod
                          FROM crm_assinatura assfpag
WHERE vendida.ass_asscodpagamento = assfpag.ass_cod
                           AND vendida.ass_clicod = assfpag.ass_clicod)
                      ) AS vnd_forcod,
                   ass_datager
FROM crm_assinatura vendida,
                   crm_assinaturastatus,
                   crm_assinatura_status_hist
             WHERE ass_asscod_conjunta IS NULL
               AND assstah_asscod = ass_cod
               AND assstah_stacod = asssta_cod
               AND assstah_data =
(SELECT   MIN (assstah_data)
                           FROM crm_assinatura_status_hist,
                                crm_assinaturastatus
                          WHERE ass_cod= assstah_asscod
                            AND assstah_stacod = asssta_cod
AND asssta_valido = 1
                            AND asssta_grpcod <>
(SELECT assstagrp_cod
                                      FROM crm_assinaturastatusgrupo
                                     WHERE assstagrp_nome = 'Pré-venda ativo')
GROUP BY assstah_asscod)
/



create view CRM_VW_VENDA_CONJUNTA as
select 
    distinct 
    assstah_data as vnd_data, 
    assstah_placod as vnd_placod, 
    asssta_cod as vnd_stacod, 
    ass_cod as vnd_asscod, 
    ass_clicod as vnd_clicod, 
    ass_arecodger as vnd_arecodger, 
    ass_usucodger as vnd_usucodger, 
    ass_cam_cod as vnd_asscamcod, 
ass_midcod as vnd_assmidcod, 
        decode(ass_cod,(select min(ass_cod) from crm_assinatura interna 
		where vendida.ass_asscod_conjunta=interna.ass_asscod_conjunta), 1,0) as vnd_primeira, 
        decode(ASS_ASSCODPAGAMENTO,null,ass_forcod,(select ass_forcod from crm_assinatura assfpag 
		where vendida.ASS_ASSCODPAGAMENTO=assfpag.ass_cod and vendida.ass_clicod=assfpag.ass_clicod)) as vnd_forcod, 
        ass_asscod_conjunta as vnd_asscod_conjunta 
from 
    crm_assinatura vendida, 
    crm_assinaturastatus, 
crm_assinatura_status_hist 
where 
    ass_asscod_conjunta > 0 
    and assstah_asscod = ass_cod 
    and assstah_stacod = asssta_cod 
    and asssta_grpcod <> 5 
    and assstah_data= 
    (
        select min(ASSSTAH_DATA) 
        from crm_assinatura_status_hist 
        where ass_cod=ASSSTAH_ASSCOD 
        group by assstah_asscod 
    )
/



create view RADCHECK as
select distinct
cli_cod as ID,
decode(cli_login,null,''||cli_cod,cli_login) as USERNAME,
'Password' as ATTRIBUTE,
nvl(cli_senha_rad,cli_senha) as VALUE,
cli_senha as VALUE2,
       NVL(

(
                        select spv_value
                        from
crm_serviceparametervalue,
                            crm_serviceparameter_service,
                            crm_serviceparameter
                        where
spv_spscod = sps_cod
and sps_spmcod = spm_cod
and spm_name = 'SPECIAL_FTP_SIZE'
and spv_spacod =spa_cod ), scv_value) * 1024 as espacoemdisco,
nvl(pla_opecod,0) as operadora,
decode(vel_connect_info, null,
decode(pla_opecod,3,
decode(pla_cod,
22, '8', --BrTurbo Telefonica 350 Kbps Flex
23, '9', --BrTurbo Telefonica 2 Mbps
24, '24', --BrTurbo Telefonica IP Fixo 150 Kbps
26, '25', --BrTurbo Telefonica IP Fixo 350 Kbps 25
27, '26', --BrTurbo Telefonica IP Fixo 600 Kbps 26
28, '27', --BrTurbo Telefonica IP Fixo 1 Mbps 27
29, '28',--BrTurbo Telefonica IP Fixo 350 Kbps Flex 28
39, '29', --BrTurbo Telefonica IP Fixo 2 Mbps 29
43, '55', --BrTurbo Telefonica Condomínio IP Fixo 350 Kbps 55
44, '56', --BrTurbo Telefonica Condomínio IP Fixo 600 Kbps 56
45, '57', --BrTurbo Telefonica Condomínio IP Fixo 1 Mbps 57
46, '54', --BrTurbo Telefonica Condomínio IP Fixo 150 Kbps 54
76, '4', --BrTurbo Telefonica 128 Kbps
77, '5', --BrTurbo Telefonica 300 Kbps
78, '6', --BrTurbo Telefonica 450 Kbps
79, '6', --BrTurbo Telefonica 600 Kbps
80, '35', --BrTurbo Telefonica Business 300 Kbps
81, '36', --BrTurbo Telefonica Business 450 Kbps
82, '37', --BrTurbo Telefonica Business 600 Kbps
83, '38', --BrTurbo Telefonica Business 1Mbps
84, '39', --BrTurbo Telefonica Business 2 Mbps
85, '44', --BrTurbo Telefonica Condomínio 128Kbps
86, '45', --BrTurbo Telefonica Condomínio 300 Kbps
87, '46', --BrTurbo Telefonica Condomínio 450 Kbps
88, '47', --BrTurbo Telefonica Condomínio 600 Kbps
89, '2', --BrTurbo Telefonica Class
90, '3', --BrTurbo Telefonica Premium
93, '1', --BrTurbo Telefonica 256 Kbps - 18,90
94, '2', --BrTurbo Telefonica 512 Kbps
95, '31', --BrTurbo Telefonica Business 256 Kbps
96, '21', --BrTurbo Telefonica 256 IP fixo
97, '22', --BrTurbo Telefonica Ip Fixo 512
98, '33', --BrTurbo Telefonica Ip Fixo link 2Mb
99, '32', --BrTurbo Telefonica Business 512 Kbps
106, '1', --Plano BrTurbo conteúdo Telefônica
107, '1', --Plano BrTurbo acesso Telefônica 35,00
108, '1', --Plano BrTurbo acesso Telefônica 49,90
109, '1', --Plano BrTurbo acesso Telefônica 59,90
252, '8', --BrTurbo Telefonica 350 Kbps Flex (sem suporte)
253, '9', --BrTurbo Telefonica 2 Mbps (sem suporte)
254, '24', --BrTurbo Telefonica IP Fixo 150 Kbps 24
255, '25', --BrTurbo Telefonica IP Fixo 350 Kbps 25
256, '26', --BrTurbo Telefonica IP Fixo 600 Kbps (sem suporte)
257, '27', --BrTurbo Telefonica IP Fixo 1 Mbps 27
258, '28', --BrTurbo Telefonica IP Fixo 350 Kbps Flex 28
259, '29', --BrTurbo Telefonica IP Fixo 2 Mbps 29
260, '4', --BrTurbo Telefonica 150 Kbps (sem suporte)
261, '5', --BrTurbo Telefonica 350 Kbps(sem suporte)
262, '6', --BrTurbo Telefonica 450 Kbps
263, '6', --BrTurbo Telefonica 600 Kbps (sem suporte)
264, '1', --BrTurbo Telefonica 256 Kbps
272, '4', --BrTurbo Telefonica 150 Kbps
274, '5', --BrTurbo Telefonica 350 Kbps
276, '8', --BrTurbo Telefonica 350 Kbps Flex 8
278, '6', --BrTurbo Telefonica 600 Kbps
280, '9', --BrTurbo Telefonica 2 Mbps 9
281, '44', --BrTurbo Telefonica Condomínio 150 Kbps (sem suporte)
282, '44', --BrTurbo Telefonica Condomínio 150 Kbps
283, '45', --BrTurbo Telefonica Condomínio 350 Kbps (sem suporte)
284, '45', --BrTurbo Telefonica Condomínio 350 Kbps
285, '46', --BrTurbo Telefonica Condomínio 600 Kbps (sem suporte)
286, '46', --BrTurbo Telefonica Condomínio 600 Kbps
287, '38', --BrTurbo Telefonica Business 1 Mbps
288, '39', --BrTurbo Telefonica Business 2 Mbps
310, '1', --Plano BrTurbo acesso Telefônica 18,90
433, '35', --Plano BrTurbo Telefonica Business 350 Kbps
434, '36', --Plano BrTurbo Telefonica Business 550 Kbps
435, '37', --Plano BrTurbo Telefonica Business 800 Kbps
436, '38', --Plano BrTurbo Telefonica Business 1200 Kbps
437, '39', --Plano BrTurbo Telefonica Business 2000 Kbps
'1' -- Restante
)
,null)
, vel_connect_info) as Connect_Info
from
  crm_cliente, 
  (
    select
       ass_clicod, vel_connect_info, scv_value, spa_cod, pla_cod, pla_opecod
       from 
    crm_assinatura, 
    crm_planoassinatura, 
       crm_serviceproduct_account,
       crm_service_product,
       crm_serviceconfigvalue,
    crm_assinaturastatus, crm_acesso_velocidade
       where 
       ass_stacod=asssta_cod
and asssta_valido=1
    and       spa_spdcod = spd_cod
    and scv_spdcod = spd_cod
    and spa_asscod = ass_cod
    and ass_placod = pla_cod
    and ass_velcod = vel_cod (+)
    and scv_scfcod = 27 -- Espaco de FTP
    and spd_SRVCOD = 25 -- Personal FTP Service
    ) aux
where ass_clicod = cli_cod
/



create or replace view VW_PERMISSAO_AREA_CANAL as
( 
        SELECT usu_cod AS USUPER_USUCOD, 
                areper_percod AS IDPERMISSAO, 
                NULL AS DATAHORAFIM, 
                NULL AS DATAHORAINICIO 
        FROM 
                crm_area, 
                crm_area_permissao, 
                permissao, 
    crm_area_usuario, 
                usuario 
        WHERE 
                areper_arecod = usu_arecodatual 
                and are_cod = areper_arecod 
and AREUSU_ARECOD=areper_arecod 
    and AREUSU_USUCOD=usu_cod 
                and areper_percod = IDPERMISSAO 
                and 
                ( 
                                are_grpcod in (11,12,27) -- Canal de Venda, Canal de Venda - Ger:1ncia 
        or chave in ('PERM_01' , 'PERM_32' , 'PERM_GAMES_ADMIN') 
                                or ARE_ORGCOD = 11 -- Liberar temporariamente para o Ibest 
                ) 
        UNION 
        SELECT usu_cod AS USUPER_USUCOD, 
                AREGRPPER_PERCOD AS IDPERMISSAO, 
                NULL AS DATAHORAFIM, 
                NULL AS DATAHORAINICIO 
        FROM 
                crm_area, 
        crm_areagrupo_permissao, 
        crm_area_usuario, 
        crm_areagrupo, 
        usuario 
        WHERE
                are_cod = usu_arecodatual 
        and are_grpcod = aregrp_cod 
        and AREUSU_ARECOD=are_cod 
        and AREUSU_USUCOD=usu_cod 
        and aregrpper_aregrpcod = aregrp_cod 
                    and 
                    ( 
          are_grpcod in (11,12,27) -- Canal de Venda, Canal de Venda - Ger:2ncia 
or ARE_ORGCOD = 11 -- Liberar temporariamente para o Ibest 
        ) 
)
/


create view USUARIO_BELADASEMANA as
select distinct cli_cod as ID, cli_login as USERNAME, 'Password' as ATTRIBUTE ,
cli_senha as VALUE,
decode(pla_tipcod, 1, 1, 6, 1, 21, 1, 0) as CLIENTEBRTURBO
from crm_cliente, crm_assinatura, crm_assinaturastatus, crm_planoassinatura
where cli_cod=ass_clicod
and ass_stacod=asssta_cod
and ass_placod= pla_cod
and asssta_valido=1
and pla_tipcod in (1,12,13,6,21)
AND cli_login > '0'
AND cli_senha IS NOT NULL
/


create view USUARIO_OPERADORA as
select timest, STRIPPEDUSERNAME as login, decode (substr(nas_ip_address,0,7),
                        '200.163', 2, --'Brasil Telecom'
                        '200.164', 1, --'Telemar',
                        '200.165', 1, --'Telemar',
                        '200.171', 3, --'Telefonica',
                        '200.181', 2, --'Brasil Telecom'
                        '200.193', 2, --'Brasil Telecom'
                        '200.199', 2, --'Brasil Telecom'
                        '200.204', 3, --'Telefonica',
                        '200.206', 3, --'Telefonica',
                        '200.207', 3, --'Telefonica',
                        '200.217', 1, --'Telemar',
                        '200.216', 1, --'Telemar',
                        null) as operadora
                from infoquest_crm.radacctlog --where status = 'Start'
/


create view VW_CRM_ADSLFILIALPREFIXO as
select distinct PORSTA_FILIAL as FILPRE_FILIAL, LOC_DDD as FILPRE_DDD, PORESTPRE_PREFIXO as 
FILPRE_PREFIXO
from
CRM_ADSLPORTASTATUSESTACAO
UNION ALL
select distinct 'RS', DDDOPE_DDD, DDDOPE_PREFIXO
from crm_ddd_operadora
where
DDDOPE_OPERADORA='CTMR'
/



create view VW_PERMISSAO_AREA_ATIVA as
(
        SELECT usu_cod AS USUPER_USUCOD,
                areper_percod AS IDPERMISSAO,
                NULL AS DATAHORAFIM,
                NULL AS DATAHORAINICIO
        FROM
                crm_area_permissao,
        crm_area_usuario,
                usuario
        WHERE
                areper_arecod = usu_arecodatual
        and AREUSU_ARECOD=areper_arecod
        and AREUSU_USUCOD=usu_cod
        UNION
        SELECT usu_cod AS USUPER_USUCOD,
                AREGRPPER_PERCOD AS IDPERMISSAO,
                NULL AS DATAHORAFIM,
                NULL AS DATAHORAINICIO
        FROM
                crm_area, 
        crm_areagrupo_permissao,
crm_area_usuario,
        crm_areagrupo,
        usuario
        WHERE
                are_cod = usu_arecodatual
and are_grpcod = aregrp_cod
        and AREUSU_ARECOD=are_cod
        and AREUSU_USUCOD=usu_cod
        and aregrpper_aregrpcod = aregrp_cod
)
/

DECLARE jobno number; 
BEGIN 
  DBMS_JOB.SUBMIT(
    job=> jobno, 
    what=> 'BEGIN dbms_stats.gather_schema_stats(ownname=> ''INFOQUEST_CRM'' ,estimate_percent=> 10 , cascade=> TRUE ); END;', 
	next_date => SYSDATE, 
	interval => '/*7:Days*/ sysdate +7'); 
  COMMIT;
  DBMS_OUTPUT.put_line('Job: ' || jobno);
END;
/


--


-- primary

CREATE SNAPSHOT LOG ON infoquest_crm.CRM_REMESSAPAG_HIST 
    TABLESPACE TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_ASSINATURACOMISS to snapshot_replicador;
grant select on infoquest_crm.CRM_ASSINATURAPAGAME_STAHIST to snapshot_replicador;

-- slave

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_REMESSAPAG" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND
AS
select * from infoquest_crm.CRM_REMESSAPAG@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_REMESSAPAG"',
     lax => TRUE);
END;
/

COMMIT
/

create public synonym  CRM_REMESSAPAG for INFOQUEST_CRM.CRM_REMESSAPAG_HIST;

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_REMESSAPAG_HIST" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST 
ON DEMAND
AS
select * from infoquest_crm.CRM_REMESSAPAG_HIST@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_REMESSAPAG_HIST"',
     lax => TRUE);
END;
/

COMMIT
/


-- primary

CREATE SNAPSHOT LOG ON infoquest_crm.CRM_ASSINATURAPAGAME_STAHIST with rowid
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_ASSINATURAPAGAME1 to snapshot_replicador;
grant select on infoquest_crm.CRM_ASSINATURAPAGAME_STAHIST to snapshot_replicador;

-- slave

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_ASSINATURAPAGAME_STAHIST" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST with rowid
ON DEMAND
AS
select * from infoquest_crm.CRM_ASSINATURAPAGAME_STAHIST@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_ASSINATURAPAGAME_STAHIST"',
     lax => TRUE);
END;
/

COMMIT
/

create or replace public synonym  CRM_ASSINATURAPAGAME_STAHIST for INFOQUEST_CRM.CRM_ASSINATURAPAGAME_STAHIST;

create or replace public synonym  CRM_REMESSAPAG for INFOQUEST_CRM.CRM_REMESSAPAG;

CREATE  INDEX INFOQUEST_CRM.ASSPG_STAHIST_PAGCHAVE ON INFOQUEST_CRM.CRM_ASSINATURAPAGAME_STAHIST(PAGSTAH_PAGCHAVE) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;
CREATE  INDEX INFOQUEST_CRM.CRM_ASSINATURAPAGAME_HIPAGNEW ON INFOQUEST_CRM.CRM_ASSINATURAPAGAME_STAHIST(PAGSTAH_PAGCHAVE,PAGSTAH_STACODNEW) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;
CREATE  INDEX INFOQUEST_CRM.CRM_ASSINATURAPAG_STAHIST_I1 ON INFOQUEST_CRM.CRM_ASSINATURAPAGAME_STAHIST(PAGSTAH_PAGCHAVE,PAGSTAH_DATAHORA) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;
CREATE  INDEX INFOQUEST_CRM.IDX_PAGSTAH_DATAHORA ON INFOQUEST_CRM.CRM_ASSINATURAPAGAME_STAHIST(PAGSTAH_DATAHORA) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;
CREATE  INDEX INFOQUEST_CRM.PAGSTAH_PAGCHAVE_STACODOLD ON INFOQUEST_CRM.CRM_ASSINATURAPAGAME_STAHIST(PAGSTAH_PAGCHAVE,PAGSTAH_STACODOLD) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;

alter index INFOQUEST_CRM.ASSPG_STAHIST_PAGCHAVE noparallel;
alter index INFOQUEST_CRM.CRM_ASSINATURAPAGAME_HIPAGNEW noparallel;
alter index INFOQUEST_CRM.CRM_ASSINATURAPAG_STAHIST_I1 noparallel;
alter index INFOQUEST_CRM.IDX_PAGSTAH_DATAHORA noparallel;
alter index INFOQUEST_CRM.PAGSTAH_PAGCHAVE_STACODOLD noparallel;



-- primary

CREATE SNAPSHOT LOG ON infoquest_crm.CRM_DDD_OPERADORA with rowid
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_DDD_OPERADORA to snapshot_replicador;
grant select on infoquest_crm.CRM_DDD_OPERADORA to snapshot_replicador;

-- slave

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_DDD_OPERADORA" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST with rowid ON DEMAND
AS
select * from infoquest_crm.CRM_DDD_OPERADORA@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_DDD_OPERADORA"',
     lax => TRUE);
END;
/

COMMIT
/

create or replace public synonym  CRM_DDD_OPERADORA for INFOQUEST_CRM.CRM_DDD_OPERADORA;


CREATE  INDEX INFOQUEST_CRM.IDX_CRM_DDD_OPERADORA ON INFOQUEST_CRM.CRM_DDD_OPERADORA(DDDOPE_PREFIXO,DDDOPE_DDD) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;
CREATE UNIQUE INDEX INFOQUEST_CRM.IDX_CRM_DDD_OPERADORA_UN ON INFOQUEST_CRM.CRM_DDD_OPERADORA(DDDOPE_PREFIXO,DDDOPE_DDD,DDDOPE_MCDU_INICIO,DDDOPE_MCDU_FINAL) ONLINE PARALLEL(DEGREE 4) TABLESPACE INDX_INFOQUEST_CRM_01;

alter index INFOQUEST_CRM.IDX_CRM_DDD_OPERADORA noparallel;
alter index INFOQUEST_CRM.IDX_CRM_DDD_OPERADORA_UN noparallel;

--


CREATE SNAPSHOT LOG ON infoquest_crm.CRM_RELATORIOCACHE tablespace TS_MATERIALIZEDVIEW_LOG
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_RELATORIOCACHE to snapshot_replicador;
grant select on infoquest_crm.CRM_RELATORIOCACHE to snapshot_replicador;


CREATE SNAPSHOT LOG ON infoquest_crm.CRM_WIFI_LOGINADICIONAL_HIST with rowid
/

grant select, update, delete on infoquest_crm.MLOG$_CRM_WIFI_LOGINADICIO1 to snapshot_replicador;
grant select on infoquest_crm.CRM_WIFI_LOGINADICIONAL_HIST to snapshot_replicador;

--

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_RELATORIOCACHE" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST ON DEMAND
AS
select * from infoquest_crm.CRM_RELATORIOCACHE@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_RELATORIOCACHE"',
     lax => TRUE);
END;
/

COMMIT
/

create or replace public synonym  CRM_RELATORIOCACHE for INFOQUEST_CRM.CRM_RELATORIOCACHE;

CREATE MATERIALIZED VIEW "INFOQUEST_CRM"."CRM_WIFI_LOGINADICIONAL_HIST" 
TABLESPACE "DATA_INFOQUEST_CRM_01" 
BUILD IMMEDIATE  
USING INDEX TABLESPACE "INDX_INFOQUEST_CRM_01" 
REFRESH FAST with rowid ON DEMAND
AS
select * from infoquest_crm.CRM_WIFI_LOGINADICIONAL_HIST@db_trbprd1
/

BEGIN
   DBMS_REFRESH.ADD(
	 name => '"INFOQUEST_CRM"."RFGRP_INFOQUEST_CRM"',
     list => '"INFOQUEST_CRM"."CRM_WIFI_LOGINADICIONAL_HIST"',
     lax => TRUE);
END;
/

COMMIT
/

create or replace public synonym  CRM_WIFI_LOGINADICIONAL_HIST for INFOQUEST_CRM.CRM_WIFI_LOGINADICIONAL_HIST;


/*
CRM_RELATORIOCACHE
CRM_WIFI_LOGINADICIONAL_HIST
*/