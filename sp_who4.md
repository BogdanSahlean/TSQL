# sp_who4

Analysis blocking of active SQL Server sessions could be hard if current SQL Server instance has a high number of active connections. Thus, this analysis could be complicated because busy instances could have more than 1 blocking sessions set, meaning that we could have more than just 1 blocking and for every group of blocked connections we could have more than 2 session.    

This proc will simplify the analysis of blocked connections because will create groups of blocked connections and will extract the missing indices. This is main reason why this proc (sp_Who4) could be used to simplify the analysis of blocked processes and then take fast decision for QO (the missing indices).

Similar functionalities with sp_WhoIsActive.
   
Internals https://www.sqlservercentral.com/articles/sp_who4

# Parameters
   
`@extractindexes INT = NULL --NULL=No`
- [x] `@extractindexes=1` Extract Execution Plans 
- [x] `@extractindexes=2` Extract Xml Missing Indexes
- [x] `@extractindexes=8` Extract Sql Statements for Indexes

# Behaviour

Stored procedure have following 2 main important goals: 
1. Blocked connections should be displayed using a hierarchical way: this means parent first and children’s and children of children’s, etc . In this case, is simply to identify the cause of blocking because the root connection will be the first connection displayed.   
2. Extraction of missing indices from execution plans having as primary goal the simplification of QO of queries implied in blocking. Thus, we could get some  for QO of blocked queries just because sp_who2 will extract these missing indices quicker instead of using SSMS (SQL Server Management Studio) for analysis of execution plans.

This proc returns just 19 columns containing details about current blocked connections and various info that help the analysis: 
- [x] group_num: This column will contain identifiers for groups of SQL Server blocked connections
- [x] blocking_session: current spid  or session_id  plus parent spid for blocking scenarios
- [x] connection_db: database for current connection        
- [x] obct: Name of current procedure
- [x] sql_statement: Active sql statement   
- [x] current_status: sys.sysprocesses.status                        
- [x] transaction_count (for current connection)
- [x] wait_type: Last wait type
- [x] wait_obct: Blocked objects (ex: indices)            
- [x] wait_duration 
- [x] cpu
- [x] reads: buffer logical reads
- [x] writes
- [x] missingindexes
- [x] query_plan: The execution plan of current object
- [x] program_name
- [x] hst_name: Name of the host currently connected to SQL Server
- [x] name: Name of login
- [x] hid: Binary representation of blocking_session. A hierachyid column used to store blocked spids in a hierarchical manner thus: root blocking session\level 1 blocked session\level 2 blocked session\etc. 

# Execution  

`sp_who4`
`EXEC sp_who4`
`EXECUTE sp_who4`
![image](https://user-images.githubusercontent.com/62909052/137633611-13909bd5-686f-4cd7-a890-e9a6842775cf.png)
