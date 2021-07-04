DECLARE @dl XML = N'
<deadlock-list>
 <deadlock victim="process7c708a188">
  <process-list>
   <process id="process7c708a188" taskpriority="0" logused="1132" waitresource="KEY: 9:72057941411692544 (0769baf66c62)" waittime="23328" ownerId="170564485" transactionname="user_transaction" lasttranstarted="2021-06-14T10:09:40.297" XDES="0x673bb7838" lockMode="U" schedulerid="4" kpid="4532" status="suspended" spid="175" sbid="0" ecid="0" priority="0" trancount="2" lastbatchstarted="2021-06-14T10:09:40.710" lastbatchcompleted="2021-06-14T10:09:40.710" lastattention="1900-01-01T00:00:00.710" clientapp=".Net SqlClient Data Provider" hostname="APPS" hostpid="4544" loginname="sa" isolationlevel="read committed (2)" xactid="170564485" currentdb="9" lockTimeout="4294967295" clientoption1="671088672" clientoption2="128056">
    <executionStack>
     <frame procname="adhoc" line="1" stmtstart="182" sqlhandle="0x02000000cb6b6235aee4b251e4c7d855d3e5fb04bb82ea5d0000000000000000000000000000000000000000">
UPDATE dbo.ScheduleTypeDetail SET  ComputeOrder = @ReferenceComputeOrder + (ComputeOrder - @CurrentTotalAmountWithVATComputeOrder)  WHERE (ScheduleTypeId = @ScheduleTypeId) AND (ComputeOrder &gt;= @CurrentTotalAmountWithVATComputeOrder)     </frame>
     <frame procname="unknown" line="1" sqlhandle="0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000">
unknown     </frame>
    </executionStack>
    <inputbuf>
(@ScheduleTypeId int,@ReferenceComputeOrder int,@CurrentTotalAmountWithVATComputeOrder int)UPDATE dbo.ScheduleTypeDetail SET  ComputeOrder = @ReferenceComputeOrder + (ComputeOrder - @CurrentTotalAmountWithVATComputeOrder)  WHERE (ScheduleTypeId = @ScheduleTypeId) AND (ComputeOrder &gt;= @CurrentTotalAmountWithVATComputeOrder)     </inputbuf>
   </process>
   <process id="process6a89facf8" taskpriority="0" logused="2177436" waitresource="PAGE: 9:1:26762791 " waittime="3068" ownerId="170560266" transactionname="user_transaction" lasttranstarted="2021-06-14T10:09:30.513" XDES="0x12eb6f6a8" lockMode="S" schedulerid="5" kpid="4820" status="suspended" spid="182" sbid="0" ecid="0" priority="0" trancount="1" lastbatchstarted="2021-06-14T10:10:00.970" lastbatchcompleted="2021-06-14T10:10:00.970" lastattention="1900-01-01T00:00:00.970" clientapp=".Net SqlClient Data Provider" hostname="APPS" hostpid="4544" loginname="sa" isolationlevel="read committed (2)" xactid="170560266" currentdb="9" lockTimeout="4294967295" clientoption1="671088672" clientoption2="128056">
    <executionStack>
     <frame procname="adhoc" line="1" stmtstart="50" sqlhandle="0x0200000049785f08eee5a3dc980ad6de2b6cdb07d36454e10000000000000000000000000000000000000000">
select FIW_RecoveredFromFIW.RecoveryDate, FIW_RecoveredFromFIW.Amount, FIW_RecoveredFromFIW.Comments, FIW_RecoveredFromFIW.AmountId, FIW_RecoveredFromFIW.SiteId, FIW_RecoveredFromFIW.ContractId from FIW_RecoveredFromFIW where FIW_RecoveredFromFIW.SiteId = @param0 AND FIW_RecoveredFromFIW.ContractId = @param1     </frame>
     <frame procname="unknown" line="1" sqlhandle="0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000">
unknown     </frame>
    </executionStack>                                                  
    <inputbuf>
(@param0 int,@param1 int)select FIW_RecoveredFromFIW.RecoveryDate, FIW_RecoveredFromFIW.Amount, FIW_RecoveredFromFIW.Comments, FIW_RecoveredFromFIW.AmountId, FIW_RecoveredFromFIW.SiteId, FIW_RecoveredFromFIW.ContractId from FIW_RecoveredFromFIW where FIW_RecoveredFromFIW.SiteId = @param0 AND FIW_RecoveredFromFIW.ContractId = @param1    </inputbuf>
   </process>
  </process-list>
  <resource-list>
   <keylock hobtid="72057941411692544" dbid="9" objectname="CharismaERP.dbo.ScheduleTypeDetail" indexname="PK_ScheduleTypeDetail" id="lock31e6f8d00" mode="X" associatedObjectId="72057941411692544">
    <owner-list>
     <owner id="process6a89facf8" mode="X"/>
    </owner-list>               
    <waiter-list>   
     <waiter id="process7c708a188" mode="U" requestType="wait"/>
    </waiter-list>            
   </keylock>
   <pagelock fileid="1" pageid="26762791" dbid="9" subresource="FULL" objectname="CharismaERP.dbo.FIW_RecoveredFromFIW" id="lock637cdc080" mode="IX" associatedObjectId="72057941268430848">
    <owner-list>
     <owner id="process7c708a188" mode="IX"/>
    </owner-list>
    <waiter-list>
     <waiter id="process6a89facf8" mode="S" requestType="wait"/>
    </waiter-list>
   </pagelock>
  </resource-list>
 </deadlock>
</deadlock-list>'
         
SELECT	'ipbuffer' name, spid.Nod.value('(@spid)[1]', 'int') spid, excst.Nod.value('.', 'NVARCHAR(MAX)') excstframe   
FROM	@dl.nodes('deadlock-list/deadlock/process-list/process') spid(Nod)
CROSS APPLY spid.Nod.nodes('executionStack/frame') excst(Nod)
                        
RETURN

SELECT	*
FROM	(
	SELECT	'ipbuffer' name, spid.Nod.value('(@spid)[1]', 'int') spid, excst.Nod.value('.', 'NVARCHAR(MAX)') ipbuffer
	FROM	@dl.nodes('deadlock-list/deadlock/process-list/process') spid(Nod)
	CROSS APPLY spid.Nod.nodes('executionStack/frame') excst(Nod)
) cox
PIVOT( MAX(ipbuffer) FOR spid IN ([182], [175]) ) pvot

IF OBJECT_ID('tempdb..#cox') IS NOT NULL
BEGIN
	DROP TABLE #cox
END

SELECT	s.*, name = i.Nod.value('(@name)', 'sysname'), value = i.Nod.value('(text())[1]', 'varchar(8000)')
INTO #cox
FROM (
	SELECT	spid.Nod.value('(@id)[1]', 'sysname') id , spid.Nod.value('(@spid)[1]', 'int') spid, spid.Nod.query('for $i in ./@* return <i name="{local-name($i)}">{string($i)}</i>') cox
	FROM	@dl.nodes('deadlock-list/deadlock/process-list/process') spid(Nod)
) s CROSS APPLY s.cox.nodes('i') i(Nod)

DECLARE @SqlStatement NVARCHAR(MAX) = ''
DECLARE @Cols NVARCHAR(MAX) = ''
SELECT @Cols = STUFF((
	SELECT	', ' + QUOTENAME(cox.spid)
	FROM	#cox cox
	WHERE	NULLIF(cox.name, '') IS NOT NULL
	GROUP BY cox.spid
	ORDER BY 1
	FOR XML PATH(N''), TYPE
).value('.', 'NVARCHAR(MAX)'), 1, 2, '')

SELECT @SqlStatement = N'
SELECT	*   
FROM	(
	SELECT	spid, [name], [value]
	FROM	#cox cox
) cox
PIVOT( MAX([value]) FOR spid IN (' + @Cols + ') ) pvot'
EXEC sp_executesql @SqlStatement

SELECT @SqlStatement = N'
SELECT	*
FROM	(
	SELECT	''ipbuffer'' name, spid.Nod.value(''(@spid)[1]'', ''int'') spid, ipbuff.Nod.value(''.'', ''NVARCHAR(MAX)'') ipbuffer
	FROM	@dl.nodes(''deadlock-list/deadlock/process-list/process'') spid(Nod)
	CROSS APPLY spid.Nod.nodes(''inputbuf'') ipbuff(Nod)
) cox
PIVOT( MAX(ipbuffer) FOR spid IN (' + @Cols + ') ) pvot'
EXEC sp_executesql @SqlStatement, N'@dl XML', @dl
