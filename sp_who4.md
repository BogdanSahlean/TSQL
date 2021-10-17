# sp_who4

Analysis blocking of active SQL Server sessions could be hard if current SQL Server instance has a high number of active connections. Thus, this analysis could be complicated because busy instances could have more than 1 blocking connections set, meaning that we could have more than just 1 blocking and for every group of blocked connections we could have more than 2 connections. 

This proc will simplify the analysis of blocked connections because will create groups of blocked connections and will extract the missing indices. This is main reason why this proc (sp_Who4) could be used to simplify the analysis of blocked processes and then take fast decision for QO (the missing indices).

Internals https://www.sqlservercentral.com/articles/sp_who4

Similar Functions With sp_WhoIsActive

# Parameters

`@extractindexes INT = NULL --NULL=No, 1=Extract Execution Plans, 2=Extract Xml Missing Indexes, 8=Extract Sql Statements for Indexes` 

# Behaviour

# Execution   
