Como configurar um mirror de SQLServer

1 - No banco Principal

backup database monitoracao_arnaldo to disk='t:\monitoracao_arnaldo.bak'
go
backup log monitoracao_arnaldo to disk='t:\monitoracao_arnaldo.trn'
go

-- drop endpoint MonitoracaoArnaldo_Mirroring
go
CREATE ENDPOINT MonitoracaoArnaldo_Mirroring
    STATE=STARTED 
    AS TCP (LISTENER_PORT=5022) 
    FOR DATABASE_MIRRORING (ROLE=PARTNER)
GO

2 - No banco Secundário

RESTORE FILELISTONLY
from disk='\\sql-front-bli-1\t\monitoracao_arnaldo.bak'

restore database monitoracao_arnaldo
from disk='\\sql-front-bli-1\t\monitoracao_arnaldo.bak'
WITH norecovery, NOUNLOAD,
MOVE 'Monitoracao_Arnaldo' TO 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\monitoracao_arnaldo.mdf',
MOVE 'Monitoracao_Arnaldo_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\monitoracao_arnaldo.ldf',
replace

/*
go
RESTORE LOG monitoracao_arnaldo FROM DISK ='\\sql-front-bli-1\t\monitoracao_arnaldo.trn' 
WITH NORECOVERY, NOUNLOAD
*/


-- drop endpoint MonitoracaoArnaldo_Mirroring
go
CREATE ENDPOINT MonitoracaoArnaldo_Mirroring
    STATE=STARTED 
    AS TCP (LISTENER_PORT=5022) 
    FOR DATABASE_MIRRORING (ROLE=PARTNER)
GO

ALTER DATABASE monitoracao_arnaldo SET PARTNER ='tcp://sql-front-blindado-1:5022'

3 - No banco Principal

ALTER DATABASE monitoracao_arnaldo SET PARTNER ='tcp://sql-front-blindado-2:5022'

/* Msg 1412, Level 16, State 0, Line 2
The remote copy of database "monitoracao_arnaldo" has not been rolled forward to a point in time that is encompassed in the local copy of the database log.

No principal

BACKUP LOG monitoracao_arnaldo TO DISK = N't:\monitoracao_arnaldo_transaction_log_backup.trn' WITH NOFORMAT, NOINIT, NAME = N'Monitoracao_arnaldo -Transaction Log Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10
GO

No Secundário

RESTORE LOG monitoracao_arnaldo FROM DISK = N'\\sql-front-bli-1\t\monitoracao_arnaldo_transaction_log_backup.trn' WITH FILE = 1,  NORECOVERY, NOUNLOAD, STATS = 10
GO

*/

4 - Verificando se está tudo ok (em qualquer um dos lados)

select * from sys.database_mirroring
select * from sys.database_mirroring_endpoints

5 - Como fazer o chaveamento

/* Doing a forced failover 
--Run on mirror if principal isn't available

USE MASTER
GO
ALTER DATABASE YourDatabase SET PARTNER FORCE_SERVICE_ALLOW_DATA_LOSS
GO

Normal failover

alter database monitoracao_arnaldo set partner failover
*/

6 - Como apagar uma configuração de mirror

ALTER DATABASE monitoracao_arnaldo SET PARTNER OFF
go
drop endpoint MonitoracaoArnaldo_Mirroring
go

