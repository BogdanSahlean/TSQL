SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF

GO

   
CREATE PROCEDURE ActualPlan
@plan XML
AS
IF OBJECT_ID('tempdb..#sttx') IS NOT NULL
BEGIN   
	DROP TABLE #sttx
END

;WITH Recursion
AS (
	SELECT	
		Nod					= CONCAT('/', CONVERT(NVARCHAR(MAX), LTRIM(DENSE_RANK() OVER(ORDER BY stmbtchstmsx.Nod))), '/'), 
		NodXml				= stmbtchstmsx.Nod.query('.'), 
		QueryXType			= stmbtchstmsx.Nod.value('local-name(.)', 'VARCHAR(40)'), 
		Num					= stmbtchstmsx.Nod.value('(@StatementId)[1]', 'INT'),
		QueryCost			= stmbtchstmsx.Nod.value('(@StatementSubTreeCost)[1]', 'DECIMAL(9,4)'),
		QuerySttxCpuTime	= stmbtchstmsx.Nod.value('(*:QueryPlan/*:QueryTimeStats/@CpuTime)[1]', 'INT'), 
		QuerySttxElapsedTime= stmbtchstmsx.Nod.value('(*:QueryPlan/*:QueryTimeStats/@ElapsedTime)[1]', 'INT'), 
		PlanDop				= stmbtchstmsx.Nod.value('(*:QueryPlan/@DegreeOfParallelism)[1]', 'INT'), 
		QueryText			= (SELECT stmbtchstmsx.Nod.value('(@StatementText)[1]', 'NVARCHAR(MAX)') '*' FOR XML PATH(N''), TYPE) ,
		QueryXType2			= stmbtchstmsx.Nod.value('(@StatementType)[1]', 'NVARCHAR(40)')
	FROM	@plan.nodes('*:ShowPlanXML/*:BatchSequence/*:Batch') stmbtch(Nod)
	CROSS APPLY stmbtch.Nod.nodes('*:Statements') stmbtchstms(Nod)
	CROSS APPLY stmbtchstms.Nod.nodes('*') stmbtchstmsx(Nod)

	UNION ALL   

	SELECT
		Nod					= CONCAT(rec.Nod, '-1/', DENSE_RANK() OVER(ORDER BY stmbtchstmsx.Nod), '/') , 
		NodXml				= stmbtchstmsx.Nod.query('.'), 
		QueryXType			= stmbtchstmsx.Nod.value('local-name(.)', 'VARCHAR(40)'), 
		Num					= stmbtchstmsx.Nod.value('(@StatementId)[1]', 'INT'),
		QueryCost			= stmbtchstmsx.Nod.value('(@StatementSubTreeCost)[1]', 'DECIMAL(9,4)'),
		QuerySttxCpuTime	= stmbtchstmsx.Nod.value('(*:QueryPlan/*:QueryTimeStats/@CpuTime)[1]', 'INT'), 
		QuerySttxElapsedTime= stmbtchstmsx.Nod.value('(*:QueryPlan/*:QueryTimeStats/@ElapsedTime)[1]', 'INT'), 
		PlanDop				= stmbtchstmsx.Nod.value('(*:QueryPlan/@DegreeOfParallelism)[1]', 'INT'),       
		QueryText			= (SELECT stmbtchstmsx.Nod.value('(@StatementText)[1]', 'NVARCHAR(MAX)') '*' FOR XML PATH(N''), TYPE) ,
		QueryXType2			= stmbtchstmsx.Nod.value('(@StatementType)[1]', 'NVARCHAR(40)')
	FROM	Recursion rec
	CROSS APPLY rec.NodXml.nodes('*:StmtCond/*:Then/*:Statements') stmbtchstms(Nod)
	CROSS APPLY stmbtchstms.Nod.nodes('*') stmbtchstmsx(Nod)
	WHERE	rec.QueryXType = 'StmtCond'
         
	UNION ALL

	SELECT	
		Nod					= CONCAT(rec.Nod, '-2/', DENSE_RANK() OVER(ORDER BY stmbtchstmsx.Nod), '/') , 
		NodXml				= stmbtchstmsx.Nod.query('.'), 
		QueryXType			= stmbtchstmsx.Nod.value('local-name(.)', 'VARCHAR(40)'), 
		Num					= stmbtchstmsx.Nod.value('(@StatementId)[1]', 'INT'),
		QueryCost			= stmbtchstmsx.Nod.value('(@StatementSubTreeCost)[1]', 'DECIMAL(9,4)'),
		QuerySttxCpuTime	= stmbtchstmsx.Nod.value('(*:QueryPlan/*:QueryTimeStats/@CpuTime)[1]', 'INT'), 
		QuerySttxElapsedTime= stmbtchstmsx.Nod.value('(*:QueryPlan/*:QueryTimeStats/@ElapsedTime)[1]', 'INT'),
		PlanDop				= stmbtchstmsx.Nod.value('(*:QueryPlan/@DegreeOfParallelism)[1]', 'INT'), 
		QueryText			= (SELECT stmbtchstmsx.Nod.value('(@StatementText)[1]', 'NVARCHAR(MAX)') '*' FOR XML PATH(N''), TYPE) ,
		QueryXType2			= stmbtchstmsx.Nod.value('(@StatementType)[1]', 'NVARCHAR(40)')
	FROM	Recursion rec
	CROSS APPLY rec.NodXml.nodes('*:StmtCond/*:Else/*:Statements') stmbtchstms(Nod)
	CROSS APPLY stmbtchstms.Nod.nodes('*') stmbtchstmsx(Nod)
	WHERE	rec.QueryXType = 'StmtCond'
)
SELECT	
	rec.Num,
	rec.QueryXType2,
	rec.QueryText,
	rec.QueryCost,
	CONVERT(XML, NULL) ActualPlan,
	rec.QuerySttxCpuTime,
	rec.QuerySttxElapsedTime,
	rec.PlanDop,
	WaitSttx				= rec.NodXml.query('*:StmtSimple/*:QueryPlan/*:WaitStats'),
	ParameterList			= rec.NodXml.query('//*:ParameterList'),
	OptimizerStatsUsage		= rec.NodXml.query('*:StmtSimple/*:QueryPlan/*:OptimizerStatsUsage'),
	OptimizerMissingIndexes	= rec.NodXml.query('*:StmtSimple/*:QueryPlan/*:MissingIndexes'),
	Warnings				= rec.NodXml.query('*:StmtSimple/*:QueryPlan/*:Warnings'),
	BatchModeOnRowStoreUsed	= rec.NodXml.value('(*:StmtSimple[1]/@BatchModeOnRowStoreUsed)[1]', 'VARCHAR(40)'),
	Hid	= HIERARCHYID::Parse(Nod),
	Nod
INTO #sttx
FROM	Recursion rec
ORDER BY 
CONVERT   (HIERARCHYID, Nod)

DECLARE @Num INT
DECLARE CrsSttx CURSOR LOCAL STATIC FORWARD_ONLY
FOR
SELECT Num FROM #sttx

OPEN CrsSttx
FETCH NEXT FROM CrsSttx INTO @Num 

WHILE 0=0
BEGIN
	IF @@FETCH_STATUS = 0
	BEGIN
		DECLARE @new XML = @plan
		SET @new.modify('delete (*:ShowPlanXML/*:BatchSequence/*:Batch/*:Statements/*:StmtSimple[@StatementId ne sql:variable("@Num")])')
		UPDATE	stt
		SET		ActualPlan = @new
		FROM	#sttx stt
		WHERE	Num = @Num

		FETCH NEXT FROM CrsSttx INTO @Num 
	END
	ELSE
	BEGIN
		BREAK
	END
END

CLOSE CrsSttx
DEALLOCATE CrsSttx


IF OBJECT_ID('tempdb..#statistics') IS NOT NULL
BEGIN
	DROP TABLE #statistics
END

SELECT	rez.Num, cros.*
INTO	#statistics
FROM	#sttx rez
OUTER APPLY (
	SELECT	Op = rez.Nod.query('*[*:Object[@Database]]').value('local-name(*[1])', 'SYSNAME'),
		Obct = rez.Nod.value('(*/*:Object/@Database)[1]', 'SYSNAME') + 

		ISNULL('.' + rez.Nod.value('(*/*:Object/@Schema)[1]', 'SYSNAME') + '.' +
		rez.Nod.value('(*/*:Object/@Table)[1]', 'SYSNAME'), '') + 
		
		ISNULL(' (' + rez.Nod.value('(*/*:Object/@Index)[1]', 'SYSNAME') + ')', '') + 

		ISNULL(' ' + rez.Nod.value('(*/*:Object/@Alias)[1]', 'SYSNAME'), '')

		,app.*
	FROM ActualPlan.nodes('//*:RelOp[*:TableScan or *:IndexScan]') rez(Nod)
	OUTER APPLY (
		SELECT
			ThreadsCount		= COUNT(*),

			ActualElapsedms		= MAX(runtime.Nod.value('(@ActualElapsedms)[1]', 'INT')),
			ActualCPUms			= SUM(runtime.Nod.value('(@ActualCPUms)[1]', 'INT')),
			ActualRowsRead		= SUM(runtime.Nod.value('(@ActualRowsRead)[1]', 'INT')),

			ActualRows			= SUM(runtime.Nod.value('(@ActualRows)[1]', 'INT')),
			ActualLogicalReads	= SUM(runtime.Nod.value('(@ActualLogicalReads)[1]', 'INT')),
			ActualPhysicalReads = SUM(runtime.Nod.value('(@ActualPhysicalReads)[1]', 'INT'))
		FROM	rez.Nod.nodes('*:RunTimeInformation/*:RunTimeCountersPerThread') runtime(Nod)
	) app
) cros
ORDER BY Num

IF OBJECT_ID('tempdb..#statisticsagg') IS NOT NULL
BEGIN
	DROP TABLE #statisticsagg
END

SELECT	*
INTO	#statisticsagg
FROM	(
	SELECT	sttx.Num, TotalActualElapsedms = MAX(ActualElapsedms), TotalActualCPUms = SUM(ActualCPUms), TotalActualRowsRead = SUM(ActualRowsRead), TotalActualRows = SUM(ActualRows), TotalActualLogicalReads = SUM(ActualLogicalReads), TotalActualPhysicalReads = SUM(ActualPhysicalReads)
	FROM	#statistics sttx
	GROUP BY sttx.Num
) rez
OUTER APPLY (
	SELECT ThreadsCount, ActualElapsedms, ActualCPUms, ActualRowsRead, ActualRows, ActualLogicalReads, ActualPhysicalReads, Op, Obct
	FROM (
		SELECT	TOP(30) *
		FROM	#statistics sttx
		WHERE	sttx.Num = rez.Num
		ORDER BY sttx.ActualLogicalReads DESC
	) s
	FOR XML RAW('sttx'), TYPE
) app1(StatisticsIoDetails)
ORDER BY rez.Num


SELECT	* 
FROM	#sttx sttx
OUTER APPLY (
	SELECT	MissingIndexesDetails = (SELECT ccolg.Nod AS '*' FOR XML PATH(N''), TYPE)
	FROM	sttx.OptimizerMissingIndexes.nodes('*:MissingIndexes') mixes(Nod)
	CROSS APPLY mixes.Nod.nodes('*:MissingIndexGroup') mixsg(Nod)
	CROSS APPLY mixsg.Nod.nodes('*:MissingIndex') misx(Nod)
	CROSS APPLY (
		SELECT CONVERT(NVARCHAR(MAX), 
'/*
Missing Index Details from current execution plan
The Query Processor estimates that implementing the following index could improve the query cost by ' + + mixsg.Nod.value('(@Impact)[1]', 'VARCHAR(40)') + + '%.
*/

/*
USE ' + misx.Nod.value('(@Database)[1]', 'SYSNAME') + '
GO
' + 'CREATE INDEX inx ON ' + misx.Nod.value('(@Schema)[1]', 'SYSNAME') + '.' + misx.Nod.value('(@Table)[1]', 'SYSNAME') + ' (' + 
	SUBSTRING((SELECT	', ' + colg.Nod.value('(*:Column/@Name)[1]', 'SYSNAME')
	FROM	misx.Nod.nodes('*:ColumnGroup[@Usage = ("EQUALITY", "INEQUALITY")]') colg(Nod)
	ORDER BY ROW_NUMBER() OVER(ORDER BY colg.Nod)
	FOR XML PATH(N''), TYPE).value('.', 'NVARCHAR(MAX)'), 3, 4000) +
	')' 
	+ ISNULL(' INCLUDE (' + 
	NULLIF(SUBSTRING((SELECT	', ' + colg.Nod.value('(*:Column/@Name)[1]', 'SYSNAME')
	FROM	misx.Nod.nodes('*:ColumnGroup[@Usage eq "INCLUDE"]') colg(Nod)
	ORDER BY ROW_NUMBER() OVER(ORDER BY colg.Nod)
	FOR XML PATH(N''), TYPE).value('.', 'NVARCHAR(MAX)'), 3, 4000), '')
	+ ')', '') + '
GO
*/') 
	) ccolg(Nod)
) misex
LEFT OUTER JOIN (
	SELECT	*
	FROM	#statisticsagg sttxagg
) oet ON sttx.Num = oet.Num
ORDER BY sttx.Num

