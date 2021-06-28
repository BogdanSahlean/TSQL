SET QUOTED_IDENTIFIER ON   
SET ANSI_NULLS ON
GO
CREATE OR ALTER PROCEDURE StatisticsAnalysis
@statistics NVARCHAR(MAX), 
@plan XML  
AS
BEGIN
	DECLARE @TIME BIT = 0

	SELECT @statistics = '<i>' + REPLACE(@statistics, CHAR(13)+CHAR(10), '</i><i>') + '</i>'
	PRINT @statistics

	DECLARE @xms XML = CONVERT(XML, @statistics) 

	IF OBJECT_ID('tempdb..#sttcs') IS NOT NULL
	BEGIN
		DROP TABLE #sttcs
	END

	SELECT	*, QueryStatementId = SUM(CASE WHEN rt=3 THEN 1 ELSE 0 END) OVER(ORDER BY s.rn) 
	INTO #sttcs
	FROM (
		SELECT	*, 
			rt = CASE 
				WHEN txt LIKE 'SQL Server parse and compile time:%' THEN 1
				WHEN txt LIKE '%SQL Server Execution Times:%' THEN 2
				WHEN txt LIKE '(% row affected)' THEN 3
				WHEN txt LIKE '(% rows affected)' THEN 3
				WHEN txt LIKE 'Table ''%''. Scan count %' THEN 4
				WHEN NULLIF(txt, '') IS NULL THEN 5
			END
		FROM (
			SELECT	rn = ROW_NUMBER() OVER(ORDER BY i.Nod), que = i.Nod.query('.'), txt = LTRIM(RTRIM(i.Nod.value('.', 'NVARCHAR(MAX)')))
			FROM	@xms.nodes('i') i(Nod)
		) s
	) s
	ORDER BY rn

	IF NOT EXISTS(SELECT * FROM #sttcs WHERE rt = 4)
	BEGIN
		RAISERROR('Minimum output for analysis is STATISTICS IO ON', 16, 1);
		RETURN
	END
	SELECT @TIME = CASE WHEN EXISTS(SELECT * FROM #sttcs WHERE rt = 2) THEN NULL ELSE 0 END 

	IF OBJECT_ID('tempdb..#rd') IS NOT NULL
	BEGIN
		DROP TABLE #rd
	END

	SELECT	s.rn, s.txt, ta.*
	INTO #rd
	FROM	#sttcs s
	CROSS APPLY (
		SELECT	 
			ObjctName	= MAX(CASE WHEN typofrow = 1 THEN LTRIM(SUBSTRING(typ.Va, 7, 2000)) END) OVER(),
			[Type]		= CASE WHEN typofrow = 2 THEN LTRIM(REVERSE(SUBSTRING(REVERSE(typ.Va), CHARINDEX(' ', REVERSE(typ.Va)), 2000))) END,
			Va			= CASE WHEN typofrow = 2 THEN TRY_PARSE(REVERSE(SUBSTRING(REVERSE(typ.Va), 1, CHARINDEX(' ', REVERSE(typ.Va)))) AS INT) END,
			RNum		= typ.rnum
		FROM (
			SELECT	s.Va, s.RNum,
				typofrow = CASE WHEN s.Va LIKE 'Table %' THEN 1 ELSE 2 END
			FROM (
				SELECT	Va = LTRIM(RTRIM(tnd.Nod.value('.', 'VARCHAR(4000)'))), rnum = ROW_NUMBER() OVER(ORDER BY tnd.Nod)
				FROM (SELECT CONVERT(XML, ('<i>' + REPLACE(REPLACE(s.txt, ',', '</i><i>'), '.', '</i><i>') + '</i>'))) t(Nod)
				CROSS APPLY t.Nod.nodes('i') tnd(Nod)
				WHERE NULLIF(tnd.Nod.value('.', 'VARCHAR(4000)'), '') IS NOT NULL
			) s
		) typ
	) ta
	WHERE	s.rt = 4


	DECLARE @Cols NVARCHAR(MAX)
	DECLARE @SqlStatementLogicalRd NVARCHAR(MAX) 
	DECLARE @SqlStatementCreateTable NVARCHAR(MAX) 
	SELECT @Cols = 

	STUFF((
		SELECT	', ' + QUOTENAME(s.[Type])
		FROM (
			SELECT	rd.[Type], pti = ROW_NUMBER() OVER(PARTITION BY rd.[Type] ORDER BY rd.rn),
				rd.RNum
			FROM	#rd rd
			WHERE	rd.[Type] IS NOT NULL
		) s
		WHERE pti = 1
		ORDER BY s.RNum
		FOR XML PATH(N''), TYPE   
	).value('.', 'NVARCHAR(MAX)'), 1, 2, '')

	IF OBJECT_ID('tempdb..##LogicalRd') IS NOT NULL
	BEGIN
		DROP TABLE ##LogicalRd
	END

	SELECT @SqlStatementCreateTable = 'CREATE TABLE ##LogicalRd (ObjctName SYSNAME NOT NULL, rn INT NOT NULL, ' + REPLACE(@Cols, ']', '] INT') + ')'
	EXEC sp_executesql @SqlStatementCreateTable

	SELECT @SqlStatementLogicalRd = '
	INSERT ##LogicalRd
	SELECT	*
	FROM (
		SELECT	ObjctName, Va, rn, [Type]
		FROM	#rd
	) ptio
	PIVOT( MAX(ptio.Va) FOR ptio.[Type] IN (' + @Cols + ')) r'
	PRINT @SqlStatementLogicalRd
	EXEC sp_executesql @SqlStatementLogicalRd

	IF @plan IS NOT NULL
	BEGIN
		IF OBJECT_ID('tempdb..##sttcslgc') IS NOT NULL
		BEGIN
			DROP TABLE ##sttcslgc
		END
		IF OBJECT_ID('tempdb..#plan') IS NOT NULL
		BEGIN
			DROP TABLE #plan
		END
		SELECT	QueryStatementId = sql.[SqlStatementSl].value('@StatementId', 'INT'), QueryTxt = (SELECT sql.SqlStatementSl.value('@StatementText', 'NVARCHAR(MAX)') AS '*' FOR XML PATH(N''), TYPE)
		INTO	#plan
		FROM	@plan.nodes('*:ShowPlanXML/*:BatchSequence/*:Batch/*:Statements/*:StmtSimple') sql([SqlStatementSl])

		SELECT	Num = sttcs.rn, QueryTxt = ISNULL(pl.QueryTxt, sttcs.que), Txt = sttcs.txt, lgc.*, sttcs.QueryStatementId
		INTO	##sttcslgc 
		FROM	#sttcs sttcs
		LEFT JOIN #plan pl ON sttcs.QueryStatementId = pl.QueryStatementId
		LEFT JOIN ##LogicalRd lgc ON sttcs.rn = lgc.rn
		WHERE	sttcs.rt <> 5
		ORDER BY sttcs.rn
	END
	ELSE
	BEGIN
		IF OBJECT_ID('tempdb..##sttcslgc2') IS NOT NULL
		BEGIN
			DROP TABLE ##sttcslgc2
		END

		SELECT	Num = sttcs.rn, QueryTxt = sttcs.que, Txt = sttcs.txt, lgc.*, QueryStatementId = SUM(CASE WHEN rt=3 THEN 1 ELSE 0 END) OVER(ORDER BY sttcs.rn) 
		INTO	##sttcslgc2 
		FROM	#sttcs sttcs
		LEFT JOIN ##LogicalRd lgc ON sttcs.rn = lgc.rn
		WHERE	sttcs.rt <> 5
		ORDER BY sttcs.rn
		OPTION(RECOMPILE)
	END

	IF @plan IS NOT NULL
	SELECT	* 
	FROM	##sttcslgc
	ORDER BY Num
	ELSE
	SELECT	* 
	FROM	##sttcslgc2
	ORDER BY Num
END

GO

