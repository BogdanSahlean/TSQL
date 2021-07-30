SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[XdlAnalysis]
@SrceType	INT, --1 Xdl, 2=SQL Profiler Table

@SrceDesc	VARCHAR(MAX),
@SrceID		INT
AS
DECLARE @SrceXml XML
DECLARE @SqlStatement NVARCHAR(MAX) 
IF @SrceType = 2 /*SQL Profiler Table*/ AND @SrceID IS NULL 
BEGIN
	SELECT @SqlStatement = 
'SELECT	qprofiler.RowNumber, CONVERT(XML, qprofiler.TextData) TextDataX, qprofiler.StartTime
FROM	' + @SrceDesc + ' qprofiler
WHERE	qprofiler.EventClass = (SELECT etns.trace_event_id FROM sys.trace_events etns WHERE	etns.name = ''Deadlock graph'')'
	EXECUTE sp_executesql @SqlStatement
END
ELSE IF @SrceType = 2 /*SQL Profiler Table*/ AND @SrceID IS NOT NULL 
BEGIN
	SELECT @SqlStatement = 
'SELECT	@SrceXml = CONVERT(XML, qprofiler.TextData)
FROM	' + @SrceDesc + ' qprofiler
WHERE	qprofiler.EventClass = (SELECT etns.trace_event_id FROM sys.trace_events etns WHERE	etns.name = ''Deadlock graph'')
AND qprofiler.RowNumber = @SrceID'   
	EXECUTE sp_executesql @SqlStatement, N'@SrceID INT, @SrceXml XML OUTPUT', @SrceID = @SrceID, @SrceXml = @SrceXml OUTPUT
END  
   
DECLARE @xdl NVARCHAR(MAX) = CASE WHEN @SrceXml IS NOT NULL THEN CONVERT(VARCHAR(MAX), @SrceXml) ELSE @SrceDesc END                  
DECLARE @dl XML = CONVERT(XML, @xdl)
   
IF OBJECT_ID('tempdb..#cox') IS NOT NULL                           4
BEGIN
DROP TABLE #cox
END
SELECT s.*, name = i.Nod.value('(@name)', 'sysname'), value = i.Nod.value('(text())[1]', 'varchar(8000)'), LTRIM(spid) + '.' + LTRIM(ISNULL(ecid,0)) + '.' + LTRIM(id) as idc
INTO #cox
FROM (
SELECT spid.Nod.value('(@spid)[1]', 'int') spid, spid.Nod.value('(@ecid)[1]', 'int') ecid, spid.Nod.value('(@id)[1]', 'sysname') id, spid.Nod.query('for $i in ./@* return <i name="{local-name($i)}">{string($i)}</i>') cox
FROM @dl.nodes('deadlock-list/deadlock/process-list/process') spid(Nod)
) s CROSS APPLY s.cox.nodes('i') i(Nod)
                                                                                                              
SELECT @SqlStatement = ''
DECLARE @Cols NVARCHAR(MAX) = ''
SELECT @Cols = STUFF((                                         
SELECT ', ' + QUOTENAME(LTRIM(spid) + '.' + LTRIM(ISNULL(ecid,0)) + '.' + LTRIM(id))
FROM #cox cox
WHERE NULLIF(cox.name, '') IS NOT NULL   
GROUP BY spid, ecid, id                                                                                                                 
ORDER BY 1   
FOR XML PATH(N''), TYPE
).value('.', 'NVARCHAR(MAX)'), 1, 2, '')

SELECT @SqlStatement = N'      
SELECT *
FROM (                        
SELECT (LTRIM(spid) + ''.'' + LTRIM(ISNULL(ecid,0)) + ''.'' + LTRIM(id)) id,  [name], [value]
FROM #cox cox
UNION
SELECT s.idc, ''deadlockvictim'' [name], ''1'' [value]
FROM (      
SELECT vict.Nod.value(''(@victim)[1]'', ''sysname'')
FROM @dl.nodes(''deadlock-list/deadlock'') vict(Nod)   
) vict(id)
JOIN (
SELECT id, idc
FROM #cox
GROUP BY id, idc
) s(id, idc) ON vict.id = s.id
) cox
PIVOT( MAX([value]) FOR id IN (' + @Cols + ') ) pvot'   
EXEC sp_executesql @SqlStatement, N'@dl XML', @dl

SELECT @SqlStatement = N'   
CREATE TABLE #rez (' + '[name] INT, ' + REPLACE(@Cols, ']', '] XML') + ')

INSERT INTO #rez
SELECT *
FROM (
SELECT 0 name,
(LTRIM(spid.Nod.value(''(@spid)[1]'', ''int'')) + ''.'' + LTRIM(ISNULL(spid.Nod.value(''(@ecid)[1]'', ''int''),0)) + ''.'' + LTRIM(spid.Nod.value(''(@id)[1]'', ''sysname''))) id,
ipbuff.Nod.value(''.'', ''NVARCHAR(MAX)'') ipbuffer
FROM @dl.nodes(''deadlock-list/deadlock/process-list/process'') spid(Nod)
CROSS APPLY spid.Nod.nodes(''inputbuf'') ipbuff(Nod)
) cox
PIVOT( MAX(ipbuffer) FOR id IN (' + @Cols + ') ) pvot
UNION ALL
SELECT *      
FROM (
SELECT id, descr, ''procname='' + procname + CHAR(13)+CHAR(10) + ISNULL(''line='' + LTRIM(line)+CHAR(13)+CHAR(10), '''') + ''text='' + CHAR(13) + CHAR(10) + query query
FROM (
SELECT ''executionStack'' name, LTRIM(spid.Nod.value(''(@spid)[1]'', ''int'')) + ''.'' + LTRIM(ISNULL(spid.Nod.value(''(@ecid)[1]'', ''int''),0)) + ''.'' + LTRIM(spid.Nod.value(''(@id)[1]'', ''sysname'')) id,   
excstfram.Nod.value(''(@procname)[1]'', ''SYSNAME'') procname,
excstfram.Nod.value(''(@line)[1]'', ''INT'') line,
excstfram.Nod.value(''(@stmtstart)[1]'', ''INT'') stmtstart,
excstfram.Nod.value(''(@stmtend)[1]'', ''INT'') stmtend,
NULLIF(CONVERT(VARCHAR(64), excstfram.Nod.value(''(@sqlhandle)[1]'', ''VARCHAR(500)'')), 0x00000000000000000000000000000000000000000000000000000000000000) sqlhandle,
excstfram.Nod.value(''.'', ''NVARCHAR(MAX)'') query,
descr = ROW_NUMBER() OVER(PARTITION BY spid.Nod.value(''(@id)[1]'', ''sysname'') ORDER BY excstfram.Nod DESC)
FROM @dl.nodes(''deadlock-list/deadlock/process-list/process'') spid(Nod)
CROSS APPLY spid.Nod.nodes(''executionStack/frame'') excstfram(Nod)
) s
) cox
PIVOT( MAX(query) FOR id IN (' + @Cols + ') ) pvot

SELECT * FROM #rez ORDER BY [name]'
EXEC sp_executesql @SqlStatement, N'@dl XML', @dl

IF OBJECT_ID('tempdb..#resc') IS NOT NULL
BEGIN
DROP TABLE #resc
END   

SELECT QUOTENAME(ROW_NUMBER() OVER(ORDER BY resc.Nod)) + ' ' + resc.Nod.value('local-name(.)', 'SYSNAME') +  ISNULL(' ' + QUOTENAME('objectname='+resc.Nod.value('(@objectname)[1]', 'SYSNAME') +ISNULL(', indexname='+resc.Nod.value('(@indexname)[1]', 'SYSNAME'),''), ')'), '') resc,   
eon.Nod.value('(@id)[1]', 'sysname') id_own, eon.Nod.value('(@mode)[1]', 'sysname') lock_own,
wai.Nod.value('(@id)[1]', 'sysname') id_wai, wai.Nod.value('(@mode)[1]', 'sysname') + ISNULL(' ' + QUOTENAME(wai.Nod.value('(@requestType)[1]', 'sysname'), ')'), '') lock_wai
INTO #resc
FROM @dl.nodes('deadlock-list/deadlock/resource-list/*')  resc(Nod)
OUTER APPLY resc.Nod.nodes('owner-list/owner') eon(Nod)
OUTER APPLY resc.Nod.nodes('waiter-list/waiter') wai(Nod)

SELECT @SqlStatement = N'
SELECT *   
FROM (
SELECT resc.resc, cox.idc, resc.lock_own [value] FROM #resc resc JOIN (SELECT id, idc FROM #cox GROUP BY id, idc) cox ON resc.id_own = cox.id      
UNION
SELECT resc.resc, cox.idc, resc.lock_wai [value] FROM #resc resc JOIN (SELECT id, idc FROM #cox GROUP BY id, idc) cox ON resc.id_wai = cox.id
) cox
PIVOT( MAX([value]) FOR idc IN (' + @Cols + ') ) pvot'
EXEC sp_executesql @SqlStatement
