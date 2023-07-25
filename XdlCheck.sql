USE Test3
SET QUOTED_IDENTIFIER ON 
SET ANSI_NULLS ON  
GO
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON   
GO
CREATE OR ALTER PROCEDURE [dbo].[XdlCheck] 
@SrceDesc		VARCHAR(MAX) = NULL,
@SrceDB			TINYINT = NULL, --0 Db From Deadlock Graph, 1 Current Database
@ListAllDeads	TINYINT = 0,	--0/1
@Action			TINYINT = NULL	--0 Null, 1 Extract Execution Plans, 1 Analyze Locks
AS
IF OBJECT_ID('tempdb..##deadlock_graph') IS NULL
BEGIN
	CREATE TABLE ##deadlock_graph (
		EventSequence	INT NULL,
		ServerName		SYSNAME NULL,
		StartTime		DATETIME NULL,
		SourceType		SYSNAME NOT  NULL,
		TraceQueueTable	NVARCHAR(500) NULL,   
		[FileName]		NVARCHAR(500) NULL,		
		XeAdress		VARBINARY(64) NULL,
		FileOffset		INT NULL,
		[Events]		SYSNAME NULL,
		[Service]		SYSNAME NULL,	
		ActivationProcedure NVARCHAR(500) NULL,
		CurrentDB		SYSNAME NULL,
		DeadlockGraph	XML NULL,
		ID			INT IDENTITY(1,1)  NOT  NULL,  
		Type			VARCHAR(44) NOT NULL
	)
END     

DECLARE @SrceXml		XML
DECLARE @SqlStatement	NVARCHAR(MAX)
IF (@SrceDesc IS NULL AND @SrceDB IS NULL) AND @ListAllDeads = 0
BEGIN
	IF OBJECT_ID('tempdb..#trace_file') IS NULL  
	BEGIN
		CREATE TABLE #trace_file (
			trace_id		int,
			StartTime		datetime,
			path			nvarchar(500),
			deadlock_graph	xml,
			id				int	identity(1,30), 
			type			varchar(44)
		)
	END

	DECLARE	@trace_id INT, @StartTime DATETIME, @path NVARCHAR(500)
	DECLARE CrsProfiler CURSOR LOCAL STATIC FORWARD_ONLY READ_ONLY FOR   
	SELECT	tcc.id, NULL StartTime, tcc.path
	FROM	sys.traces tcc
	WHERE	EXISTS (
		SELECT	*   
		FROM	sys.fn_trace_geteventinfo(tcc.id) t   
		JOIN	sys.trace_events e ON t.eventid = e.trace_event_id                                                                                                                          
		WHERE	e.name IN ('Deadlock graph', 'Blocked process report') --137 Blocked process report, 148 Deadlock graph
	) 
	AND		tcc.path IS NOT NULL

	OPEN CrsProfiler

	WHILE 3=3
	BEGIN
		FETCH NEXT FROM CrsProfiler INTO @trace_id, @StartTime, @path
	
		IF @@FETCH_STATUS = 0
		BEGIN
			INSERT	#trace_file(trace_id, StartTime, path, deadlock_graph, type)
			SELECT	@trace_id, f.StartTime, @path, 
					CASE 
						WHEN e.name = 'Deadlock graph' THEN CAST(f.TextData AS XML).query('deadlock-list/deadlock') 
						WHEN e.name = 'Blocked process report' THEN CAST(f.TextData AS XML).query('blocked-process-report')
						ELSE 1/0
					END TextData, e.name
			FROM	sys.fn_trace_gettable(@path, NULL) f
			JOIN	sys.trace_events e ON f.EventClass = e.trace_event_id
			WHERE	e.name IN ('Deadlock graph', 'Blocked process report') --137 Blocked process report, 148 Deadlock graph
			AND	
			(
				NOT EXISTS 
				(
					SELECT * FROM #trace_file ttt
					WHERE ttt.trace_id = @trace_id AND ttt.path = @path AND ttt.StartTime >= f.StartTime
				)
				OR NOT 
				EXISTS 
				(
					SELECT * FROM #trace_file ttt
					WHERE ttt.trace_id = @trace_id AND ttt.path = @path 
				)
			)
		END		
		ELSE
		BREAK
	END

	CLOSE CrsProfiler
	DEALLOCATE CrsProfiler

	IF OBJECT_ID('tempdb..#trace_table') IS NULL
	BEGIN
		CREATE TABLE #trace_table (
			RowNumber		int,
			trace_table		nvarchar(500),
			StartTime		datetime,
			deadlock_graph	xml,
			id				int	identity(2,30),
			type			varchar(44)
		)
	END

	DECLARE @SqlStatementDb VARCHAR(4000) = ''
	SELECT	@SqlStatementDb = @SqlStatementDb + 'UNION 
	SELECT	''' + QUOTENAME(db.name) + ''' + ''.'' + QUOTENAME(SCHEMA_NAME(t.schema_id)) + ''.'' + QUOTENAME(OBJECT_NAME(t.object_id)) Objct
	FROM	' + QUOTENAME(db.name) + '.sys.tables t 
	WHERE	EXISTS
	(
		SELECT	* 
		FROM	sys.columns col2
		WHERE	col2.object_id = t.object_id 
		AND		col2.name IN (''RowNumber'', ''TextData'', ''StartTime'')
		HAVING	COUNT(*) = 3
	)'
	FROM	sys.databases db
	WHERE db.name = DB_NAME() 
	AND db.state_desc = 'ONLINE' AND db.user_access_desc = 'MULTI_USER' --TODO: Rewrite using a cursor
	ORDER BY db.name
	SELECT @SqlStatementDb= STUFF(@SqlStatementDb, 1, 6, '')

	DECLARE @db TABLE(db SYSNAME)  
	INSERT @db(db)
	EXEC(@SqlStatementDb)

	DECLARE @Objct NVARCHAR(500)
	DECLARE CrsProfiler CURSOR LOCAL STATIC FORWARD_ONLY READ_ONLY FOR
	SELECT * FROM @db

	OPEN CrsProfiler

	WHILE 3=3
	BEGIN
		FETCH NEXT FROM CrsProfiler INTO @Objct
	
		IF @@FETCH_STATUS = 0
		BEGIN
			SELECT @SqlStatement = '
			INSERT	#trace_table (RowNumber, trace_table, StartTime, deadlock_graph, type)	
			SELECT	qprofiler.RowNumber, ''' + @Objct + ''', qprofiler.StartTime, 
					CASE 
						WHEN e.name = ''Deadlock graph'' THEN CONVERT(XML, qprofiler.TextData).query(''deadlock-list/deadlock'')
						WHEN e.name = ''Blocked process report'' THEN CONVERT(XML, qprofiler.TextData).query(''blocked-process-report'') 
						ELSE 1/0
					END DeadlockGraph,				
				etns.name
			FROM	' + @Objct + ' qprofiler
			JOIN	sys.trace_events etns ON qprofiler.EventClass = etns.trace_event_id
			WHERE	etns.name IN (''Deadlock graph'', ''Blocked process report'')
			AND		
			(
				NOT 
				EXISTS
				(
					SELECT * FROM #trace_table tcc 
					WHERE tcc.trace_table = @Objct AND tcc.RowNumber >= qprofiler.RowNumber     
				)
				OR NOT 
				EXISTS
				(
					SELECT * FROM #trace_table tcc 
					WHERE tcc.trace_table = @Objct
				)
			)'
			EXEC sp_executesql @SqlStatement, N'@Objct NVARCHAR(500)', @Objct
		END		
		ELSE
		BREAK
	END

	DECLARE @xe_address VARBINARY(64), @xe_name SYSNAME, @target_name SYSNAME, @target_data XML, @type XML
	DECLARE CrsXe CURSOR LOCAL STATIC FORWARD_ONLY READ_ONLY FOR
	SELECT	xe.address xe_address, xe.name xe_name, xet.target_name, xet.target_data, xeevt.event_name type
	FROM	sys.dm_xe_session_events xeevt
	JOIN	sys.dm_xe_sessions xe ON xe.address = xeevt.event_session_address
	JOIN	sys.dm_xe_session_targets xet ON xet.event_session_address = xeevt.event_session_address
	WHERE	xeevt.event_name IN ('xml_deadlock_report', 'blocked_process_report')
	OPEN CrsXe

	WHILE 3=3
	BEGIN
		FETCH NEXT FROM CrsXe INTO @xe_address, @xe_name, @target_name, @target_data, @type
	
		IF @@FETCH_STATUS = 0
		BEGIN
			IF @target_name = 'event_file'
			BEGIN
				IF OBJECT_ID('tempdb..#xe_event_file') IS NULL
				BEGIN
					CREATE TABLE #xe_event_file (
						xe_address		varbinary(8),
						xe_name			sysname,
						target_name		varchar(230),
						[file_name]		nvarchar(500),
						file_offset		bigint,
						[timestamp]		datetime,
						deadlock_graph	xml,
						id				int	identity(3,30),
						type			varchar(44)
					)
				END

				DECLARE @FileName NVARCHAR(500) = @target_data.value('(EventFileTarget/File/@name)[1]', 'NVARCHAR(500)')
				INSERT	#xe_event_file(xe_address, xe_name, target_name, [file_name], file_offset, [timestamp], deadlock_graph, type)
				SELECT	*
				FROM (
					SELECT	@xe_address xe_address, @xe_name xe_name, @target_name target_name,
							xef.file_name, 
							xef.file_offset,
							CONVERT(XML, xef.event_data).value('(event/@timestamp)[1]', 'VARCHAR(60)') [timestamp],
							CASE 
								WHEN xef.object_name = 'xml_deadlock_report' 
								THEN CONVERT(XML, xef.event_data).query('event/data/value/deadlock')
								ELSE CONVERT(XML, xef.event_data).query('event/data/value/blocked-process-report')
							END deadlock_graph,
							xef.object_name type
					FROM	sys.fn_xe_file_target_read_file(@FileName, null, null,  null) xef
					WHERE	xef.object_name IN ('xml_deadlock_report', 'blocked_process_report')
				) s 
				WHERE NOT 
				EXISTS (
					SELECT * FROM #xe_event_file xef
					WHERE xef.xe_address = s.xe_address AND xef.file_name = s.file_name
				) OR 
				EXISTS (
					SELECT * FROM #xe_event_file xef
					WHERE xef.xe_address = s.xe_address AND xef.file_name = s.file_name AND xef.file_offset < s.file_offset
				)
			END
			ELSE IF @target_name = 'ring_buffer'
			BEGIN
				IF OBJECT_ID('tempdb..#xe_event_buffer') IS NULL
				BEGIN
					CREATE TABLE #xe_event_buffer (
						xe_address		varbinary(8),
						xe_name			sysname,
						target_name		varchar(230),
						[timestamp]		datetime,
						deadlock_graph	xml,
						id				int	identity(4,30),
						type			varchar(44)
					)
				END

				INSERT	#xe_event_buffer (xe_address, xe_name, target_name, [timestamp], deadlock_graph, type)
				SELECT	s.*
				FROM (
					SELECT	@xe_address xe_address, @xe_name xe_name, @target_name target_name, eve.XmlNode.value('(@timestamp)[1]', 'DATETIME') [timestamp], dpdd.XmlNode.query('.')  deadlock_graph, event_name type
					FROM	@target_data.nodes('RingBufferTarget/event[@name = ("xml_deadlock_report", "blocked_process_report")]') eve(XmlNode)
					OUTER APPLY eve.XmlNode.nodes('data[@name eq "xml_report"]/value/deadlock') dpdd(XmlNode)					 -- Deadlock events
					OUTER APPLY eve.XmlNode.nodes('data[@name eq "blocked_process"]/value/blocked_process_report') dpbp(XmlNode) -- Blocked_process_report 
					OUTER APPLY (
						SELECT eve.XmlNode.value('(@name)[1]', 'VARCHAR(44)') event_name
					) evename
				) s
				WHERE NOT 
				EXISTS (
					SELECT * FROM #xe_event_buffer xeb
					WHERE xeb.xe_address = s.xe_address
				) OR NOT
				EXISTS (
					SELECT * FROM #xe_event_buffer xeb
					WHERE xeb.xe_address = s.xe_address AND xeb.[timestamp] = s.[timestamp]
				)
			END
		END 
		ELSE
		BEGIN
			BREAK
		END
	END

	CLOSE CrsXe
	DEALLOCATE CrsXe

	IF OBJECT_ID('tempdb..#events_not') IS NULL
	BEGIN
		CREATE TABLE #events_not (
			EventSequence		INT,
			ServerName			SYSNAME,
			StartTime			DATETIME,
			EventNotification	SYSNAME,
			Service				NVARCHAR(500),
			Queue				SYSNAME,
			ActivationProcedure	NVARCHAR(750),
			CurrentDB			SYSNAME,
			deadlock_graph		XML,
			id					int	identity(5,30),
			type				varchar(44)
		)
	END

	DECLARE	@EventNotification SYSNAME
	DECLARE	@Service NVARCHAR(500)
	DECLARE	@Queue SYSNAME
	DECLARE @ActivationProcedure NVARCHAR(750)
	DECLARE @CurrentDB SYSNAME
	DECLARE @CrsEvService CURSOR

	SELECT @SqlStatement = ''
	SELECT	@SqlStatement = @SqlStatement +
	'UNION ALL     
	SELECT	noti.name EventNotification, serc.name [Service], serq.name [Queue], serq.activation_procedure [ActivationProcedure], ''' + QUOTENAME(db.name) + ''' CurrentDB
	FROM	sys.server_events sents
	JOIN	sys.server_event_notifications noti ON sents.object_id = noti.object_id
	JOIN	' + QUOTENAME(db.name) + '.sys.services serc ON noti.service_name = serc.name
	JOIN	' + QUOTENAME(db.name) + '.sys.service_queue_usages serqug ON serc.service_id = serqug.service_id
	JOIN	' + QUOTENAME(db.name) + '.sys.service_queues serq ON serq.object_id = serqug.service_queue_id
	WHERE	sents.type IN (1148/*DEADLOCK_GRAPH*/, 1137 /*BLOCKED_PROCESS_REPORT*/) '
	FROM	sys.databases db
	WHERE	db.state_desc = 'ONLINE' AND db.user_access_desc = 'MULTI_USER'
	AND		EXISTS (
		SELECT	* 
		FROM	fn_my_permissions(db.name, 'DATABASE') pems
		WHERE	pems.permission_name = 'SELECT'
	)
	SELECT @SqlStatement = STUFF(@SqlStatement, 1, 13, '')
	SELECT @SqlStatement = 'SET @CrsEv = CURSOR LOCAL STATIC FORWARD_ONLY READ_ONLY FOR' 
	+ CHAR(13) + CHAR(10) + @SqlStatement
	+ CHAR(13) + CHAR(10) + 'OPEN @CrsEv'

	EXEC sp_executesql @SqlStatement, N'@CrsEv CURSOR OUT', @CrsEvService OUT 
	FETCH NEXT FROM @CrsEvService INTO @EventNotification, @Service, @Queue, @ActivationProcedure, @CurrentDB 
	
	WHILE 3=3
	BEGIN
		FETCH NEXT FROM @CrsEvService INTO @EventNotification, @Service, @Queue, @ActivationProcedure, @CurrentDB 
	
		IF @@FETCH_STATUS = 0
		BEGIN
		
			SELECT @SqlStatement = N'
			INSERT	 #events_not (EventSequence, ServerName, StartTime, EventNotification, [Service], [Queue], ActivationProcedure, CurrentDB, deadlock_graph, type)
			SELECT	*
			FROM (
				SELECT	xm.XmlMessage.value(''(EVENT_INSTANCE/EventSequence)[1]'', ''INT'') EventSequence,
						xm.XmlMessage.value(''(EVENT_INSTANCE/ServerName)[1]'', ''SYSNAME'') ServerName,
						xm.XmlMessage.value(''(EVENT_INSTANCE/StartTime)[1]'', ''DATETIME'') StartTime,
						@EventNotification EventNotification,
						@Service Service,
						@Queue Queue,
						@ActivationProcedure ActivationProcedure,
						@CurrentDB CurrentDB, 
						CASE 
							WHEN ev.type = ''DEADLOCK_GRAPH'' THEN xm.XmlMessage.query(''EVENT_INSTANCE/TextData/deadlock-list/deadlock'') 
							WHEN ev.type = ''BLOCKED_PROCESS_REPORT'' THEN xm.XmlMessage.query(''EVENT_INSTANCE/TextData/deadlock-list/deadlock'') 
							ELSE CAST(1/0 AS VARCHAR(44))
						END	deadlock_graph,
						ev.type
				FROM	' + @CurrentDB + '..' + @Queue + ' dq --Quoted DB
				OUTER APPLY (SELECT CAST(dq.message_body AS XML)) xm(XmlMessage)
				OUTER APPLY (SELECT xm.XmlMessage.value(''(EVENT_INSTANCE/EventType/text())[1]'', ''VARCHAR(44)'') ) ev(type)
				WHERE ev.type IN (''DEADLOCK_GRAPH'', ''BLOCKED_PROCESS_REPORT'') 
			) s
			WHERE NOT 
			EXISTS(SELECT * FROM #events_not ents WHERE ents.[Queue] = @Queue AND ents.EventSequence >= s.EventSequence)
			OR NOT 
			EXISTS(SELECT * FROM #events_not ents WHERE ents.[Queue] = @Queue)'
			
			EXEC sp_executesql @SqlStatement, N'@EventNotification SYSNAME, @Service NVARCHAR(500), @Queue SYSNAME, @ActivationProcedure NVARCHAR(750), @CurrentDB SYSNAME', @EventNotification, @Service, @Queue, @ActivationProcedure, @CurrentDB
		END
		ELSE
		BREAK
	END

	CLOSE @CrsEvService
	DEALLOCATE @CrsEvService

	/*
	TRUNCATE TABLE ##deadlock_graph
	SELECT * FROM #xe_event_file
	SELECT * FROM #xe_event_buffer
	SELECT * FROM #trace_file
	SELECT * FROM #trace_table 
	SELECT * FROM #events_not
	*/

	INSERT	##deadlock_graph (EventSequence, ServerName, StartTime, SourceType, TraceQueueTable, [FileName], XeAdress, FileOffset, [Events], [Service], ActivationProcedure, DeadlockGraph, Type)
	SELECT	NULL, CAST(SERVERPROPERTY('ServerName') AS SYSNAME), xe.timestamp, xe.target_name, xe.xe_name, xe.file_name, xe.xe_address, xe.file_offset, NULL, NULL,  NULL, xe.deadlock_graph,type
	FROM	#xe_event_file xe
	
	INSERT	##deadlock_graph (EventSequence, ServerName, StartTime, SourceType, TraceQueueTable, [FileName], XeAdress, FileOffset, [Events], [Service], ActivationProcedure, DeadlockGraph, type)
	SELECT	NULL, CAST(SERVERPROPERTY('ServerName') AS SYSNAME), xe.timestamp, xe.target_name, xe.xe_name, NULL, xe.xe_address, NULL, NULL, NULL,NULL, xe.deadlock_graph, type
	FROM	#xe_event_buffer xe
	
	INSERT	##deadlock_graph (EventSequence, ServerName, StartTime, SourceType, TraceQueueTable, [FileName], XeAdress, FileOffset, [Events], [Service], ActivationProcedure, DeadlockGraph, type)
	SELECT	NULL, CAST(SERVERPROPERTY('ServerName') AS SYSNAME), xe.StartTime, 'trace_file', 'trace_id='+LTRIM(xe.trace_id), xe.[path], NULL, NULL, NULL, NULL,NULL, xe.deadlock_graph, type
	FROM	#trace_file xe
	
	INSERT	##deadlock_graph (EventSequence, ServerName, StartTime, SourceType, TraceQueueTable, [FileName], XeAdress, FileOffset, [Events], [Service], ActivationProcedure, DeadlockGraph, type)
	SELECT	NULL, CAST(SERVERPROPERTY('ServerName') AS SYSNAME), xe.StartTime, 'trace_table', xe.trace_table, NULL, NULL, NULL, NULL, NULL,NULL, xe.deadlock_graph, type
	FROM	#trace_table xe

	INSERT	##deadlock_graph (EventSequence, ServerName, StartTime, SourceType, TraceQueueTable, [FileName], XeAdress, FileOffset, [Events], [Service], ActivationProcedure, CurrentDB, DeadlockGraph, type)
	SELECT	xe.EventSequence, xe.ServerName, xe.StartTime, 'EventNoti', xe.[Queue], NULL, NULL, NULL, xe.EventNotification, xe.Service, xe.ActivationProcedure, CurrentDB, xe.deadlock_graph, type
	FROM	#events_not xe
END

IF (@SrceDesc IS NULL AND @SrceDB IS NULL) OR @ListAllDeads = 1
BEGIN
	SELECT * FROM ##deadlock_graph ddq
	ORDER BY ddq.ServerName, ddq.StartTime DESC
END
DECLARE @SrceID INT 
DECLARE @xdl XML
IF @SrceDesc IS NULL 
RETURN
ELSE IF @SrceDesc IS NOT NULL 
BEGIN
	SELECT @SrceDesc = LTRIM(RTRIM(@SrceDesc))
	IF ISNUMERIC(@SrceDesc) = 1 AND @SrceDesc LIKE '%[0-9]%' AND @SrceDesc NOT LIKE '%[^0-9]%' 
	BEGIN
		SELECT	@SrceID = CAST(@SrceDesc AS INT)

		SELECT	@xdl = ddq.DeadlockGraph
		FROM	##deadlock_graph ddq
		WHERE	ddq.ID = @SrceID
	END
	ELSE IF @SrceDesc LIKE '[A-Z]:\%.xel'
	BEGIN
		DECLARE @SelectedXeFile NVARCHAR(500) = @SrceDesc
		
		SELECT	xef.file_name, 
				xef.file_offset,
				TRY_CAST(xef.event_data AS XML) event_xml,
				xef.object_name
		INTO	#xe_event_file_single_text
		FROM	sys.fn_xe_file_target_read_file(@SelectedXeFile, null, null,  null) xef
		WHERE	xef.object_name IN ('xml_deadlock_report', 'blocked_process_report')

		INSERT	##deadlock_graph (EventSequence, ServerName, StartTime, SourceType, TraceQueueTable, [FileName], XeAdress, FileOffset, [Events], [Service], ActivationProcedure, DeadlockGraph, Type)
		SELECT	NULL, NULL, [timestamp], 'XE separate file', NULL, [file_name], NULL, file_offset, NULL, NULL,  NULL, deadlock_graph, type
		FROM (
			SELECT	xef.file_name, 
					xef.file_offset,
					event_xml.value('(event/@timestamp)[1]', 'VARCHAR(44)') [timestamp],
					CASE 
						WHEN xef.object_name = 'xml_deadlock_report' 
						THEN event_xml.query('event/data/value/deadlock')
						ELSE event_xml.query('event/data/value/blocked-process-report')
					END deadlock_graph,
					xef.object_name type
			FROM	#xe_event_file_single_text xef
		) s 
		WHERE NOT 
		EXISTS (
			SELECT * FROM ##deadlock_graph ddgp
			WHERE ddgp.FileName = s.file_name
		) OR 
		EXISTS (
			SELECT * FROM ##deadlock_graph ddgp
			WHERE ddgp.FileName = s.file_name AND ddgp.FileOffset <= s.file_offset
		)	
		
		SELECT	*
		FROM	#xe_event_file_single_text
		ORDER BY file_offset DESC 
	END
	ELSE IF @SrceDesc LIKE '[A-Z]:\%.trc' 
	BEGIN
		DECLARE @SelectedTrcFile NVARCHAR(500) = @SrceDesc
		
		SELECT	@SelectedTrcFile [path], 
				TRY_CAST(f.TextData AS XML) TextDataXml, 
				f.StartTime, 
				e.name,
				f.ServerName
		INTO	#trace_file_read_single
		FROM	sys.fn_trace_gettable(@SelectedTrcFile, NULL) f
		JOIN	sys.trace_events e ON f.EventClass = e.trace_event_id
		WHERE	e.name IN ('Deadlock graph', 'Blocked process report') --137 Blocked process report, 148 Deadlock graph

		INSERT	##deadlock_graph (EventSequence, ServerName, StartTime, SourceType, TraceQueueTable, [FileName], XeAdress, FileOffset, [Events], [Service], ActivationProcedure, DeadlockGraph, Type)
		SELECT	NULL, f.ServerName, f.StartTime, 'TRC separate file', NULL, [path], NULL, NULL, NULL, NULL,  NULL, 
				deadlock_graph, 
				f.name
		FROM (
			SELECT	f.ServerName, f.StartTime, 
					[path], 
					CASE 
						WHEN f.name = 'Deadlock graph' THEN TextDataXml.query('deadlock-list/deadlock') 
						WHEN f.name = 'Blocked process report' THEN TextDataXml.query('blocked-process-report')
					END deadlock_graph, 
					f.name
			FROM	#trace_file_read_single f
			WHERE	EXISTS(
				SELECT * FROM ##deadlock_graph ddgph
				WHERE ddgph.[FileName] = @path AND ddgph.StartTime >= f.StartTime
			) OR NOT 
			EXISTS 
			(
				SELECT * FROM ##deadlock_graph ddgph
				WHERE ddgph.[FileName] = @path 
			)
		) f

		SELECT * FROM #trace_file_read_single d
		ORDER BY d.ServerName, d.StartTime DESC
	END
	ELSE
	BEGIN
		SELECT @xdl = CAST(@SrceDesc AS XML)
	END

	BEGIN
		-- If BPRP Then XML -> XDL
		IF @xdl.value('local-name(*[1])', 'SYSNAME') = 'blocked-process-report'
		BEGIN
			DECLARE @bprp XML = @xdl

			DROP TABLE IF EXISTS #Session
			DROP TABLE IF EXISTS #Locks
			SELECT	x.XmlRef.query('local-name(..)') SesionType, XmlRef.query('.') XmlRef, 
					num = IDENTITY(INT, 1, 1)
			INTO	#Session
			FROM	@bprp.nodes('blocked-process-report/*/process') x(XmlRef)

			DECLARE CrsXml CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY
			FOR
			SELECT	x.XmlRef, num
			FROM	#Session x	
			WHERE	x.XmlRef.exist('process/@id') = 0

			DECLARE @XmlRef XML, @num INT = 0, @id VARCHAR(44), @sequ INT = 0
			OPEN CrsXml

			WHILE 1=1
			BEGIN
				FETCH NEXT  FROM CrsXml INTO @XmlRef, @num
				IF @@FETCH_STATUS = 0
				BEGIN
					SELECT @sequ = @sequ + 1
					SELECT @id = 'newprocess' + CONVERT(VARCHAR(11), @sequ)

					SET @XmlRef.modify('             
						insert attribute id {sql:variable("@id") }             
						into   (/process)[1] ') 
					UPDATE	#Session
					SET		XmlRef = @XmlRef 
					WHERE num = @num
				END
				ELSE
				BEGIN
					BREAK
				END
			END

			CLOSE CrsXml
			DEALLOCATE CrsXml

			SELECT	*
			INTO #Locks
			FROM (
				SELECT	id		= s.XmlRef.value('(@id)[1]', 'VARCHAR(44)'),
						wrc		= s.XmlRef.value('(@waitresource)[1]', 'VARCHAR(444)'),
						status	= s.XmlRef.value('(@status)[1]', 'VARCHAR(44)'),
						dbid	= s.XmlRef.value('(@currentdb)[1]', 'INT'),
						mode	= s.XmlRef.value('(@lockMode)[1]', 'VARCHAR(44)')
				FROM	#Session seos
				OUTER APPLY seos.XmlRef.nodes('process') s(XmlRef)
			) xx
			OUTER APPLY (
				SELECT	type, database_id, 
					file_id		= CASE WHEN type IN ('RID', 'PAGE') THEN v3 END,
					page_id		= CASE WHEN type IN ('RID', 'PAGE') THEN v4 END,
					slot_page	= CASE WHEN type IN ('RID') THEN v5 END,
					object_id	= CASE WHEN type IN ('TAB') THEN v3 END,
					hobt_id		= CASE WHEN type IN ('KEY') THEN v3 END,
					index_id	= CASE WHEN type IN ('TAB') THEN v4 END,
					hash_key	= CASE WHEN type IN ('KEY') THEN v4 END
				FROM (
					SELECT *, 
						type = wrc_xml.value('i[1]', 'VARCHAR(44)'), 
						database_id = wrc_xml.value('i[2]', 'VARCHAR(44)'), v3 = wrc_xml.value('i[3]', 'VARCHAR(44)'), v4 = wrc_xml.value('i[4]', 'VARCHAR(44)'), v5 = wrc_xml.value('i[5]', 'VARCHAR(44)')
					FROM (
						SELECT	*, wrc_xml = CONVERT(XML, '<i>' + REPLACE(REPLACE(REPLACE(REPLACE(x.wrc, ' ', ''), ':', '</i><i>'), '(', '</i><i>'), ')', '<i></i>') + '</i>')
						FROM (SELECT xx.wrc) x
					) y
				) z
			) t

			--Final step
			SELECT @xdl = 
			(
				SELECT 
				(
					SELECT	XmlRef '*'
					FROM	#Session seos
					FOR XML PATH(N''), TYPE
				) 'process-list',
				(
					SELECT	type, wrc, dbid, file_id, page_id, slot_page, object_id, hobt_id, index_id, hash_key, mode,
					(
						SELECT	id, mode
						FROM	#Locks oe
						WHERE	oe.id = c.id
						FOR XML RAW('waiter'), TYPE
					) AS 'waiter-list',
					(
						SELECT	id, mode
						FROM	#Locks oe
						WHERE	oe.id <> c.id
						FOR XML RAW('owner'), TYPE
					) AS 'owner-list'
					FROM	#Locks c
					WHERE	c.status = 'Suspended'
					FOR XML RAW('lock'), TYPE
				) 'resource-list',
				(
					SELECT	type, wrc, dbid, file_id, page_id, slot_page, object_id, hobt_id, index_id, hash_key, mode,
					(
						SELECT	id, mode, requestType='wait'
						FROM	#Locks oe
						WHERE	oe.id = c.id 
						FOR XML RAW('waiter'), TYPE
					) AS 'waiter-list',
					(
						SELECT	id, mode
						FROM	#Locks oe
						WHERE	oe.id <> c.id
						FOR XML RAW('owner'), TYPE
					) AS 'owner-list'
					FROM	#Locks c
					WHERE	c.wrc IS NOT NULL --Is Waiting?
					AND		NOT
					EXISTS(SELECT * FROM #Locks l WHERE l.status = 'Suspended')	
					FOR XML RAW('lock'), TYPE
				) 'resource-list'
				FOR XML PATH(''), ROOT('deadlock')
			)
			--End of If BPRP Then XML -> XDL
		END
	END
END
IF @xdl.exist('deadlock-list') = 1 
BEGIN
	SELECT @xdl = @xdl.query('deadlock-list/deadlock')
END

IF OBJECT_ID('tempdb..#cox') IS NOT NULL
BEGIN
DROP TABLE #cox
END
SELECT s.*, name = i.Nod.value('(@name)', 'sysname'), value = i.Nod.value('(text())[1]', 'varchar(8000)'), LTRIM(spid) + '.' + LTRIM(ISNULL(ecid,0)) + '.' + LTRIM(id) as idc
INTO #cox
FROM (
SELECT 
	spid.Nod.value('(@spid)[1]', 'int') spid, spid.Nod.value('(@ecid)[1]', 'int') ecid, spid.Nod.value('(@id)[1]', 'sysname') id,
	spid.Nod.query('for $i in ./@* return <i name="{local-name($i)}">{string($i)}</i>') cox,
	spid.Nod.value('(@waittime)[1]', 'sysname') waittime
FROM @xdl.nodes('deadlock/process-list/process') spid(Nod)
) s CROSS APPLY s.cox.nodes('i') i(Nod)

INSERT #cox(spid, ecid, id, cox, waittime, [name], [value], idc)
SELECT	spid, ecid, id, cox, waittime, 'currentdb_actual' [name], QUOTENAME(DB_NAME(CAST(NULLIF([value], '') AS INT))) [value], idc
FROM	#cox
WHERE	[name] = 'currentdb'

SELECT @SqlStatement = ''
DECLARE @Cols NVARCHAR(MAX) = ''
SELECT @Cols = STUFF((
SELECT ', ' + QUOTENAME(LTRIM(spid) + '.' + LTRIM(ISNULL(ecid,0)) + '.' + LTRIM(id))
FROM #cox cox
WHERE NULLIF(cox.name, '') IS NOT NULL
GROUP BY spid, ecid, id, waittime 
ORDER BY waittime DESC
FOR XML PATH(N''), TYPE
).value('.', 'NVARCHAR(MAX)'), 1, 2, '')

DECLARE @Cols2 NVARCHAR(MAX) = ''
SELECT @Cols2 = STUFF((
SELECT ', rez.' + QUOTENAME(LTRIM(spid) + '.' + LTRIM(ISNULL(ecid,0)) + '.' + LTRIM(id)  + '.plan') + ' = srce.' + QUOTENAME(LTRIM(spid) + '.' + LTRIM(ISNULL(ecid,0)) + '.' + LTRIM(id))
FROM #cox cox
WHERE NULLIF(cox.name, '') IS NOT NULL
GROUP BY spid, ecid, id, waittime
ORDER BY waittime DESC
FOR XML PATH(N''), TYPE
).value('.', 'NVARCHAR(MAX)'), 1, 2, '')

SELECT @SqlStatement = N'
SELECT *
FROM (
	SELECT id,  [name] session_attribute, descr, [value]
	FROM (
		SELECT (LTRIM(spid) + ''.'' + LTRIM(ISNULL(ecid,0)) + ''.'' + LTRIM(id)) id,  [name], [value]
		FROM #cox cox
		UNION
		SELECT s.idc, ''deadlockvictim'' [name], ''1'' [value]
		FROM (
			SELECT vict.Nod.value(''(@victim)[1]'', ''sysname'')
			FROM @xdl.nodes(''deadlock'') vict(Nod)
			UNION
			SELECT vict.Nod.value(''(@id)[1]'', ''sysname'')
			FROM @xdl.nodes(''deadlock/victim-list/victimProcess'') vict(Nod)
		) vict(id)
		JOIN (
			SELECT id, idc
			FROM #cox
			GROUP BY id, idc
		) s(id, idc) ON vict.id = s.id
	) cox
	LEFT JOIN (VALUES
		(''logused'', ''Log space used by the task.''),
		(''owner id '', ''The ID of the transaction that has control of the request.''),
		(''status'', '' State of the task. It is one of the following values:
		pending. Waiting for a worker thread.
		runnable. Ready to run but waiting for a quantum.
		running. Currently running on the scheduler.
		suspended. Execution is suspended.
		done. Task has completed.
		spinloop. Waiting for a spinlock to become free.''),
		(''waitresource '', ''The resource needed by the task.''),
		(''waittime'', ''Time in milliseconds waiting for the resource.''),
		(''schedulerid'', ''Scheduler associated with this task. See sys.dm_os_schedulers (Transact-SQL).''),
		(''hostname'', ''The name of the workstation.''),
		(''isolationlevel'', ''The current transaction isolation level.''),
		(''Xactid'', ''The ID of the transaction that has control of the request.''),
		(''currentdb'', ''The ID of the database.''),
		(''lastbatchstarted'', ''The last time a client process started batch execution.''),
		(''lastbatchcompleted'', ''The last time a client process completed batch execution.''),
		(''associatedObjectId'', ''Represents the HoBT (heap or b-tree) ID.''),
		(''clientapp'', ''The client application that created the process''),
		(''currentdb_actual'', ''DB_NAME(BD_ID())''),
		(''currentdbname'', ''DB_NAME(currentdb)''),
		(''deadlockvictim'', ''Is deadlock victim for Deadlock Graph events''),
		(''ecid'', ''This is the execution context when the process is executed in parallel. If not executed in parallel this value will be 0.''),
		(''hostpid'', ''The process ID of the client application''),
		(''id'', ''The process id of the specific process''),
		(''kpid'', ''The Windows thread ID''),
		(''lastattention'', ''The timestamp of the processing of the last attention event such as a timeout or a cancellation on the thread involved in the deadlock.''),
		(''lockMode'', ''The type of lock the process wants to take''),
		(''lockTimeout'', ''The maximum time a process can wait for a lock to be released''),
		(''loginname'', ''Name of the logged in user''),
		(''priority'', ''The same as the deadlock task priority''),
		(''sbid'', ''The batch ID''),
		(''spid'', ''The SQL Process ID''),
		(''trancount'', ''The number of transactions involved in the deadlock''),
		(''transactionname'', ''The name of the transaction or the transaction type: I.e. user_transaction''),
		(''XDES'', ''Transaction description structures''),	
		(''lasttranstarted'', ''The date time the last transaction started''),
		(''clientoption1'', ''These are SET options such as QUOTED_IDENTIFIER or ANSI_NULLS''),
		(''clientoption2'', ''More settings''),
		(''ownerId'', ''This displays the transaction id of the transaction which owns the process. This value corresponds to the request_owner_id field in the sys.dm_tran_locks DMV.'')
	) dsc(session_atrib, descr) ON dsc.session_atrib = [name]
) src
PIVOT( MAX([value]) FOR id IN (' + @Cols + ') ) pvot'
EXEC sp_executesql @SqlStatement, N'@xdl XML', @xdl

SELECT @SqlStatement = N'
CREATE TABLE #rez (' + '[name] INT, ' + REPLACE(@Cols, N']', N'] XML NULL') + N')

INSERT INTO #rez
SELECT *
FROM (
SELECT 0 name,
(LTRIM(spid.Nod.value(''(@spid)[1]'', ''int'')) + ''.'' + LTRIM(ISNULL(spid.Nod.value(''(@ecid)[1]'', ''int''),0)) + ''.'' + LTRIM(spid.Nod.value(''(@id)[1]'', ''sysname''))) id,
ipbuff.Nod.value(''.'', ''NVARCHAR(MAX)'') ipbuffer
FROM @xdl.nodes(''deadlock/process-list/process'') spid(Nod)
CROSS APPLY spid.Nod.nodes(''inputbuf'') ipbuff(Nod)
) cox
PIVOT( MAX(ipbuffer) FOR id IN (' + @Cols + N') ) pvot
UNION ALL
SELECT *
FROM (
SELECT id, descr, ''procname='' + procname + CHAR(13)+CHAR(10) + ISNULL(''line='' + LTRIM(line)+CHAR(13)+CHAR(10), '''') + ''text='' + CHAR(13) + CHAR(10) + query query
FROM (
SELECT ''executionStack'' name, LTRIM(spid.Nod.value(''(@spid)[1]'', ''int'')) + ''.'' + LTRIM(ISNULL(spid.Nod.value(''(@ecid)[1]'', ''int''),0)) + ''.'' + LTRIM(spid.Nod.value(''(@id)[1]'', ''sysname'')) id,
obct.procname,
excstfram.Nod.value(''(@line)[1]'', ''INT'') line,
excstfram.Nod.value(''(@stmtstart)[1]'', ''INT'') stmtstart,
excstfram.Nod.value(''(@stmtend)[1]'', ''INT'') stmtend,
NULLIF(CONVERT(VARCHAR(64), excstfram.Nod.value(''(@sqlhandle)[1]'', ''VARCHAR(500)'')), 0x00000000000000000000000000000000000000000000000000000000000000) sqlhandle,
excstfram.Nod.value(''.'', ''NVARCHAR(MAX)'') query,
descr = ROW_NUMBER() OVER(PARTITION BY spid.Nod.value(''(@id)[1]'', ''sysname'') ORDER BY excstfram.Nod DESC)
FROM @xdl.nodes(''deadlock/process-list/process'') spid(Nod)
CROSS APPLY spid.Nod.nodes(''executionStack/frame'') excstfram(Nod)
CROSS APPLY ( 
	SELECT ISNULL(QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),3)) + ''.'','''') 
		+ ISNULL(QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),2)) + ''.'', '''')
		+ QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),1)) 
) obct(procname)
) s
) cox
PIVOT( MAX(query) FOR id IN (' + @Cols + N') ) pvot

IF @Action IN (1,2)
BEGIN
	ALTER TABLE #rez ADD ' + REPLACE(@Cols, N']', N'.plan] XML') + N'

	UPDATE rez
	SET ' + @Cols2 + '
	FROM #rez rez
	JOIN (
	SELECT descr, ' + @Cols + '
	FROM (
	SELECT s.id, s.descr, CONVERT(NVARCHAR(MAX), CASE WHEN @SrceDB = 0 THEN ISNULL(ex11.query_plan, ex12.query_plan) ELSE ex2.query_plan END) [plan]
	FROM (
	SELECT LTRIM(spid.Nod.value(''(@spid)[1]'', ''int'')) + ''.'' + LTRIM(ISNULL(spid.Nod.value(''(@ecid)[1]'', ''int''),0)) + ''.'' + LTRIM(spid.Nod.value(''(@id)[1]'', ''sysname'')) id,
	obct.procname,
	NULLIF(CONVERT(VARBINARY(64), excstfram.Nod.value(''(@sqlhandle)[1]'', ''VARCHAR(500)''), 1), 0x00000000000000000000000000000000000000000000000000000000000000) sqlhandle,
	descr = ROW_NUMBER() OVER(PARTITION BY spid.Nod.value(''(@id)[1]'', ''sysname'') ORDER BY excstfram.Nod DESC)
	FROM @xdl.nodes(''deadlock/process-list/process'') spid(Nod)
	CROSS APPLY spid.Nod.nodes(''executionStack/frame'') excstfram(Nod)
	CROSS APPLY ( 
		SELECT ISNULL(QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),3)) + ''.'','''') 
			+ ISNULL(QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),2)) + ''.'', '''')
			+ QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),1)) 
	) obct(procname)
	) s
	OUTER APPLY (
		SELECT	TOP(1) pl.query_plan
		FROM	sys.dm_exec_query_stats qsts CROSS APPLY sys.dm_exec_query_plan(qsts.plan_handle) pl
		WHERE	qsts.sql_handle = s.sqlhandle
		AND		@SrceDB = 0 --Db From Deadlock Graph
	) ex11
	OUTER APPLY (
		SELECT	TOP(1) pl.query_plan
		FROM	sys.dm_exec_procedure_stats prod
		CROSS APPLY sys.dm_exec_query_plan(prod.plan_handle) pl
		WHERE	prod.database_id = DB_ID(PARSENAME(s.procname, 3))
		AND		prod.object_id = OBJECT_ID(s.procname)
		AND		ex11.query_plan IS NULL
		AND		@SrceDB = 0 --Db From Deadlock Graph
	) ex12
	OUTER APPLY (
		SELECT	TOP(1)  pl.query_plan
		FROM	sys.dm_exec_procedure_stats prod
		CROSS APPLY sys.dm_exec_query_plan(prod.plan_handle) pl
		WHERE	prod.database_id = DB_ID()
		AND		prod.object_id = OBJECT_ID(QUOTENAME(DB_NAME()) + ''.'' + QUOTENAME(PARSENAME(s.procname, 2)) + ''.'' + QUOTENAME(PARSENAME(s.procname, 1)))
		AND		@SrceDB = 1 --Current Database
	) ex2
	WHERE s.sqlhandle IS NOT NULL
	) pio
	PIVOT( MAX([plan] ) FOR [id] IN (' + @Cols + ')) pto
	) srce ON rez.[name] = srce.descr

	IF @Action = 2
	BEGIN
		ALTER TABLE #rez ADD ' + REPLACE(@Cols, N']', N'.resc] XML NULL') + N'

		IF OBJECT_ID(''tempdb..#resc'') IS NOT NULL
		BEGIN
		DROP TABLE #resc
		END
		SELECT QUOTENAME(ROW_NUMBER() OVER(ORDER BY resc.Nod)) + '' '' + resc.Nod.value(''local-name(.)'', ''SYSNAME'') +  ISNULL('' '' + QUOTENAME(''objectname='' + obct.objectname +ISNULL('', indexname=''+resc.Nod.value(''(@indexname)[1]'', ''SYSNAME''),''''), '')''), '''') resc,
		obct.objectname,
		eon.Nod.value(''(@id)[1]'', ''sysname'') id_own, ISNULL(eon.Nod.value(''(@mode)[1]'', ''sysname'') + '' own'', ''own'') lock_own,
		wai.Nod.value(''(@id)[1]'', ''sysname'') id_wai, ISNULL(wai.Nod.value(''(@mode)[1]'', ''sysname'') + '' wait'', ''wait'') + ISNULL('' '' + NULLIF(QUOTENAME(wai.Nod.value(''(@requestType)[1]'', ''sysname''), '')''), ''(wait)''), '''') lock_wai
		INTO #resc
		FROM @xdl.nodes(''deadlock/resource-list/*'')  resc(Nod)
		OUTER APPLY resc.Nod.nodes(''owner-list/owner'') eon(Nod)
		OUTER APPLY resc.Nod.nodes(''waiter-list/waiter'') wai(Nod)
		OUTER APPLY (SELECT resc.Nod.value(''(@objectname)[1]'', ''SYSNAME'')) obc(initial_name)
		CROSS APPLY ( 
			SELECT ISNULL(QUOTENAME(PARSENAME(obc.initial_name,3)) + ''.'','''') 
				+ ISNULL(QUOTENAME(PARSENAME(obc.initial_name,2)) + ''.'', '''')
				+ QUOTENAME(PARSENAME(obc.initial_name,1)) 
		) obct(objectname)

		IF OBJECT_ID(''tempdb..#ExchangeEvent'') IS NOT NULL
		BEGIN
			DROP TABLE #ExchangeEvent
		END

		SELECT	*
		INTO	#ExchangeEvent
		FROM (
			SELECT	resc.resc, wait.objectname, wait.id_own, wait.lock_own, wait.id_wai, wait.lock_wai
			FROM	#resc resc
			JOIN	#resc wait ON resc.id_wai IN (wait.id_own, wait.id_wai)
			AND		resc.resc <> wait.resc
			WHERE	resc.resc LIKE ''[[[]%][ ]exchangeEvent%''
			AND		resc.objectname IS NULL
			AND		wait.objectname IS NOT NULL
			UNION
			SELECT	resc.resc, own.objectname, own.id_own, own.lock_own, own.id_wai, own.lock_wai
			FROM	#resc resc
			JOIN	#resc own ON resc.id_own IN (own.id_own, own.id_wai)
			AND		resc.resc <> own.resc
			WHERE	resc.resc LIKE ''[[[]%][ ]exchangeEvent%''
			AND		resc.objectname IS NULL
			AND		own.objectname IS NOT NULL
		) s

		INSERT	#resc (resc, objectname, id_own, lock_own, id_wai, lock_wai)
		SELECT	resc.resc, resc.objectname, resc.id_own, resc.lock_own, resc.id_wai, resc.lock_wai
		FROM	#ExchangeEvent resc

		IF OBJECT_ID(''tempdb..#descr_locks'') IS NOT NULL
		BEGIN
		DROP TABLE #descr_locks
		END

		SELECT srce.id, srce.[name], resc.resc, resc.value, crss.objectname, crss.QueryStatementId, crss.QueryStatement, crss.QueryText, crss.PhysicalOp, crss.RelEstimateRows, crss.TotalSubtreeCost
		INTO #descr_locks
		FROM (
			SELECT s.id, s.[name], CASE WHEN @SrceDB=0 THEN ISNULL(ex11.query_plan, ex12.query_plan) ELSE /*@SrceDB=1*/ ex2.query_plan END [plan]
			FROM (
				SELECT LTRIM(spid.Nod.value(''(@spid)[1]'', ''int'')) + ''.'' + LTRIM(ISNULL(spid.Nod.value(''(@ecid)[1]'', ''int''),0)) + ''.'' + LTRIM(spid.Nod.value(''(@id)[1]'', ''sysname'')) id,
				obct.procname,
				NULLIF(CONVERT(VARBINARY(64), excstfram.Nod.value(''(@sqlhandle)[1]'', ''VARCHAR(500)''), 1), 0x00000000000000000000000000000000000000000000000000000000000000) sqlhandle,
				[name] = ROW_NUMBER() OVER(PARTITION BY spid.Nod.value(''(@id)[1]'', ''sysname'') ORDER BY excstfram.Nod DESC)
				FROM @xdl.nodes(''deadlock/process-list/process'') spid(Nod)
				CROSS APPLY spid.Nod.nodes(''executionStack/frame'') excstfram(Nod)
				CROSS APPLY ( 
					SELECT ISNULL(QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),3)) + ''.'','''') 
						+ ISNULL(QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),2)) + ''.'', '''')
						+ QUOTENAME(PARSENAME(excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME''),1)) 
				) obct(procname)
			) s
			OUTER APPLY (
				SELECT	TOP(1) pl.query_plan
				FROM	sys.dm_exec_query_stats qsts CROSS APPLY sys.dm_exec_query_plan(qsts.plan_handle) pl
				WHERE	qsts.sql_handle = s.sqlhandle
				AND		@SrceDB = 0 --Db From Deadlock Graph
			) ex11
			OUTER APPLY (
				SELECT	TOP(1) pl.query_plan
				FROM	sys.dm_exec_procedure_stats prod
				CROSS APPLY sys.dm_exec_query_plan(prod.plan_handle) pl
				WHERE	prod.database_id = DB_ID(PARSENAME(s.procname, 3))
				AND		prod.object_id = OBJECT_ID(s.procname)
				AND		ex11.query_plan IS NULL
				AND		@SrceDB = 0 --Db From Deadlock Graph
			) ex12
			OUTER APPLY (
				SELECT	TOP(1)  pl.query_plan
				FROM	sys.dm_exec_procedure_stats prod
				CROSS APPLY sys.dm_exec_query_plan(prod.plan_handle) pl
				WHERE	prod.database_id = DB_ID()
				AND		prod.object_id = OBJECT_ID(QUOTENAME(DB_NAME()) + ''.'' + QUOTENAME(PARSENAME(s.procname, 2)) + ''.'' + QUOTENAME(PARSENAME(s.procname, 1)))
				AND		@SrceDB = 1 --Current Database
			) ex2
			WHERE s.sqlhandle IS NOT NULL
			) srce OUTER APPLY (
				SELECT
					objectname = ISNULL((ISNULL(Opt.value(''(.//*:Object/@*:Database)[1]'', ''SYSNAME''), '''')) + ''.'', '''') + ISNULL((ISNULL(Opt.value(''(.//*:Object/@*:Schema)[1]'', ''SYSNAME''), '''')) + ''.'','''') + (ISNULL(Opt.value(''(.//*:Object/@*:Table)[1]'', ''SYSNAME''), '''')),
					QueryStatementId = qstmt.Nod.value(''(@*:StatementId)[1]'', ''INT''),
					QueryStatement = qstmt.Nod.value(''local-name(.)'', ''SYSNAME''),
					QueryText = qstmt.Nod.value(''(@*:StatementText)[1]'', ''NVARCHAR(MAX)''),  
					PhysicalOp = Opt.value(''(*:RelOp/@PhysicalOp)[1]'', ''SYSNAME''),
					Obct = ISNULL(Opt.value(''(.//*:Object/@*:Database)[1]'', ''SYSNAME''), '''') + ''.'' + ISNULL(Opt.value(''(.//*:Object/@*:Schema)[1]'', ''SYSNAME''), '''') + ''.'' + ISNULL(Opt.value(''(.//*:Object/@*:Table)[1]'', ''SYSNAME''), '''') + ISNULL(''('' + Opt.value(''(.//*:Object/@*:Index)[1]'', ''SYSNAME'') + '')'', ''''),
					RelEstimateRows = Opt.value(''(*:RelOp/@EstimateRows)[1]'', ''BIGINT''), TotalSubtreeCost = Opt.value(''(*:RelOp/@EstimatedTotalSubtreeCost)[1]'', ''REAL''),
					Parallel = Opt.value(''(*:RelOp/@Parallel)[1]'', ''TINYINT'')
				FROM srce.[plan].nodes(''//*[local-name() = ("StmtCond", "StmtSimple", "StmtCursor", "StmtReceive", "StmtUseDb")]'') qstmt(Nod)
				OUTER APPLY (SELECT  qstmt.Nod.query(''.//*:Object/../..'')) obct(Opt)
			) crss LEFT JOIN (
				SELECT resc.resc, objectname, cox.idc, resc.lock_own [value] FROM #resc resc JOIN (SELECT id, idc FROM #cox GROUP BY id, idc) cox ON resc.id_own = cox.id
				UNION
				SELECT resc.resc, objectname, cox.idc, resc.lock_wai [value] FROM #resc resc JOIN (SELECT id, idc FROM #cox GROUP BY id, idc) cox ON resc.id_wai = cox.id
		) resc ON srce.id = resc.idc AND crss.objectname = resc.objectname
		WHERE srce.[plan] IS NOT NULL

		UPDATE rez
		SET ' + REPLACE(@Cols2, '.plan', '.resc') + N'
		FROM #rez rez
		JOIN (
		SELECT *
		FROM (
			SELECT	id, [name], cro.txt
			FROM (
				SELECT id, [name]
				FROM #descr_locks d
				GROUP BY id, [name]
			) s 
			CROSS APPLY (
				SELECT resc, [value], objectname, QueryStatementId, QueryStatement, QueryText, PhysicalOp, RelEstimateRows, TotalSubtreeCost 
				FROM #descr_locks dc
				WHERE dc.id = s.id 
				AND dc.[name] = s.[name]
				FOR XML PATH(''lock''), 
				ELEMENTS
			) cro(txt)
		) s
		PIVOT( MAX(s.txt) FOR s.id IN (' + @Cols + ') ) pto
		) srce ON rez.[name] = srce.[name]

	IF OBJECT_ID(''tempdb..##abcde'') IS NOT NULL
	BEGIN
		DROP TABLE ##abcde
	END

	CREATE TABLE ##abcde (resc sysname NULL, ' + REPLACE(@Cols, ']', '.resc] XML NULL') + ')

	INSERT ##abcde
	SELECT *
	FROM (
		SELECT	id, resc, cro.txt
		FROM (
			SELECT id, resc
			FROM #descr_locks d
			GROUP BY id, resc
		) s 
		CROSS APPLY (
			SELECT [name], [value], objectname, QueryStatementId, QueryStatement, QueryText, PhysicalOp, RelEstimateRows, TotalSubtreeCost 
			FROM #descr_locks dc
			WHERE dc.id = s.id 
			AND dc.resc = s.resc
			FOR XML PATH(''lock''), 
			ELEMENTS
		) cro(txt)
	) s
	PIVOT( MAX(s.txt) FOR s.id IN (' + @Cols + ') ) pto
	END
END

SELECT * FROM #rez ORDER BY [name]'
EXEC sp_executesql @SqlStatement, N'@xdl XML, @SrceDB TINYINT, @Action TINYINT', @xdl, @SrceDB, @Action

IF OBJECT_ID('tempdb..#resc') IS NOT NULL
BEGIN
DROP TABLE #resc
END

SELECT QUOTENAME(ROW_NUMBER() OVER(ORDER BY resc.Nod)) + ' ' + resc.Nod.value('local-name(.)', 'SYSNAME') +  ISNULL(' ' + QUOTENAME('objectname=' + obct.objectname +ISNULL(', indexname=' + QUOTENAME(resc.Nod.value('(@indexname)[1]', 'SYSNAME')) ,''), ')') , '') + ISNULL(' ' + QUOTENAME(ISNULL(resc.Nod.value('(@wrc)[1]', 'VARCHAR(444)'), '') + ISNULL(' ,dbid=' + resc.Nod.value('(@dbid)[1]', 'VARCHAR(12)'), '') + ISNULL(' ,file_id=' + resc.Nod.value('(@file_id)[1]', 'VARCHAR(12)') , '') + ISNULL(' ,page_id=' + resc.Nod.value('(@page_id)[1]', 'VARCHAR(12)') , '') + ISNULL(' ,slot_page=' + resc.Nod.value('(@slot_page)[1]', 'VARCHAR(12)') , '') + ISNULL(' ,hobt_id=' + resc.Nod.value('(@hobt_id)[1]', 'VARCHAR(12)') , '') + ISNULL(' ,index_id=' + resc.Nod.value('(@index_id)[1]', 'VARCHAR(12)') , '')), '') resc,
obct.objectname,
eon.Nod.value('(@id)[1]', 'sysname') id_own, ISNULL(eon.Nod.value('(@mode)[1]', 'sysname') + ' own', 'own') lock_own,
wai.Nod.value('(@id)[1]', 'sysname') id_wai, ISNULL(wai.Nod.value('(@mode)[1]', 'sysname') + ' wait', 'wait') + ISNULL(' ' + NULLIF(QUOTENAME(wai.Nod.value('(@requestType)[1]', 'sysname'), ')'), '(wait)'), '') lock_wai
INTO #resc
FROM @xdl.nodes('deadlock/resource-list/*')  resc(Nod)
OUTER APPLY resc.Nod.nodes('owner-list/owner') eon(Nod)
OUTER APPLY resc.Nod.nodes('waiter-list/waiter') wai(Nod)
CROSS APPLY ( 
	SELECT ISNULL(QUOTENAME(PARSENAME(resc.Nod.value('(@objectname)[1]', 'SYSNAME'),3)) + '.','') 
		+ ISNULL(QUOTENAME(PARSENAME(resc.Nod.value('(@objectname)[1]', 'SYSNAME'),2)) + '.', '')
		+ QUOTENAME(PARSENAME(resc.Nod.value('(@objectname)[1]', 'SYSNAME'),1)) 
) obct(objectname)

SELECT @SqlStatement = N'
SELECT pvot.*' + CASE WHEN @Action = 2 THEN '' ELSE '--' END + ',' + REPLACE(@Cols, ']', '.resc]') + '
FROM (
SELECT resc.resc, cox.idc, resc.lock_own [value] FROM #resc resc JOIN (SELECT id, idc FROM #cox GROUP BY id, idc) cox ON resc.id_own = cox.id
UNION
SELECT resc.resc, cox.idc, resc.lock_wai [value] FROM #resc resc JOIN (SELECT id, idc FROM #cox GROUP BY id, idc) cox ON resc.id_wai = cox.id
) cox
PIVOT( MAX([value]) FOR idc IN (' + @Cols + ') ) pvot 
' + CASE WHEN @Action = 2 THEN '' ELSE '--' END + ' LEFT JOIN ##abcde cc ON pvot.resc = cc.resc'
EXEC sp_executesql @SqlStatement
