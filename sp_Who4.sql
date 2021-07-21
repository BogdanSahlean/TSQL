SET QUOTED_IDENTIFIER, ANSI_NULLS ON;
GO
USE master
GO
IF EXISTS(SELECT * FROM sys.procedures f WHERE schema_id = 1 AND name = 'sp_Who4')
	DROP PROCEDURE sp_Who4
GO
--Author: Bogdan SAHLEAN 
CREATE PROCEDURE sp_Who4
AS
WITH XMLNAMESPACES(DEFAULT 'http://schemas.microsoft.com/sqlserver/2004/07/showplan'),
BlkSessions
AS (
	SELECT	blk_sei.spid AS session_id, NULLIF(blk_sei.blocked, 0) AS blocked_by, NULL AS group_num
	FROM	sys.sysprocesses blk_sei
	WHERE	blk_sei.blocked <> 0 
	UNION ALL
	SELECT	blk_blk.session_id, NULL AS blocked_by, ROW_NUMBER() OVER(ORDER BY blk_blk.session_id)  AS group_num
	FROM (
		SELECT	blk_sei.spid AS session_id
		FROM	sys.sysprocesses blk_sei
		WHERE	EXISTS(SELECT * FROM sys.dm_os_waiting_tasks dmowt WHERE dmowt.blocking_session_id = blk_sei.spid) -- blk_sei.blocked = 0
		AND		NOT EXISTS(SELECT * FROM sys.dm_os_waiting_tasks dmowt WHERE dmowt.session_id = blk_sei.spid) -- blk_sei.blocked = 0
		UNION ALL
		SELECT	blk_se.spid AS session_id
		FROM	(
			-- I'm not sure if bellow session_id s are returned by sys.sysprocesses.spid or not. If not then this query will return these values to allow the generation of hierarchyid values
			SELECT -2 UNION ALL
			SELECT -3 UNION ALL
			SELECT -4   
		) AS blk_se(spid) -- Abnormal session_id. See https://docs.microsoft.com/en-us/sql/relational-databases/system-compatibility-views/sys-sysprocesses-transact-sql
		WHERE	EXISTS(SELECT * FROM sys.sysprocesses blk_sei WHERE	blk_sei.blocked = blk_se.spid)
		AND		NOT EXISTS(SELECT * FROM sys.sysprocesses blk_sei WHERE	blk_sei.spid = blk_se.spid)   
	) blk_blk
), BlkSessionsRecursion
AS (
	SELECT	blk_ses.group_num, CONVERT(HIERARCHYID, '/' + LTRIM(blk_ses.session_id) + '/') AS session_hid, blk_ses.session_id, blk_ses.blocked_by
	FROM	BlkSessions blk_ses
	WHERE	blk_ses.blocked_by IS NULL 
	UNION ALL
	SELECT	blk_hd.group_num, CONVERT(HIERARCHYID, blk_hd.session_hid.ToString() + LTRIM(blk_ses.session_id) + '/') AS session_hid, blk_ses.session_id, blk_ses.blocked_by
	FROM	BlkSessionsRecursion blk_hd 
	JOIN	BlkSessions blk_ses ON blk_ses.blocked_by = blk_hd.session_id
), BlkHierarchy
AS (
	SELECT	blk_hid.group_num, blk_hid.session_hid, blk_hid.session_hid.ToString() AS session_hidToString, blk_hid.session_id
	FROM	BlkSessionsRecursion blk_hid
)
SELECT	blk_hi.group_num, blk_hi.session_hid, blk_hi.session_hidToString, blk_sou.session_id, blk_sou.host_name, blk_sou.program_name, blk_sou.login_name, QUOTENAME(blk_sou.session_db) AS session_db, blk_sou.[status], blk_sou.open_transaction_count, blk_sou.wait_type, blk_lok.resource_type, blk_res.resource_existingmode, blk_lok.request_mode AS resource_requestmode, blk_sou.worker_time, blk_sou.wait_duration, blk_resent.wait_object_index_name, blk_sou.page_reads, blk_sou.page_writes, blk_sou.[sql_handle], blk_sql.sql_db, blk_sql.sql_object, blk_sql.sql_statement, qp.query_plan, qp.missing_indexes, CASE WHEN blk_hi.session_hidToString IS NULL THEN 0 ELSE 1 END AS is_blocked
FROM (
	SELECT	blk_sei.spid AS session_id, blk_sei.hostname AS host_name, blk_sei.program_name, blk_sei.loginame AS login_name, blk_sei.[status], blk_sei.open_tran AS open_transaction_count,  blk_wt.wait_type, blk_wt.resource_description AS wait_resource, blk_wt.resource_address, CONVERT(DECIMAL(38, 4), blk_wt.wait_duration_ms*.1/1000) AS wait_duration, CONVERT(DECIMAL(38, 4), blk_co.cpu_time*.1/1000) AS worker_time, blk_co.logical_reads AS page_reads, blk_co.writes AS page_writes, DB_NAME(blk_sei.dbid) AS [session_db], blk_sei.sql_handle AS [sql_handle], blk_sei.stmt_start AS sql_statement_start, blk_sei.stmt_end AS sql_statement_end
	FROM	sys.sysprocesses blk_sei
	OUTER APPLY sys.dm_exec_sql_text(blk_sei.sql_handle) AS blk_txt
	JOIN	sys.dm_exec_sessions blk_co ON blk_co.session_id = blk_sei.spid	
	JOIN	sys.dm_os_waiting_tasks blk_wt ON blk_wt.session_id = blk_co.session_id
	WHERE	blk_sei.blocked <> 0
	UNION ALL
	SELECT	blk_sei.spid AS session_id, blk_sei.hostname AS host_name, blk_sei.program_name, blk_sei.loginame AS login_name, blk_sei.[status], blk_sei.open_tran AS open_transaction_count, blk_wt.wait_type, blk_wt.resource_description AS wait_resource, blk_wt.resource_address, CONVERT(DECIMAL(38, 4), blk_wt.wait_duration_ms*.1/1000) AS wait_duration, CONVERT(DECIMAL(38, 4), blk_co.cpu_time*.1/1000) AS worker_time, blk_co.logical_reads AS page_reads, blk_co.writes AS page_writes, DB_NAME(blk_sei.dbid) AS [session_db], blk_sei.sql_handle AS [sql_handle], blk_sei.stmt_start AS sql_statement_start, blk_sei.stmt_end AS sql_statement_end
	FROM	sys.sysprocesses blk_sei
	OUTER APPLY sys.dm_exec_sql_text(blk_sei.sql_handle) AS blk_txt
	JOIN	sys.dm_exec_sessions blk_co ON blk_co.session_id = blk_sei.spid
	LEFT JOIN sys.dm_os_waiting_tasks blk_wt ON blk_wt.session_id = blk_co.session_id
	WHERE	blk_sei.blocked = 0
	AND		EXISTS(SELECT * FROM sys.sysprocesses blk_wt WHERE blk_wt.blocked = blk_sei.spid)
	UNION ALL
	SELECT	blk_se.spid AS session_id, blk_se.[desc] AS host_name, NULL AS program_name, NULL AS login_name, NULL AS [status], NULL AS open_transaction_count,  NULL AS wait_type, NULL AS wait_resource, NULL AS resource_address, NULL AS wait_duration, NULL AS worker_time, NULL AS page_reads, NULL AS page_writes, NULL AS [session_db], NULL AS [sql_handle], NULL AS sql_statement_start, NULL AS sql_statement_end
	FROM	(
		-- I'm not sure if bellow session_id s are returned by sys.sysprocesses.spid or not. If not then this query will return these values to allow the generation of hierarchyid values
		SELECT -2, 'The blocking resource is owned by an orphaned distributed transaction.' UNION ALL
		SELECT -3, 'The blocking resource is owned by a deferred recovery transaction.' UNION ALL
		SELECT -4, 'Session ID of the blocking latch owner could not be determined due to internal latch state transitions.'
	) AS blk_se(spid, [desc]) -- Abnormal session_id. See https://docs.microsoft.com/en-us/sql/relational-databases/system-compatibility-views/sys-sysprocesses-transact-sql?view=sql-server-200019
	WHERE	EXISTS(SELECT * FROM sys.sysprocesses blk_sei WHERE	blk_sei.blocked = blk_se.spid)
	AND		NOT EXISTS(SELECT * FROM sys.sysprocesses blk_sei WHERE	blk_sei.spid = blk_se.spid)
	UNION ALL
	SELECT	blk_sei.spid AS session_id, blk_sei.hostname AS host_name, blk_sei.program_name, blk_sei.loginame AS login_name, blk_sei.[status], blk_sei.open_tran AS open_transaction_count, blk_wt.wait_type, blk_wt.resource_description AS wait_resource, blk_wt.resource_address, CONVERT(DECIMAL(38, 4), blk_wt.wait_duration_ms*.1/1000) AS wait_duration, CONVERT(DECIMAL(38, 4), blk_co.cpu_time*.1/1000) AS worker_time, blk_co.logical_reads AS page_reads, blk_co.writes AS page_writes, DB_NAME(blk_sei.dbid) AS [session_db], blk_sei.sql_handle AS [sql_handle], blk_sei.stmt_start AS sql_statement_start, blk_sei.stmt_end AS sql_statement_end
	FROM	sys.sysprocesses blk_sei
	OUTER APPLY sys.dm_exec_sql_text(blk_sei.sql_handle) AS blk_txt
	JOIN	sys.dm_exec_sessions blk_co ON blk_co.session_id = blk_sei.spid
	LEFT JOIN sys.dm_os_waiting_tasks blk_wt ON blk_wt.session_id = blk_co.session_id AND /*CXCONSUMER,CXPACKET*/blk_co.session_id <> blk_wt.blocking_session_id 
	WHERE	blk_sei.spid <> @@SPID -- By default, current session will be excluded
	AND		blk_sei.ecid = 0
	AND		EXISTS(
		SELECT	*
		FROM	sys.dm_exec_requests der 
		WHERE	der.session_id = blk_sei.spid
		AND		der.status IN (N'suspended', N'running', N'runnable')
		AND		NOT EXISTS(SELECT * FROM sys.dm_os_waiting_tasks dowt WHERE /*CXCONSUMER,CXPACKET*/dowt.session_id <> dowt.blocking_session_id AND dowt.session_id = der.session_id)
		AND		NOT EXISTS(SELECT * FROM sys.dm_os_waiting_tasks dowt WHERE /*CXCONSUMER,CXPACKET*/dowt.session_id <> dowt.blocking_session_id AND dowt.blocking_session_id = der.session_id)
	)
) blk_sou
OUTER APPLY (
	SELECT	resource_existingmode = blk_sou.resource_as_xml.value('(i[si[1]/text() = "mode"]/si[2])[1]', 'NVARCHAR(50)')
	FROM	(SELECT CONVERT(XML, '<i><si>' + REPLACE(REPLACE(blk_sou.wait_resource, '=', '</si><si>'), ' ', '</si></i><i><si>') + '</si></i>')) blk_sou(resource_as_xml)
) blk_res
LEFT JOIN sys.dm_tran_locks blk_lok ON blk_lok.lock_owner_address = blk_sou.resource_address
-- Get index from resource_associated_entity_id
LEFT JOIN sys.partitions blk_ptn ON blk_lok.resource_type IN ('PAGE', 'KEY', 'RID', 'HOBT') AND blk_ptn.hobt_id = blk_lok.resource_associated_entity_id AND blk_ptn.partition_number = 1
LEFT JOIN sys.indexes blk_ptnix ON blk_ptnix.object_id = blk_ptn.object_id AND blk_ptnix.index_id = blk_ptn.index_id
LEFT JOIN sys.allocation_units blk_ats2 ON blk_lok.resource_type = 'ALLOCATION_UNIT' AND blk_ats2.allocation_unit_id = blk_lok.resource_associated_entity_id
LEFT JOIN sys.partitions blk_ptn2 ON blk_ptn2.partition_id = blk_ats2.container_id 
LEFT JOIN sys.indexes blk_ptnix2 ON blk_ptnix2.object_id = blk_ptn2.object_id AND blk_ptnix2.index_id = blk_ptn2.index_id AND blk_ptn2.partition_number = 1
OUTER APPLY (
	SELECT wait_object_index_name = ISNULL(
			QUOTENAME(OBJECT_SCHEMA_NAME(blk_ptnix.object_id, blk_lok.resource_database_id)) + '.' + QUOTENAME(OBJECT_NAME(blk_ptnix.object_id, blk_lok.resource_database_id)) + '.' + QUOTENAME(blk_ptnix.name),
			QUOTENAME(OBJECT_SCHEMA_NAME(blk_ptnix.object_id, blk_lok.resource_database_id)) + '.' + QUOTENAME(OBJECT_NAME(blk_ptnix.object_id, blk_lok.resource_database_id)) + '.' + QUOTENAME(blk_ptnix2.name)),
		wait_object_id	= ISNULL(blk_ptnix.object_id, blk_ptnix2.object_id),
		wait_index_id	= ISNULL(blk_ptnix.index_id, blk_ptnix2.index_id)
) blk_resent
-- End Get index from resource_associated_entity_id
LEFT JOIN BlkHierarchy blk_hi ON blk_hi.session_id = blk_sou.session_id
OUTER APPLY (
	SELECT sql_db = QUOTENAME(DB_NAME(blk_sqltxt.dbid)), 
		sql_object = QUOTENAME(OBJECT_SCHEMA_NAME(blk_sqltxt.objectid, blk_sqltxt.dbid)) + '.' + QUOTENAME(OBJECT_NAME(blk_sqltxt.objectid, blk_sqltxt.dbid)), 
		sql_statement = (SELECT SUBSTRING(blk_sqltxt.[text], /*1*/ blk_sqlffs2.sql_start, /*2000*/ blk_sqlffs2.sql_len) AS '*' FOR XML PATH(''), TYPE) -- Instead of sql_start and sql_len used to return current sql statement we are returning text of sql batch
	FROM (
		SELECT	blk_sqlffs.sql_start, sql_len = ISNULL(NULLIF(NULLIF(blk_sou.sql_statement_end, 0), -1), 4000) / 2 - blk_sqlffs.sql_start
		FROM	(SELECT sql_start= ISNULL(NULLIF(NULLIF(blk_sou.sql_statement_start, 0), -1), 0) / 2 + 1) blk_sqlffs
	) blk_sqlffs2
	OUTER APPLY sys.dm_exec_sql_text(blk_sou.sql_handle) blk_sqltxt
) blk_sql
OUTER APPLY (
	SELECT	TOP(1) pl.query_plan, pl.query_plan.query('//MissingIndexes') AS missing_indexes
	FROM	sys.dm_exec_requests rq OUTER APPLY sys.dm_exec_query_plan(rq.plan_handle) pl
	WHERE	blk_sou.session_id = rq.session_id
	ORDER BY rq.request_id
) qp
ORDER BY is_blocked DESC, blk_hi.group_num, blk_hi.session_hid
