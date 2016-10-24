SET SERVEROUTPUT ON SIZE 1000000
set lines 2000
set pages 2000
set trimspoo on
set feedback on
spool /tmp/create_index.sql

DECLARE
  STR_COMMAND1    VARCHAR2(4000);
  STR_UNIQUE      VARCHAR2(255);
  STR_COLUMNS     VARCHAR2(4000);
  STR_INDEX_NAME  VARCHAR2(4000);
  
  CURSOR C_INDEXES IS
    SELECT DI.OWNER AS INDEX_OWNER, DI.INDEX_NAME, DI.TABLE_OWNER, DI.TABLE_NAME, DI.UNIQUENESS
    FROM DBA_INDEXES DI, DBA_SNAPSHOT_LOGS DSL WHERE DSL.LOG_OWNER = DI.TABLE_OWNER AND DI.TABLE_NAME = DSL.MASTER 
	AND DI.INDEX_NAME NOT IN (SELECT CONSTRAINT_NAME FROM DBA_CONSTRAINTS DC WHERE DC.OWNER = DI.TABLE_OWNER AND DC.TABLE_NAME = DI.TABLE_NAME)
	AND DI.INDEX_TYPE <> 'LOB';
  
  R_INDEXES C_INDEXES%ROWTYPE;

BEGIN
 
  OPEN C_INDEXES;
  FETCH C_INDEXES INTO R_INDEXES;
  
  WHILE C_INDEXES%FOUND LOOP
  
     IF (R_INDEXES.UNIQUENESS <> 'UNIQUE') THEN
       STR_UNIQUE := '';
     ELSE
       STR_UNIQUE := 'UNIQUE';
     END IF;
  
     IF (R_INDEXES.INDEX_NAME LIKE 'SYS_%') THEN
        STR_INDEX_NAME := '';
     ELSE
        STR_INDEX_NAME := R_INDEXES.INDEX_OWNER||'.'||R_INDEXES.INDEX_NAME;
     END IF;

     STR_COMMAND1 := 'CREATE '||STR_UNIQUE||' INDEX '||STR_INDEX_NAME||' ON '||R_INDEXES.TABLE_OWNER||'.'||R_INDEXES.TABLE_NAME||'(';
     BEGIN
       DECLARE
         CURSOR C_COLUMNS IS
        select
		  dic.index_owner,
		  dic.index_name,
		  dic.column_name
        from
          dba_ind_columns dic
        where
          dic.index_owner = R_INDEXES.INDEX_OWNER
          and dic.index_name = R_INDEXES.INDEX_NAME
        order by 
          column_position;
          
        R_COLUMNS C_COLUMNS%ROWTYPE;
         
       BEGIN
       
         STR_COLUMNS := '';
         OPEN C_COLUMNS;
         FETCH C_COLUMNS INTO R_COLUMNS;
         
         WHILE C_COLUMNS%FOUND LOOP
           STR_COLUMNS := STR_COLUMNS||','||R_COLUMNS.COLUMN_NAME; 
           FETCH C_COLUMNS INTO R_COLUMNS;
         END LOOP;
       END;
     END;
    FETCH C_INDEXES INTO R_INDEXES;
    
    STR_COMMAND1 := STR_COMMAND1||STR_COLUMNS||') online parallel(degree 4);';
    STR_COMMAND1 := REPLACE(STR_COMMAND1, '(,', '(');
    
    DBMS_OUTPUT.PUT_LINE(STR_COMMAND1);
    
    STR_COMMAND1 := 'ALTER INDEX '||STR_INDEX_NAME||' NOPARALLEL;';
    
    DBMS_OUTPUT.PUT_LINE(STR_COMMAND1);
        
    STR_COMMAND1 := '';
    STR_COLUMNS  := '';
  END LOOP;
  
  CLOSE C_INDEXES;
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('ERRO: '||SQLERRM);    
END;
/



