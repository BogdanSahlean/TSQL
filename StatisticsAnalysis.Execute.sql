DECLARE @sttcs NVARCHAR(MAX) =
'SQL Server parse and compile time:    
   CPU time = 31 ms, elapsed time = 33 ms.            
   
 SQL Server Execution Times:      
   CPU time = 0 ms,  elapsed time = 0 ms.   
   
(1 row affected)      
Table ''FactOnlineSales''. Scan count 2555, logical reads 36240, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
Table ''DimDate''. Scan count 9, logical reads 334, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
Table ''Worktable''. Scan count 0, logical reads 0, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
   
 SQL Server Execution Times:            
   CPU time = 10557 mcs,  elapsed time = 1733 ms.
   
(1 row affected)  
Table ''FactOnlineSales''. Scan count 9, logical reads 28523, physical reads 0,       page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
      
 SQL Server Execution Times:      
   CPU time = 4634 ms,  elapsed time = 691 s.'            
                                                                                                                                          
DECLARE @plan XML = N'<?xml version="1.0" encoding="utf-16"?>   
<ShowPlanXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Version="1.539" Build="15.0.2000.5" xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan">   
  <BatchSequence>            
    <Batch>                              
      <Statements>      
        <StmtSimple StatementCompId="2" StatementEstRows="1" StatementId="1" StatementOptmLevel="FULL" CardinalityEstimationModelVersion="70" StatementSubTreeCost="54.6914" StatementText="SELECT COUNT(ddd.NorthAmericaSeason) &#xD;&#xA;FROM FactOnlineSales fcto &#xD;&#xA;JOIN DimDate ddd ON fcto.DateKey = ddd.Datekey" StatementType="SELECT" QueryHash="0x6486F95BB431C6E4" QueryPlanHash="0x13BEA4EF1B909C8D" RetrievedFromCache="true" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="8" MemoryGrant="136" CachedPlanSize="144" CompileTime="1157" CompileCPU="85" CompileMemory="2128">
            <ThreadStat Branches="1" UsedThreads="8">                                                               
              <ThreadReservation NodeId="0" ReservedThreads="8" />      
            </ThreadStat>
            <MemoryG/rantInfo SerialRequiredMemory="0" SerialDesiredMemory="0" RequiredMemory="136" DesiredMemory="136" RequestedMemory="136" GrantWaitTime="0" GrantedMemory="136" MaxUsedMemory="136" MaxQueryMemory="723240" />                                                                                                         
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="3248368" />
            <WaitStats>
              <Wait WaitType="PAGEIOLATCH_SH" WaitTimeMs="135917" WaitCount="1942" />
              <Wait WaitType="CXPACKET" WaitTimeMs="38607" WaitCount="9" />
              <Wait WaitType="MEMORY_ALLOCATION_EXT" WaitTimeMs="588" WaitCount="35040" />
              <Wait WaitType="LATCH_SH" WaitTimeMs="19" WaitCount="5" />
              <Wait WaitType="LATCH_EX" WaitTimeMs="13" WaitCount="40" />
              <Wait WaitType="SOS_SCHEDULER_YIELD" WaitTimeMs="8" WaitCount="1476" />
              <Wait WaitType="SESSION_WAIT_STATS_CHILDREN" WaitTimeMs="1" WaitCount="7" />
            </WaitStats>                  
            <QueryTimeStats CpuTime="9598" ElapsedTime="20443" />
            <RelOp AvgRowSize="11" EstimateCPU="1E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="1" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="54.6914">
              <OutputList>                                                                                                      
                <ColumnReference Column="Expr1002" />
              </OutputList>
              <ComputeScalar>      
                <DefinedValues>                                                                 
                
                
           
                  <DefinedValue>      
                    <ColumnReference Column="Expr1002" />
                    <ScalarOperator ScalarString="CONVERT_IMPLICIT(int,[globalagg1005],0)">
                      <Convert DataType="int" Style="0" Implicit="true">
                        <ScalarOperator>   
                          <Identifier>    
                            <ColumnReference Column="globalagg1005" />
                          </Identifier>
                        </ScalarOperator>
                      </Convert>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="15" EstimateCPU="2.9E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="2" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="54.6914">
                  <OutputList>
                    <ColumnReference Column="globalagg1005" />
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="20442" ActualCPUms="0" />
                  </RunTimeInformation>
                  <StreamAggregate>
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="globalagg1005" />
                        <ScalarOperator ScalarString="SUM([partialagg1004])">
                          <Aggregate AggType="SUM" Distinct="false">
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Column="partialagg1004" />
                              </Identifier>
                            </ScalarOperator>
                          </Aggregate>
                        </ScalarOperator>
                      </DefinedValue>
                    </DefinedValues>
                    <RelOp AvgRowSize="15" EstimateCPU="0.0285021" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="4" LogicalOp="Gather Streams" NodeId="3" Parallel="true" PhysicalOp="Parallelism" EstimatedTotalSubtreeCost="54.6914">
                      <OutputList>
                        <ColumnReference Column="partialagg1004" />
                      </OutputList>
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="8" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="20442" ActualCPUms="0" />
                      </RunTimeInformation>
                      <Parallelism>
                        <RelOp AvgRowSize="15" EstimateCPU="1.83242" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="4" LogicalOp="Aggregate" NodeId="4" Parallel="true" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="54.6629">
                          <OutputList>
                            <ColumnReference Column="partialagg1004" />
                          </OutputList>
                          <RunTimeInformation>
                            <RunTimeCountersPerThread Thread="8" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="17029" ActualCPUms="740" />
                            <RunTimeCountersPerThread Thread="7" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="18232" ActualCPUms="1136" />
                            <RunTimeCountersPerThread Thread="6" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="19017" ActualCPUms="1022" />
                            <RunTimeCountersPerThread Thread="5" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="18571" ActualCPUms="827" />
                            <RunTimeCountersPerThread Thread="4" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="17884" ActualCPUms="993" />
                            <RunTimeCountersPerThread Thread="3" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="14849" ActualCPUms="719" />
                            <RunTimeCountersPerThread Thread="2" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="19324" ActualCPUms="2312" />
                            <RunTimeCountersPerThread Thread="1" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="20437" ActualCPUms="1840" />
                            <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                          </RunTimeInformation>
                          <StreamAggregate>   
                            <DefinedValues>
                              <DefinedValue>   
                                <ColumnReference Column="partialagg1004" />
                                <ScalarOperator ScalarString="COUNT([Contoso].[dbo].[DimDate].[NorthAmericaSeason] as [ddd].[NorthAmericaSeason])">
                                  <Aggregate AggType="COUNT_BIG" Distinct="false">
                                    <ScalarOperator>
                                      <Identifier>
                                        <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="NorthAmericaSeason" />
                                      </Identifier>
                                    </ScalarOperator>
                                  </Aggregate>
                                </ScalarOperator>
                              </DefinedValue>
                            </DefinedValues>
                            <RelOp AvgRowSize="61" EstimateCPU="12.7658" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="12216100" LogicalOp="Inner Join" NodeId="5" Parallel="true" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="52.8304">
                              <OutputList>
                                <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="NorthAmericaSeason" />
                              </OutputList>
                              <RunTimeInformation>
                                <RunTimeCountersPerThread Thread="8" ActualRows="1073493" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="16811" ActualCPUms="521" />
                                <RunTimeCountersPerThread Thread="7" ActualRows="1489374" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="17881" ActualCPUms="786" />
                                <RunTimeCountersPerThread Thread="6" ActualRows="1433855" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="18714" ActualCPUms="719" />
                                <RunTimeCountersPerThread Thread="5" ActualRows="1163780" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="18321" ActualCPUms="577" />
                                <RunTimeCountersPerThread Thread="4" ActualRows="1374903" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="17588" ActualCPUms="697" />
                                <RunTimeCountersPerThread Thread="3" ActualRows="978585" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="14638" ActualCPUms="508" />
                                <RunTimeCountersPerThread Thread="2" ActualRows="2523322" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="18699" ActualCPUms="1687" />
                                <RunTimeCountersPerThread Thread="1" ActualRows="2590296" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="19893" ActualCPUms="1296" />
                                <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                              </RunTimeInformation>
                              <NestedLoops Optimized="false" WithUnorderedPrefetch="true">
                                <OuterReferences>
                                  <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="Datekey" />
                                  <ColumnReference Column="Expr1006" />
                                </OuterReferences>
                                <RelOp AvgRowSize="69" EstimateCPU="0.00074215" EstimateIO="0.0846065" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="2556" EstimatedRowsRead="2556" LogicalOp="Clustered Index Scan" NodeId="7" Parallel="true" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.0853486" TableCardinality="2556">
                                  <OutputList>
                                    <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="Datekey" />
                                    <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="NorthAmericaSeason" />
                                  </OutputList>
                                  <RunTimeInformation>
                                    <RunTimeCountersPerThread Thread="8" ActualRows="226" ActualRowsRead="226" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="2" ActualCPUms="1" ActualScans="1" ActualLogicalReads="30" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="7" ActualRows="249" ActualRowsRead="249" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="2" ActualCPUms="2" ActualScans="1" ActualLogicalReads="33" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="6" ActualRows="267" ActualRowsRead="267" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="2" ActualCPUms="2" ActualScans="1" ActualLogicalReads="33" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="5" ActualRows="368" ActualRowsRead="368" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="2" ActualCPUms="2" ActualScans="1" ActualLogicalReads="48" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="4" ActualRows="245" ActualRowsRead="245" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6" ActualCPUms="2" ActualScans="1" ActualLogicalReads="33" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="3" ActualRows="428" ActualRowsRead="428" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6" ActualCPUms="5" ActualScans="1" ActualLogicalReads="56" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="2" ActualRows="415" ActualRowsRead="415" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="7" ActualCPUms="2" ActualScans="1" ActualLogicalReads="54" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="1" ActualRows="358" ActualRowsRead="358" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="3" ActualCPUms="2" ActualScans="1" ActualLogicalReads="45" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="1" ActualLogicalReads="2" ActualPhysicalReads="1" ActualReadAheads="112" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                  </RunTimeInformation>
                                  <IndexScan Ordered="false" ForcedIndex="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="Datekey" />
                                      </DefinedValue>
                                      <DefinedValue>
                                        <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="NorthAmericaSeason" />
                                      </DefinedValue>
                                    </DefinedValues>
                                    <Object Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Index="[PK_DimDate_DateKey]" Alias="[ddd]" IndexKind="Clustered" Storage="RowStore" />
                                  </IndexScan>
                                </RelOp>
                                <RelOp AvgRowSize="9" EstimateCPU="0.00541432" EstimateIO="0.0105324" EstimateRebinds="2555" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="4779.38" EstimatedRowsRead="4779.38" LogicalOp="Index Seek" NodeId="8" Parallel="true" Partitioned="true" PhysicalOp="Index Seek" EstimatedTotalSubtreeCost="39.9793" TableCardinality="12627600">
                                  <OutputList />
                                  <RunTimeInformation>
                                    <RunTimeCountersPerThread Thread="8" ActualRows="1073493" ActualRowsRead="1073493" Batches="0" ActualEndOfScans="226" ActualExecutions="226" ActualExecutionMode="Row" ActualElapsedms="6168" ActualCPUms="318" ActualScans="226" ActualLogicalReads="3022" ActualPhysicalReads="0" ActualReadAheads="1756" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="7" ActualRows="1489374" ActualRowsRead="1489374" Batches="0" ActualEndOfScans="249" ActualExecutions="249" ActualExecutionMode="Row" ActualElapsedms="6674" ActualCPUms="481" ActualScans="249" ActualLogicalReads="4008" ActualPhysicalReads="0" ActualReadAheads="2498" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="6" ActualRows="1433855" ActualRowsRead="1433855" Batches="0" ActualEndOfScans="267" ActualExecutions="267" ActualExecutionMode="Row" ActualElapsedms="7850" ActualCPUms="446" ActualScans="267" ActualLogicalReads="3941" ActualPhysicalReads="0" ActualReadAheads="2349" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="5" ActualRows="1163780" ActualRowsRead="1163780" Batches="0" ActualEndOfScans="368" ActualExecutions="368" ActualExecutionMode="Row" ActualElapsedms="8120" ActualCPUms="353" ActualScans="368" ActualLogicalReads="3648" ActualPhysicalReads="0" ActualReadAheads="1877" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="4" ActualRows="1374903" ActualRowsRead="1374903" Batches="0" ActualEndOfScans="245" ActualExecutions="245" ActualExecutionMode="Row" ActualElapsedms="6996" ActualCPUms="425" ActualScans="245" ActualLogicalReads="3741" ActualPhysicalReads="0" ActualReadAheads="2283" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="3" ActualRows="978585" ActualRowsRead="978585" Batches="0" ActualEndOfScans="428" ActualExecutions="428" ActualExecutionMode="Row" ActualElapsedms="4433" ActualCPUms="297" ActualScans="428" ActualLogicalReads="3416" ActualPhysicalReads="0" ActualReadAheads="1600" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="2" ActualRows="2523322" ActualRowsRead="2523322" Batches="0" ActualEndOfScans="415" ActualExecutions="415" ActualExecutionMode="Row" ActualElapsedms="12404" ActualCPUms="833" ActualScans="415" ActualLogicalReads="7058" ActualPhysicalReads="0" ActualReadAheads="3634" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="1" ActualRows="2590296" ActualRowsRead="2590296" Batches="0" ActualEndOfScans="358" ActualExecutions="358" ActualExecutionMode="Row" ActualElapsedms="9331" ActualCPUms="818" ActualScans="358" ActualLogicalReads="6928" ActualPhysicalReads="0" ActualReadAheads="3952" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                    <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                  </RunTimeInformation>
                                  <RunTimePartitionSummary>
                                    <PartitionsAccessed PartitionCount="759">
                                      <PartitionRange Start="1" End="759" />
                                    </PartitionsAccessed>
                                  </RunTimePartitionSummary>
                                  <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                    <DefinedValues />
                                    <Object Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSales]" Index="[IX_FACTONLINESALES_DateKey_Partition]" Alias="[fcto]" IndexKind="NonClustered" Storage="RowStore" />
                                    <SeekPredicates>
                                      <SeekPredicateNew>
                                        <SeekKeys>
                                          <Prefix ScanType="EQ">
                                            <RangeColumns>
                                              <ColumnReference Column="PtnId1003" />
                                              <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSales]" Alias="[fcto]" Column="DateKey" />
                                            </RangeColumns>
                                            <RangeExpressions>
                                              <ScalarOperator ScalarString="RangePartitionNew([Contoso].[dbo].[DimDate].[Datekey] as [ddd].[Datekey],(1),''2007-01-02 00:00:00.000'',''2007-01-03 00:00:00.000'',''2007-01-04 00:00:00.000'',''2007-01-05 00:00:00.000'',''2007-01-06 00:00:00.000'',''2007-01-07 00:00:00.000'',''2007-01-08 00:00:00.000'',''2007-01-09 00:00:00.000'',''2007-01-10 00:00:00.000'',''2007-01-11 00:00:00.000'',''2007-01-12 00:00:00.000'',''2007-01-13 00:00:00.000'',''2007-01-14 00:00:00.000'',''2007-01-15 00:00:00.000'',''2007-01-16 00:00:00.000'',''2007-01-17 00:00:00.000'',''2007-01-18 00:00:00.000'',''2007-01-19 00:00:00.000'',''2007-01-20 00:00:00.000'',''2007-01-21 00:00:00.000'',''2007-01-22 00:00:00.000'',''2007-01-23 00:00:00.000'',''2007-01-24 00:00:00.000'',''2007-01-25 00:00:00.000'',''2007-01-26 00:00:00.000'',''2007-01-27 00:00:00.000'',''2007-01-28 00:00:00.000'',''2007-01-29 00:00:00.000'',''2007-01-30 00:00:00.000'',''2007-01-31 00:00:00.000'',''2007-02-01 00:00:00.000'',''2007-02-02 00:00:00.000'',''2007-02-03 00:00:00.000'',''2007-02-04 00:00:00.000'',''2007-02-05 00:00:00.000'',''2007-02-06 00:00:00.000'',''2007-02-07 00:00:00.000'',''2007-02-08 00:00:00.000'',''2007-02-09 00:00:00.000'',''2007-02-10 00:00:00.000'',''2007-02-11 00:00:00.000'',''2007-02-12 00:00:00.000'',''2007-02-13 00:00:00.000'',''2007-02-14 00:00:00.000'',''2007-02-15 00:00:00.000'',''2007-02-16 00:00:00.000'',''2007-02-17 00:00:00.000'',''2007-02-18 00:00:00.000'',''2007-02-19 00:00:00.000'',''2007-02-20 00:00:00.000'',''2007-02-21 00:00:00.000'',''2007-02-22 00:00:00.000'',''2007-02-23 00:00:00.000'',''2007-02-24 00:00:00.000'',''2007-02-25 00:00:00.000'',''2007-02-26 00:00:00.000'',''2007-02-27 00:00:00.000'',''2007-02-28 00:00:00.000'',''2007-03-01 00:00:00.000'',''2007-03-02 00:00:00.000'',''2007-03-03 00:00:00.000'',''2007-03-04 00:00:00.000'',''2007-03-05 00:00:00.000'',''2007-03-06 00:00:00.000'',''2007-03-07 00:00:00.000'',''2007-03-08 00:00:00.000'',''2007-03-09 00:00:00.000'',''2007-03-10 00:00:00.000'',''2007-03-11 00:00:00.000'',''2007-03-12 00:00:00.000'',''2007-03-13 00:00:00.000'',''2007-03-14 00:00:00.000'',''2007-03-15 00:00:00.000'',''2007-03-16 00:00:00.000'',''2007-03-17 00:00:00.000'',''2007-03-18 00:00:00.000'',''2007-03-19 00:00:00.000'',''2007-03-20 00:00:00.000'',''2007-03-21 00:00:00.000'',''2007-03-22 00:00:00.000'',''2007-03-23 00:00:00.000'',''2007-03-24 00:00:00.000'',''2007-03-25 00:00:00.000'',''2007-03-26 00:00:00.000'',''2007-03-27 00:00:00.000'',''2007-03-28 00:00:00.000'',''2007-03-29 00:00:00.000'',''2007-03-30 00:00:00.000'',''2007-03-31 00:00:00.000'',''2007-04-01 00:00:00.000'',''2007-04-02 00:00:00.000'',''2007-04-03 00:00:00.000'',''2007-04-04 00:00:00.000'',''2007-04-05 00:00:00.000'',''2007-04-06 00:00:00.000'',''2007-04-07 00:00:00.000'',''2007-04-08 00:00:00.000'',''2007-04-09 00:00:00.000'',''2007-04-10 00:00:00.000'',''2007-04-11 00:00:00.000'',''2007-04-12 00:00:00.000'',''2007-04-13 00:00:00.000'',''2007-04-14 00:00:00.000'',''2007-04-15 00:00:00.000'',''2007-04-16 00:00:00.000'',''2007-04-17 00:00:00.000'',''2007-04-18 00:00:00.000'',''2007-04-19 00:00:00.000'',''2007-04-20 00:00:00.000'',''2007-04-21 00:00:00.000'',''2007-04-22 00:00:00.000'',''2007-04-23 00:00:00.000'',''2007-04-24 00:00:00.000'',''2007-04-25 00:00:00.000'',''2007-04-26 00:00:00.000'',''2007-04-27 00:00:00.000'',''2007-04-28 00:00:00.000'',''2007-04-29 00:00:00.000'',''2007-04-30 00:00:00.000'',''2007-05-01 00:00:00.000'',''2007-05-02 00:00:00.000'',''2007-05-03 00:00:00.000'',''2007-05-04 00:00:00.000'',''2007-05-05 00:00:00.000'',''2007-05-06 00:00:00.000'',''2007-05-07 00:00:00.000'',''2007-05-08 00:00:00.000'',''2007-05-09 00:00:00.000'',''2007-05-10 00:00:00.000'',''2007-05-11 00:00:00.000'',''2007-05-12 00:00:00.000'',''2007-05-13 00:00:00.000'',''2007-05-14 00:00:00.000'',''2007-05-15 00:00:00.000'',''2007-05-16 00:00:00.000'',''2007-05-17 00:00:00.000'',''2007-05-18 00:00:00.000'',''2007-05-19 00:00:00.000'',''2007-05-20 00:00:00.000'',''2007-05-21 00:00:00.000'',''2007-05-22 00:00:00.000'',''2007-05-23 00:00:00.000'',''2007-05-24 00:00:00.000'',''2007-05-25 00:00:00.000'',''2007-05-26 00:00:00.000'',''2007-05-27 00:00:00.000'',''2007-05-28 00:00:00.000'',''2007-05-29 00:00:00.000'',''2007-05-30 00:00:00.000'',''2007-05-31 00:00:00.000'',''2007-06-01 00:00:00.000'',''2007-06-02 00:00:00.000'',''2007-06-03 00:00:00.000'',''2007-06-04 00:00:00.000'',''2007-06-05 00:00:00.000'',''2007-06-06 00:00:00.000'',''2007-06-07 00:00:00.000'',''2007-06-08 00:00:00.000'',''2007-06-09 00:00:00.000'',''2007-06-10 00:00:00.000'',''2007-06-11 00:00:00.000'',''2007-06-12 00:00:00.000'',''2007-06-13 00:00:00.000'',''2007-06-14 00:00:00.000'',''2007-06-15 00:00:00.000'',''2007-06-16 00:00:00.000'',''2007-06-17 00:00:00.000'',''2007-06-18 00:00:00.000'',''2007-06-19 00:00:00.000'',''2007-06-20 00:00:00.000'',''2007-06-21 00:00:00.000'',''2007-06-22 00:00:00.000'',''2007-06-23 00:00:00.000'',''2007-06-24 00:00:00.000'',''2007-06-25 00:00:00.000'',''2007-06-26 00:00:00.000'',''2007-06-27 00:00:00.000'',''2007-06-28 00:00:00.000'',''2007-06-29 00:00:00.000'',''2007-06-30 00:00:00.000'',''2007-07-01 00:00:00.000'',''2007-07-02 00:00:00.000'',''2007-07-03 00:00:00.000'',''2007-07-04 00:00:00.000'',''2007-07-05 00:00:00.000'',''2007-07-06 00:00:00.000'',''2007-07-07 00:00:00.000'',''2007-07-08 00:00:00.000'',''2007-07-09 00:00:00.000'',''2007-07-10 00:00:00.000'',''2007-07-11 00:00:00.000'',''2007-07-12 00:00:00.000'',''2007-07-13 00:00:00.000'',''2007-07-14 00:00:00.000'',''2007-07-15 00:00:00.000'',''2007-07-16 00:00:00.000'',''2007-07-17 00:00:00.000'',''2007-07-18 00:00:00.000'',''2007-07-19 00:00:00.000'',''2007-07-20 00:00:00.000'',''2007-07-21 00:00:00.000'',''2007-07-22 00:00:00.000'',''2007-07-23 00:00:00.000'',''2007-07-24 00:00:00.000'',''2007-07-25 00:00:00.000'',''2007-07-26 00:00:00.000'',''2007-07-27 00:00:00.000'',''2007-07-28 00:00:00.000'',''2007-07-29 00:00:00.000'',''2007-07-30 00:00:00.000'',''2007-07-31 00:00:00.000'',''2007-08-01 00:00:00.000'',''2007-08-02 00:00:00.000'',''2007-08-03 00:00:00.000'',''2007-08-04 00:00:00.000'',''2007-08-05 00:00:00.000'',''2007-08-06 00:00:00.000'',''2007-08-07 00:00:00.000'',''2007-08-08 00:00:00.000'',''2007-08-09 00:00:00.000'',''2007-08-10 00:00:00.000'',''2007-08-11 00:00:00.000'',''2007-08-12 00:00:00.000'',''2007-08-13 00:00:00.000'',''2007-08-14 00:00:00.000'',''2007-08-15 00:00:00.000'',''2007-08-16 00:00:00.000'',''2007-08-17 00:00:00.000'',''2007-08-18 00:00:00.000'',''2007-08-19 00:00:00.000'',''2007-08-20 00:00:00.000'',''2007-08-21 00:00:00.000'',''2007-08-22 00:00:00.000'',''2007-08-23 00:00:00.000'',''2007-08-24 00:00:00.000'',''2007-08-25 00:00:00.000'',''2007-08-26 00:00:00.000'',''2007-08-27 00:00:00.000'',''2007-08-28 00:00:00.000'',''2007-08-29 00:00:00.000'',''2007-08-30 00:00:00.000'',''2007-08-31 00:00:00.000'',''2007-09-01 00:00:00.000'',''2007-09-02 00:00:00.000'',''2007-09-03 00:00:00.000'',''2007-09-04 00:00:00.000'',''2007-09-05 00:00:00.000'',''2007-09-06 00:00:00.000'',''2007-09-07 00:00:00.000'',''2007-09-08 00:00:00.000'',''2007-09-09 00:00:00.000'',''2007-09-10 00:00:00.000'',''2007-09-11 00:00:00.000'',''2007-09-12 00:00:00.000'',''2007-09-13 00:00:00.000'',''2007-09-14 00:00:00.000'',''2007-09-15 00:00:00.000'',''2007-09-16 00:00:00.000'',''2007-09-17 00:00:00.000'',''2007-09-18 00:00:00.000'',''2007-09-19 00:00:00.000'',''2007-09-20 00:00:00.000'',''2007-09-21 00:00:00.000'',''2007-09-22 00:00:00.000'',''2007-09-23 00:00:00.000'',''2007-09-24 00:00:00.000'',''2007-09-25 00:00:00.000'',''2007-09-26 00:00:00.000'',''2007-09-27 00:00:00.000'',''2007-09-28 00:00:00.000'',''2007-09-29 00:00:00.000'',''2007-09-30 00:00:00.000'',''2007-10-01 00:00:00.000'',''2007-10-02 00:00:00.000'',''2007-10-03 00:00:00.000'',''2007-10-04 00:00:00.000'',''2007-10-05 00:00:00.000'',''2007-10-06 00:00:00.000'',''2007-10-07 00:00:00.000'',''2007-10-08 00:00:00.000'',''2007-10-09 00:00:00.000'',''2007-10-10 00:00:00.000'',''2007-10-11 00:00:00.000'',''2007-10-12 00:00:00.000'',''2007-10-13 00:00:00.000'',''2007-10-14 00:00:00.000'',''2007-10-15 00:00:00.000'',''2007-10-16 00:00:00.000'',''2007-10-17 00:00:00.000'',''2007-10-18 00:00:00.000'',''2007-10-19 00:00:00.000'',''2007-10-20 00:00:00.000'',''2007-10-21 00:00:00.000'',''2007-10-22 00:00:00.000'',''2007-10-23 00:00:00.000'',''2007-10-24 00:00:00.000'',''2007-10-25 00:00:00.000'',''2007-10-26 00:00:00.000'',''2007-10-27 00:00:00.000'',''2007-10-28 00:00:00.000'',''2007-10-29 00:00:00.000'',''2007-10-30 00:00:00.000'',''2007-10-31 00:00:00.000'',''2007-11-01 00:00:00.000'',''2007-11-02 00:00:00.000'',''2007-11-03 00:00:00.000'',''2007-11-04 00:00:00.000'',''2007-11-05 00:00:00.000'',''2007-11-06 00:00:00.000'',''2007-11-07 00:00:00.000'',''2007-11-08 00:00:00.000'',''2007-11-09 00:00:00.000'',''2007-11-10 00:00:00.000'',''2007-11-11 00:00:00.000'',''2007-11-12 00:00:00.000'',''2007-11-13 00:00:00.000'',''2007-11-14 00:00:00.000'',''2007-11-15 00:00:00.000'',''2007-11-16 00:00:00.000'',''2007-11-17 00:00:00.000'',''2007-11-18 00:00:00.000'',''2007-11-19 00:00:00.000'',''2007-11-20 00:00:00.000'',''2007-11-21 00:00:00.000'',''2007-11-22 00:00:00.000'',''2007-11-23 00:00:00.000'',''2007-11-24 00:00:00.000'',''2007-11-25 00:00:00.000'',''2007-11-26 00:00:00.000'',''2007-11-27 00:00:00.000'',''2007-11-28 00:00:00.000'',''2007-11-29 00:00:00.000'',''2007-11-30 00:00:00.000'',''2007-12-01 00:00:00.000'',''2008-11-02 00:00:00.000'',''2008-11-03 00:00:00.000'',''2008-11-04 00:00:00.000'',''2008-11-05 00:00:00.000'',''2008-11-06 00:00:00.000'',''2008-11-07 00:00:00.000'',''2008-11-08 00:00:00.000'',''2008-11-09 00:00:00.000'',''2008-11-10 00:00:00.000'',''2008-11-11 00:00:00.000'',''2008-11-12 00:00:00.000'',''2008-11-13 00:00:00.000'',''2008-11-14 00:00:00.000'',''2008-11-15 00:00:00.000'',''2008-11-16 00:00:00.000'',''2008-11-17 00:00:00.000'',''2008-11-18 00:00:00.000'',''2008-11-19 00:00:00.000'',''2008-11-20 00:00:00.000'',''2008-11-21 00:00:00.000'',''2008-11-22 00:00:00.000'',''2008-11-23 00:00:00.000'',''2008-11-24 00:00:00.000'',''2008-11-25 00:00:00.000'',''2008-11-26 00:00:00.000'',''2008-11-27 00:00:00.000'',''2008-11-28 00:00:00.000'',''2008-11-29 00:00:00.000'',''2008-11-30 00:00:00.000'',''2008-12-01 00:00:00.000'',''2008-12-02 00:00:00.000'',''2008-12-03 00:00:00.000'',''2008-12-04 00:00:00.000'',''2008-12-05 00:00:00.000'',''2008-12-06 00:00:00.000'',''2008-12-07 00:00:00.000'',''2008-12-08 00:00:00.000'',''2008-12-09 00:00:00.000'',''2008-12-10 00:00:00.000'',''2008-12-11 00:00:00.000'',''2008-12-12 00:00:00.000'',''2008-12-13 00:00:00.000'',''2008-12-14 00:00:00.000'',''2008-12-15 00:00:00.000'',''2008-12-16 00:00:00.000'',''2008-12-17 00:00:00.000'',''2008-12-18 00:00:00.000'',''2008-12-19 00:00:00.000'',''2008-12-20 00:00:00.000'',''2008-12-21 00:00:00.000'',''2008-12-22 00:00:00.000'',''2008-12-23 00:00:00.000'',''2008-12-24 00:00:00.000'',''2008-12-25 00:00:00.000'',''2008-12-26 00:00:00.000'',''2008-12-27 00:00:00.000'',''2008-12-28 00:00:00.000'',''2008-12-29 00:00:00.000'',''2008-12-30 00:00:00.000'',''2008-12-31 00:00:00.000'',''2009-01-01 00:00:00.000'',''2009-01-02 00:00:00.000'',''2009-01-03 00:00:00.000'',''2009-01-04 00:00:00.000'',''2009-01-05 00:00:00.000'',''2009-01-06 00:00:00.000'',''2009-01-07 00:00:00.000'',''2009-01-08 00:00:00.000'',''2009-01-09 00:00:00.000'',''2009-01-10 00:00:00.000'',''2009-01-11 00:00:00.000'',''2009-01-12 00:00:00.000'',''2009-01-13 00:00:00.000'',''2009-01-14 00:00:00.000'',''2009-01-15 00:00:00.000'',''2009-01-16 00:00:00.000'',''2009-01-17 00:00:00.000'',''2009-01-18 00:00:00.000'',''2009-01-19 00:00:00.000'',''2009-01-20 00:00:00.000'',''2009-01-21 00:00:00.000'',''2009-01-22 00:00:00.000'',''2009-01-23 00:00:00.000'',''2009-01-24 00:00:00.000'',''2009-01-25 00:00:00.000'',''2009-01-26 00:00:00.000'',''2009-01-27 00:00:00.000'',''2009-01-28 00:00:00.000'',''2009-01-29 00:00:00.000'',''2009-01-30 00:00:00.000'',''2009-01-31 00:00:00.000'',''2009-02-01 00:00:00.000'',''2009-02-02 00:00:00.000'',''2009-02-03 00:00:00.000'',''2009-02-04 00:00:00.000'',''2009-02-05 00:00:00.000'',''2009-02-06 00:00:00.000'',''2009-02-07 00:00:00.000'',''2009-02-08 00:00:00.000'',''2009-02-09 00:00:00.000'',''2009-02-10 00:00:00.000'',''2009-02-11 00:00:00.000'',''2009-02-12 00:00:00.000'',''2009-02-13 00:00:00.000'',''2009-02-14 00:00:00.000'',''2009-02-15 00:00:00.000'',''2009-02-16 00:00:00.000'',''2009-02-17 00:00:00.000'',''2009-02-18 00:00:00.000'',''2009-02-19 00:00:00.000'',''2009-02-20 00:00:00.000'',''2009-02-21 00:00:00.000'',''2009-02-22 00:00:00.000'',''2009-02-23 00:00:00.000'',''2009-02-24 00:00:00.000'',''2009-02-25 00:00:00.000'',''2009-02-26 00:00:00.000'',''2009-02-27 00:00:00.000'',''2009-02-28 00:00:00.000'',''2009-03-01 00:00:00.000'',''2009-03-02 00:00:00.000'',''2009-03-03 00:00:00.000'',''2009-03-04 00:00:00.000'',''2009-03-05 00:00:00.000'',''2009-03-06 00:00:00.000'',''2009-03-07 00:00:00.000'',''2009-03-08 00:00:00.000'',''2009-03-09 00:00:00.000'',''2009-03-10 00:00:00.000'',''2009-03-11 00:00:00.000'',''2009-03-12 00:00:00.000'',''2009-03-13 00:00:00.000'',''2009-03-14 00:00:00.000'',''2009-03-15 00:00:00.000'',''2009-03-16 00:00:00.000'',''2009-03-17 00:00:00.000'',''2009-03-18 00:00:00.000'',''2009-03-19 00:00:00.000'',''2009-03-20 00:00:00.000'',''2009-03-21 00:00:00.000'',''2009-03-22 00:00:00.000'',''2009-03-23 00:00:00.000'',''2009-03-24 00:00:00.000'',''2009-03-25 00:00:00.000'',''2009-03-26 00:00:00.000'',''2009-03-27 00:00:00.000'',''2009-03-28 00:00:00.000'',''2009-03-29 00:00:00.000'',''2009-03-30 00:00:00.000'',''2009-03-31 00:00:00.000'',''2009-04-01 00:00:00.000'',''2009-04-02 00:00:00.000'',''2009-04-03 00:00:00.000'',''2009-04-04 00:00:00.000'',''2009-04-05 00:00:00.000'',''2009-04-06 00:00:00.000'',''2009-04-07 00:00:00.000'',''2009-04-08 00:00:00.000'',''2009-04-09 00:00:00.000'',''2009-04-10 00:00:00.000'',''2009-04-11 00:00:00.000'',''2009-04-12 00:00:00.000'',''2009-04-13 00:00:00.000'',''2009-04-14 00:00:00.000'',''2009-04-15 00:00:00.000'',''2009-04-16 00:00:00.000'',''2009-04-17 00:00:00.000'',''2009-04-18 00:00:00.000'',''2009-04-19 00:00:00.000'',''2009-04-20 00:00:00.000'',''2009-04-21 00:00:00.000'',''2009-04-22 00:00:00.000'',''2009-04-23 00:00:00.000'',''2009-04-24 00:00:00.000'',''2009-04-25 00:00:00.000'',''2009-04-26 00:00:00.000'',''2009-04-27 00:00:00.000'',''2009-04-28 00:00:00.000'',''2009-04-29 00:00:00.000'',''2009-04-30 00:00:00.000'',''2009-05-01 00:00:00.000'',''2009-05-02 00:00:00.000'',''2009-05-03 00:00:00.000'',''2009-05-04 00:00:00.000'',''2009-05-05 00:00:00.000'',''2009-05-06 00:00:00.000'',''2009-05-07 00:00:00.000'',''2009-05-08 00:00:00.000'',''2009-05-09 00:00:00.000'',''2009-05-10 00:00:00.000'',''2009-05-11 00:00:00.000'',''2009-05-12 00:00:00.000'',''2009-05-13 00:00:00.000'',''2009-05-14 00:00:00.000'',''2009-05-15 00:00:00.000'',''2009-05-16 00:00:00.000'',''2009-05-17 00:00:00.000'',''2009-05-18 00:00:00.000'',''2009-05-19 00:00:00.000'',''2009-05-20 00:00:00.000'',''2009-05-21 00:00:00.000'',''2009-05-22 00:00:00.000'',''2009-05-23 00:00:00.000'',''2009-05-24 00:00:00.000'',''2009-05-25 00:00:00.000'',''2009-05-26 00:00:00.000'',''2009-05-27 00:00:00.000'',''2009-05-28 00:00:00.000'',''2009-05-29 00:00:00.000'',''2009-05-30 00:00:00.000'',''2009-05-31 00:00:00.000'',''2009-06-01 00:00:00.000'',''2009-06-02 00:00:00.000'',''2009-06-03 00:00:00.000'',''2009-06-04 00:00:00.000'',''2009-06-05 00:00:00.000'',''2009-06-06 00:00:00.000'',''2009-06-07 00:00:00.000'',''2009-06-08 00:00:00.000'',''2009-06-09 00:00:00.000'',''2009-06-10 00:00:00.000'',''2009-06-11 00:00:00.000'',''2009-06-12 00:00:00.000'',''2009-06-13 00:00:00.000'',''2009-06-14 00:00:00.000'',''2009-06-15 00:00:00.000'',''2009-06-16 00:00:00.000'',''2009-06-17 00:00:00.000'',''2009-06-18 00:00:00.000'',''2009-06-19 00:00:00.000'',''2009-06-20 00:00:00.000'',''2009-06-21 00:00:00.000'',''2009-06-22 00:00:00.000'',''2009-06-23 00:00:00.000'',''2009-06-24 00:00:00.000'',''2009-06-25 00:00:00.000'',''2009-06-26 00:00:00.000'',''2009-06-27 00:00:00.000'',''2009-06-28 00:00:00.000'',''2009-06-29 00:00:00.000'',''2009-06-30 00:00:00.000'',''2009-07-01 00:00:00.000'',''2009-07-02 00:00:00.000'',''2009-07-03 00:00:00.000'',''2009-07-04 00:00:00.000'',''2009-07-05 00:00:00.000'',''2009-07-06 00:00:00.000'',''2009-07-07 00:00:00.000'',''2009-07-08 00:00:00.000'',''2009-07-09 00:00:00.000'',''2009-07-10 00:00:00.000'',''2009-07-11 00:00:00.000'',''2009-07-12 00:00:00.000'',''2009-07-13 00:00:00.000'',''2009-07-14 00:00:00.000'',''2009-07-15 00:00:00.000'',''2009-07-16 00:00:00.000'',''2009-07-17 00:00:00.000'',''2009-07-18 00:00:00.000'',''2009-07-19 00:00:00.000'',''2009-07-20 00:00:00.000'',''2009-07-21 00:00:00.000'',''2009-07-22 00:00:00.000'',''2009-07-23 00:00:00.000'',''2009-07-24 00:00:00.000'',''2009-07-25 00:00:00.000'',''2009-07-26 00:00:00.000'',''2009-07-27 00:00:00.000'',''2009-07-28 00:00:00.000'',''2009-07-29 00:00:00.000'',''2009-07-30 00:00:00.000'',''2009-07-31 00:00:00.000'',''2009-08-01 00:00:00.000'',''2009-08-02 00:00:00.000'',''2009-08-03 00:00:00.000'',''2009-08-04 00:00:00.000'',''2009-08-05 00:00:00.000'',''2009-08-06 00:00:00.000'',''2009-08-07 00:00:00.000'',''2009-08-08 00:00:00.000'',''2009-08-09 00:00:00.000'',''2009-08-10 00:00:00.000'',''2009-08-11 00:00:00.000'',''2009-08-12 00:00:00.000'',''2009-08-13 00:00:00.000'',''2009-08-14 00:00:00.000'',''2009-08-15 00:00:00.000'',''2009-08-16 00:00:00.000'',''2009-08-17 00:00:00.000'',''2009-08-18 00:00:00.000'',''2009-08-19 00:00:00.000'',''2009-08-20 00:00:00.000'',''2009-08-21 00:00:00.000'',''2009-08-22 00:00:00.000'',''2009-08-23 00:00:00.000'',''2009-08-24 00:00:00.000'',''2009-08-25 00:00:00.000'',''2009-08-26 00:00:00.000'',''2009-08-27 00:00:00.000'',''2009-08-28 00:00:00.000'',''2009-08-29 00:00:00.000'',''2009-08-30 00:00:00.000'',''2009-08-31 00:00:00.000'',''2009-09-01 00:00:00.000'',''2009-09-02 00:00:00.000'',''2009-09-03 00:00:00.000'',''2009-09-04 00:00:00.000'',''2009-09-05 00:00:00.000'',''2009-09-06 00:00:00.000'',''2009-09-07 00:00:00.000'',''2009-09-08 00:00:00.000'',''2009-09-09 00:00:00.000'',''2009-09-10 00:00:00.000'',''2009-09-11 00:00:00.000'',''2009-09-12 00:00:00.000'',''2009-09-13 00:00:00.000'',''2009-09-14 00:00:00.000'',''2009-09-15 00:00:00.000'',''2009-09-16 00:00:00.000'',''2009-09-17 00:00:00.000'',''2009-09-18 00:00:00.000'',''2009-09-19 00:00:00.000'',''2009-09-20 00:00:00.000'',''2009-09-21 00:00:00.000'',''2009-09-22 00:00:00.000'',''2009-09-23 00:00:00.000'',''2009-09-24 00:00:00.000'',''2009-09-25 00:00:00.000'',''2009-09-26 00:00:00.000'',''2009-09-27 00:00:00.000'',''2009-09-28 00:00:00.000'',''2009-09-29 00:00:00.000'',''2009-09-30 00:00:00.000'',''2009-10-01 00:00:00.000'',''2009-10-02 00:00:00.000'',''2009-10-03 00:00:00.000'',''2009-10-04 00:00:00.000'',''2009-10-05 00:00:00.000'',''2009-10-06 00:00:00.000'',''2009-10-07 00:00:00.000'',''2009-10-08 00:00:00.000'',''2009-10-09 00:00:00.000'',''2009-10-10 00:00:00.000'',''2009-10-11 00:00:00.000'',''2009-10-12 00:00:00.000'',''2009-10-13 00:00:00.000'',''2009-10-14 00:00:00.000'',''2009-10-15 00:00:00.000'',''2009-10-16 00:00:00.000'',''2009-10-17 00:00:00.000'',''2009-10-18 00:00:00.000'',''2009-10-19 00:00:00.000'',''2009-10-20 00:00:00.000'',''2009-10-21 00:00:00.000'',''2009-10-22 00:00:00.000'',''2009-10-23 00:00:00.000'',''2009-10-24 00:00:00.000'',''2009-10-25 00:00:00.000'',''2009-10-26 00:00:00.000'',''2009-10-27 00:00:00.000'',''2009-10-28 00:00:00.000'',''2009-10-29 00:00:00.000'',''2009-10-30 00:00:00.000'',''2009-10-31 00:00:00.000'',''2009-11-01 00:00:00.000'',''2009-11-02 00:00:00.000'',''2009-11-03 00:00:00.000'',''2009-11-04 00:00:00.000'',''2009-11-05 00:00:00.000'',''2009-11-06 00:00:00.000'',''2009-11-07 00:00:00.000'',''2009-11-08 00:00:00.000'',''2009-11-09 00:00:00.000'',''2009-11-10 00:00:00.000'',''2009-11-11 00:00:00.000'',''2009-11-12 00:00:00.000'',''2009-11-13 00:00:00.000'',''2009-11-14 00:00:00.000'',''2009-11-15 00:00:00.000'',''2009-11-16 00:00:00.000'',''2009-11-17 00:00:00.000'',''2009-11-18 00:00:00.000'',''2009-11-19 00:00:00.000'',''2009-11-20 00:00:00.000'',''2009-11-21 00:00:00.000'',''2009-11-22 00:00:00.000'',''2009-11-23 00:00:00.000'',''2009-11-24 00:00:00.000'',''2009-11-25 00:00:00.000'',''2009-11-26 00:00:00.000'',''2009-11-27 00:00:00.000'',''2009-11-28 00:00:00.000'',''2009-11-29 00:00:00.000'',''2009-11-30 00:00:00.000'',''2009-12-01 00:00:00.000'',''2009-12-02 00:00:00.000'',''2009-12-03 00:00:00.000'',''2009-12-04 00:00:00.000'',''2009-12-05 00:00:00.000'',''2009-12-06 00:00:00.000'',''2009-12-07 00:00:00.000'',''2009-12-08 00:00:00.000'',''2009-12-09 00:00:00.000'',''2009-12-10 00:00:00.000'',''2009-12-11 00:00:00.000'',''2009-12-12 00:00:00.000'',''2009-12-13 00:00:00.000'',''2009-12-14 00:00:00.000'',''2009-12-15 00:00:00.000'',''2009-12-16 00:00:00.000'',''2009-12-17 00:00:00.000'',''2009-12-18 00:00:00.000'',''2009-12-19 00:00:00.000'',''2009-12-20 00:00:00.000'',''2009-12-21 00:00:00.000'',''2009-12-22 00:00:00.000'',''2009-12-23 00:00:00.000'',''2009-12-24 00:00:00.000'',''2009-12-25 00:00:00.000'',''2009-12-26 00:00:00.000'',''2009-12-27 00:00:00.000'',''2009-12-28 00:00:00.000'',''2009-12-29 00:00:00.000'',''2009-12-30 00:00:00.000'')">
                                                <Intrinsic FunctionName="RangePartitionNew">
                                                  <ScalarOperator>
                                                    <Identifier>
                                                      <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="Datekey" />
                                                    </Identifier>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Const ConstValue="(1)" />
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Const ConstValue="''2007-01-02 00:00:00.000''" />
                                                  </ScalarOperator>
                                                </Intrinsic>
                                              </ScalarOperator>
                                              <ScalarOperator ScalarString="[Contoso].[dbo].[DimDate].[Datekey] as [ddd].[Datekey]">
                                                <Identifier>    
                                                  <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[DimDate]" Alias="[ddd]" Column="Datekey" />
                                                </Identifier>
                                              </ScalarOperator>
                                            </RangeExpressions>
                                          </Prefix>
                                        </SeekKeys>
                                      </SeekPredicateNew>
                                    </SeekPredicates>
                                  </IndexScan>
                                </RelOp>
                              </NestedLoops>
                            </RelOp>   
                          </StreamAggregate>
                        </RelOp>
                      </Parallelism>   
                    </RelOp>
                  </StreamAggregate>
                </RelOp>
              </ComputeScalar>
            </RelOp>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="3" StatementEstRows="1" StatementId="2" StatementOptmLevel="FULL" CardinalityEstimationModelVersion="70" StatementSubTreeCost="26.2332" StatementText="SELECT COUNT(*) &#xD;&#xA;FROM FactOnlineSales fcto" StatementType="SELECT" QueryHash="0xA2B711803E93AB62" QueryPlanHash="0x4FF3C1AE5FAF1E18" RetrievedFromCache="true" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="8" MemoryGrant="136" CachedPlanSize="24" CompileTime="5" CompileCPU="5" CompileMemory="968">
            <ThreadStat Branches="1" UsedThreads="8">
              <ThreadReservation NodeId="0" ReservedThreads="8" />
            </ThreadStat>
            <MemoryGrantInfo SerialRequiredMemory="0" SerialDesiredMemory="0" RequiredMemory="136" DesiredMemory="136" RequestedMemory="136" GrantWaitTime="0" GrantedMemory="136" MaxUsedMemory="136" MaxQueryMemory="723240" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="3248368" />
            <WaitStats>
              <Wait WaitType="PAGEIOLATCH_SH" WaitTimeMs="46801" WaitCount="385" />
              <Wait WaitType="CXPACKET" WaitTimeMs="7102" WaitCount="9" />
              <Wait WaitType="MEMORY_ALLOCATION_EXT" WaitTimeMs="465" WaitCount="28292" />
              <Wait WaitType="LATCH_SH" WaitTimeMs="53" WaitCount="6" />
              <Wait WaitType="LATCH_EX" WaitTimeMs="12" WaitCount="12" />
              <Wait WaitType="SOS_SCHEDULER_YIELD" WaitTimeMs="10" WaitCount="953" />
              <Wait WaitType="SESSION_WAIT_STATS_CHILDREN" WaitTimeMs="2" WaitCount="9" />
            </WaitStats>
            <QueryTimeStats CpuTime="4566" ElapsedTime="6499" />
            <RelOp AvgRowSize="11" EstimateCPU="1E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="1" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="26.2332">
              <OutputList>
                <ColumnReference Column="Expr1001" />
              </OutputList>
              <ComputeScalar>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1001" />
                    <ScalarOperator ScalarString="CONVERT_IMPLICIT(int,[globalagg1004],0)">
                      <Convert DataType="int" Style="0" Implicit="true">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Column="globalagg1004" />
                          </Identifier>
                        </ScalarOperator>
                      </Convert>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="15" EstimateCPU="2.9E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="2" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="26.2332">
                  <OutputList>
                    <ColumnReference Column="globalagg1004" />
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6498" ActualCPUms="0" />
                  </RunTimeInformation>
                  <StreamAggregate>
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="globalagg1004" />
                        <ScalarOperator ScalarString="SUM([partialagg1003])">
                          <Aggregate AggType="SUM" Distinct="false">
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Column="partialagg1003" />
                              </Identifier>
                            </ScalarOperator>
                          </Aggregate>
                        </ScalarOperator>
                      </DefinedValue>
                    </DefinedValues>
                    <RelOp AvgRowSize="15" EstimateCPU="0.0285021" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="4" LogicalOp="Gather Streams" NodeId="3" Parallel="true" PhysicalOp="Parallelism" EstimatedTotalSubtreeCost="26.2332">
                      <OutputList>
                        <ColumnReference Column="partialagg1003" />
                      </OutputList>
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="8" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6498" ActualCPUms="0" />
                      </RunTimeInformation>
                      <Parallelism>
                        <RelOp AvgRowSize="15" EstimateCPU="1.89414" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="4" LogicalOp="Aggregate" NodeId="4" Parallel="true" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="26.2047">
                          <OutputList>   
                            <ColumnReference Column="partialagg1003" />
                          </OutputList>
                          <RunTimeInformation>
                            <RunTimeCountersPerThread Thread="8" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6463" ActualCPUms="579" />
                            <RunTimeCountersPerThread Thread="7" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6434" ActualCPUms="500" />
                            <RunTimeCountersPerThread Thread="6" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6355" ActualCPUms="491" />
                            <RunTimeCountersPerThread Thread="5" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6449" ActualCPUms="616" />
                            <RunTimeCountersPerThread Thread="4" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6487" ActualCPUms="718" />
                            <RunTimeCountersPerThread Thread="3" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6378" ActualCPUms="444" />
                            <RunTimeCountersPerThread Thread="2" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6375" ActualCPUms="715" />
                            <RunTimeCountersPerThread Thread="1" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6371" ActualCPUms="496" />
                            <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                          </RunTimeInformation>
                          <StreamAggregate>
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Column="partialagg1003" />
                                <ScalarOperator ScalarString="Count(*)">
                                  <Aggregate AggType="countstar" Distinct="false" />
                                </ScalarOperator>
                              </DefinedValue>
                            </DefinedValues>
                            <RelOp AvgRowSize="9" EstimateCPU="3.47263" EstimateIO="20.8379" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="12627600" EstimatedRowsRead="12627600" LogicalOp="Index Scan" NodeId="5" Parallel="true" PhysicalOp="Index Scan" EstimatedTotalSubtreeCost="24.3106" TableCardinality="12627600">
                              <OutputList />
                              <RunTimeInformation>
                                <RunTimeCountersPerThread Thread="8" ActualRows="1624348" ActualRowsRead="1624348" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6332" ActualCPUms="447" ActualScans="1" ActualLogicalReads="3671" ActualPhysicalReads="0" ActualReadAheads="3654" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="7" ActualRows="1406762" ActualRowsRead="1406762" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6309" ActualCPUms="375" ActualScans="1" ActualLogicalReads="3171" ActualPhysicalReads="0" ActualReadAheads="3142" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="6" ActualRows="1402703" ActualRowsRead="1402703" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6235" ActualCPUms="371" ActualScans="1" ActualLogicalReads="3162" ActualPhysicalReads="0" ActualReadAheads="3140" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="5" ActualRows="1741582" ActualRowsRead="1741582" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6309" ActualCPUms="475" ActualScans="1" ActualLogicalReads="3924" ActualPhysicalReads="0" ActualReadAheads="3875" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="4" ActualRows="1939655" ActualRowsRead="1939655" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6315" ActualCPUms="545" ActualScans="1" ActualLogicalReads="4368" ActualPhysicalReads="0" ActualReadAheads="4326" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />   
                                <RunTimeCountersPerThread Thread="3" ActualRows="1228123" ActualRowsRead="1228123" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6260" ActualCPUms="325" ActualScans="1" ActualLogicalReads="2768" ActualPhysicalReads="0" ActualReadAheads="2734" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="2" ActualRows="1901515" ActualRowsRead="1901515" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6203" ActualCPUms="543" ActualScans="1" ActualLogicalReads="4282" ActualPhysicalReads="0" ActualReadAheads="4232" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="1" ActualRows="1382920" ActualRowsRead="1382920" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6261" ActualCPUms="386" ActualScans="1" ActualLogicalReads="3116" ActualPhysicalReads="0" ActualReadAheads="3072" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="1" ActualLogicalReads="2" ActualPhysicalReads="1" ActualReadAheads="73" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                              </RunTimeInformation>
                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                <DefinedValues />
                                <Object Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSales]" Index="[IX_FACTONLINESALES_DateKey]" Alias="[fcto]" IndexKind="NonClustered" Storage="RowStore" />
                              </IndexScan>
                            </RelOp>
                          </StreamAggregate>
                        </RelOp>
                      </Parallelism>
                    </RelOp>
                  </StreamAggregate>
                </RelOp>
              </ComputeScalar>   
            </RelOp>   
          </QueryPlan>
        </StmtSimple>
      </Statements>   
    </Batch>
  </BatchSequence>   
</ShowPlanXML>'

EXEC StatisticsAnalysis @sttcs, @plan 

SELECT	* 
FROM	##sttcslgc
ORDER BY Num   
