# sp_who4

Analysis blocking of active SQL Server sessions could be hard if current SQL Server instance has a high number of active connections. Thus, this analysis could be complicated because busy instances could have more than 1 blocking connections set, meaning that we could have more than just 1 blocking and for every group of blocked connections we could have more than 2 connections. 

This proc will simplify the analysis of blocked connections because will create groups of blocked connections and will extract the missing indices. This is main reason why this proc (sp_Who4) could be used to simplify the analysis of blocked processes and then take fast decision for QO (the missing indices).

Similar functionalities with sp_WhoIsActive.
   
Internals https://www.sqlservercentral.com/articles/sp_who4

# Parameters

`@extractindexes INT = NULL --NULL=No`
1. Extract Execution Plans 
2. Extract Xml Missing Indexes
8. Extract Sql Statements for Indexes

# Behaviour

Stored procedure have following 2 main important goals: 
1. Blocked connections should be displayed using a hierarchical way: this means parent first and children’s and children of children’s, etc . In this case, is simply to identify the cause of blocking because the root connection will be the first connection displayed.
2. Extraction of missing indices from execution plans having as primary goal the simplification of QO of queries implied in blocking. Thus, we could get some  for QO of blocked queries just because sp_who2 will extract these missing indices quicker instead of using SSMS (SQL Server Management Studio) for analysis of execution plans.

This proc returns just 19 columns containing details about current blocked connections and various info that help the analysis: 
- [x] Group Num: This column will contain identifiers for groups of SQL Server blocked connections
- [x] Connections Blocked: current spid  or session_id  plus parent spid for blocking scenarios
- [x] Connection DB: database for current connection
- [x] Object: Name of current procedure
- [x] SQL Statement: Active sql statement 
- [x] Status: sys.sysprocesses.status
- [x] Transaction count (for current connection)
- [x] Wait type: Last wait type
- [x] Wait object: Blocked objects (ex: indices)
- [x] Wait duration: Difference between current date time 
- [x] CPU
- [x] Reads
- [x] Writes
- [x] Indexes: Missing indexes
- [x] Query plan: The execution plan of current object
- [x] Program name
- [x] Hst name: Name of the host currently connected to SQL Server
- [x] Name of login
- [x] Hid: Binary representation of Connections Blocked. A hierachyid column used to store blocked spids in a hierarchical manner thus: root blocking session\level 1 blocked session\level 2 blocked session\etc. 

# Execution  

`sp_who4`

`EXEC sp_who4`

`EXECUTE sp_who4`

![image](https://user-images.githubusercontent.com/62909052/137621730-07e821f8-ce36-4889-bbb6-1636b4185097.png)
