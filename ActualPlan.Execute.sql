SET ANSI_NULLS ON   
SET QUOTED_IDENTIFIER ON
SET NUMERIC_ROUNDABORT OFF
      
GO
   
DECLARE @plan XML = N'<?xml version="1.0" encoding="utf-16"?>
<ShowPlanXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XML   Schema" Version="1.539" Build="15.0.2000.5" xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan">
  <BatchSequence>
    <Batch>   
      <Statements>   
        <StmtSimple StatementCompId="4" StatementEstRows="1" StatementId="1" StatementOptmLevel="FULL" CardinalityEstimationModelVersion="150" StatementSubTreeCost="31.7731" StatementText="SELECT	COUNT(*) Count1&#xD;&#xA;FROM	FactOnlineSalesPartitioning fcto&#xD;&#xA;WHERE	fcto.DateKey &gt;= @parm1 &#xD;&#xA;AND		fcto.DateKey &lt;= @parm2" StatementType="SELECT" QueryHash="0x219AEFEE9C81A99E" QueryPlanHash="0x6088CE1DC76D5BE4" RetrievedFromCache="true" SecurityPolicyApplied="false" BatchModeOnRowStoreUsed="true">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />              
          <QueryPlan DegreeOfParallelism="8" MemoryGrant="24776" CachedPlanSize="152" CompileTime="207" CompileCPU="163" CompileMemory="3600">
            <ThreadStat Branches="1" UsedThreads="8">   
              <ThreadReservation NodeId="0" ReservedThreads="9" />   
            </ThreadStat>
            <MemoryGrantInfo SerialRequiredMemory="3072" SerialDesiredMemory="3104" RequiredMemory="24712" DesiredMemory="24776" RequestedMemory="24776" GrantWaitTime="0" GrantedMemory="24776" MaxUsedMemory="3000" MaxQueryMemory="1066040" LastRequestedMemory="0" IsMemoryGrantFeedbackAdjusted="No: First Execution" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="4331840" />
            <WaitStats>
              <Wait WaitType="PAGEIOLATCH_SH" WaitTimeMs="219756" WaitCount="1822" />                                                                                                                                                                                                                                                                                            
              <Wait WaitType="MEMORY_ALLOCATION_EXT" WaitTimeMs="4030" WaitCount="208734" />             
              <Wait WaitType="HTBUILD" WaitTimeMs="1899" WaitCount="14" />   
              <Wait WaitType="SOS_SCHEDULER_YIELD" WaitTimeMs="40" WaitCount="712" />   
              <Wait WaitType="CXROWSET_SYNC" WaitTimeMs="9" WaitCount="37" />
              <Wait WaitType="HTDELETE" WaitTimeMs="4" WaitCount="14" />
              <Wait WaitType="SESSION_WAIT_STATS_CHILDREN" WaitTimeMs="4" WaitCount="7" />   
              <Wait WaitType="CXPACKET" WaitTimeMs="3" WaitCount="9" />
              <Wait WaitType="EXECSYNC" WaitTimeMs="3" WaitCount="9" />         
              <Wait WaitType="RESERVED_MEMORY_ALLOCATION_EXT" WaitTimeMs="2" WaitCount="182" />                                                                         
            </WaitStats>
            <QueryTimeStats CpuTime="11398" ElapsedTime="29138" />
               <RelOp AvgRowSize="11" EstimateCPU="0.0285019" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Gather Streams" NodeId="0" Parallel="true" PhysicalOp="Parallelism" EstimatedTotalSubtreeCost="31.4377">                                                                                                      
              <OutputList>
                <ColumnReference Column="Expr1002" />
              </OutputList>
              <RunTimeInformation>
                <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="29123" ActualCPUms="0" />
              </RunTimeInformation>
              <Parallelism>
                <RelOp AvgRowSize="11" EstimateCPU="0" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="1" Parallel="true" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="31.6956">
                  <OutputList>
                    <ColumnReference Column="Expr1002" />                        
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="8" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />                                                                             
                    <RunTimeCountersPerThread Thread="7" ActualRows="1" Batches="1" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                    <RunTimeCountersPerThread Thread="6" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />   
                    <RunTimeCountersPerThread Thread="5" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />   
                    <RunTimeCountersPerThread Thread="4" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />                                                                                                                                                                                       
                    <RunTimeCountersPerThread Thread="3" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />   
                    <RunTimeCountersPerThread Thread="2" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                    <RunTimeCountersPerThread Thread="1" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                    <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                  </RunTimeInformation>   
                  <ComputeScalar>
                    <DefinedValues>   
                      <DefinedValue>
                        <ColumnReference Column="Expr1002" />
                        <ScalarOperator ScalarString="CONVERT_IMPLICIT(int,[Expr1005],0)">
                          <Convert DataType="int" Style="0" Implicit="true">
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Column="Expr1005" />
                              </Identifier>
                            </ScalarOperator>
                          </Convert>
                        </ScalarOperator>
                      </DefinedValue>
                    </DefinedValues>
                    <RelOp AvgRowSize="11" EstimateCPU="0.0225244" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Aggregate" NodeId="2" Parallel="true" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="31.6956">
                      <OutputList>
                        <ColumnReference Column="Expr1005" />
                      </OutputList>
                      <MemoryFractions Input="1" Output="1" />
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="8" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="273" ActualCPUms="2" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="7" ActualRows="1" Batches="1" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="74" ActualCPUms="2" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="6" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="322" ActualCPUms="3" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="5" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="292" ActualCPUms="3" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="4" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="5" ActualCPUms="3" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="3" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="232" ActualCPUms="2" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="2" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="384" ActualCPUms="7" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="1" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="357" ActualCPUms="3" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                      </RunTimeInformation>
                      <Hash>
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Expr1005" />
                            <ScalarOperator ScalarString="COUNT(*)">
                              <Aggregate AggType="COUNT*" Distinct="false" />
                            </ScalarOperator>
                          </DefinedValue>
                        </DefinedValues>
                        <HashKeysBuild />
                        <RelOp AvgRowSize="9" EstimateCPU="0.590112" EstimateIO="31.083" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="2074930" EstimatedRowsRead="2074930" LogicalOp="Clustered Index Seek" NodeId="3" Parallel="true" Partitioned="true" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="31.6731" TableCardinality="12627600">
                          <OutputList />
                          <RunTimeInformation>
                            <RunTimeCountersPerThread Thread="8" ActualRows="964518" Batches="1110" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="28848" ActualCPUms="1159" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="7" ActualRows="819794" Batches="945" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="29047" ActualCPUms="1118" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="6" ActualRows="890292" Batches="1027" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="28799" ActualCPUms="1284" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="5" ActualRows="889925" Batches="1024" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="28828" ActualCPUms="1053" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="4" ActualRows="919885" Batches="1059" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="29116" ActualCPUms="1506" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="3" ActualRows="889722" Batches="1029" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="28889" ActualCPUms="1510" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="2" ActualRows="3695717" Batches="4121" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="28734" ActualCPUms="2982" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="1" ActualRows="917498" Batches="1055" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="28763" ActualCPUms="1022" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                          </RunTimeInformation>
                          <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                            <DefinedValues />
                            <Object Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Index="[PK_FactOnlineSalesPartitioning_SalesKey]" Alias="[fcto]" IndexKind="Clustered" Storage="RowStore" />
                            <SeekPredicates>
                              <SeekPredicateNew>
                                <SeekKeys>
                                  <StartRange ScanType="GE">
                                    <RangeColumns>
                                      <ColumnReference Column="PtnId1000" />
                                    </RangeColumns>
                                    <RangeExpressions>
                                      <ScalarOperator ScalarString="RangePartitionNew([@parm1],(1),''2007-06-30 00:00:00.000'',''2007-01-03 00:00:00.000'',''2007-01-04 00:00:00.000'',''2007-01-05 00:00:00.000'',''2007-01-06 00:00:00.000'',''2007-01-07 00:00:00.000'',''2007-01-08 00:00:00.000'',''2007-01-09 00:00:00.000'',''2007-01-10 00:00:00.000'',''2007-01-11 00:00:00.000'',''2007-01-12 00:00:00.000'',''2007-01-13 00:00:00.000'',''2007-01-14 00:00:00.000'',''2007-01-15 00:00:00.000'',''2007-01-16 00:00:00.000'',''2007-01-17 00:00:00.000'',''2007-01-18 00:00:00.000'',''2007-01-19 00:00:00.000'',''2007-01-20 00:00:00.000'',''2007-01-21 00:00:00.000'',''2007-01-22 00:00:00.000'',''2007-01-23 00:00:00.000'',''2007-01-24 00:00:00.000'',''2007-01-25 00:00:00.000'',''2007-01-26 00:00:00.000'',''2007-01-27 00:00:00.000'',''2007-01-28 00:00:00.000'',''2007-01-29 00:00:00.000'',''2007-01-30 00:00:00.000'',''2007-01-31 00:00:00.000'',''2007-02-01 00:00:00.000'',''2007-02-02 00:00:00.000'',''2007-02-03 00:00:00.000'',''2007-02-04 00:00:00.000'',''2007-02-05 00:00:00.000'',''2007-02-06 00:00:00.000'',''2007-02-07 00:00:00.000'',''2007-02-08 00:00:00.000'',''2007-02-09 00:00:00.000'',''2007-02-10 00:00:00.000'',''2007-02-11 00:00:00.000'',''2007-02-12 00:00:00.000'',''2007-02-13 00:00:00.000'',''2007-02-14 00:00:00.000'',''2007-02-15 00:00:00.000'',''2007-02-16 00:00:00.000'',''2007-02-17 00:00:00.000'',''2007-02-18 00:00:00.000'',''2007-02-19 00:00:00.000'',''2007-02-20 00:00:00.000'',''2007-02-21 00:00:00.000'',''2007-02-22 00:00:00.000'',''2007-02-23 00:00:00.000'',''2007-02-24 00:00:00.000'',''2007-02-25 00:00:00.000'',''2007-02-26 00:00:00.000'',''2007-02-27 00:00:00.000'',''2007-02-28 00:00:00.000'',''2007-03-01 00:00:00.000'',''2007-03-02 00:00:00.000'',''2007-03-03 00:00:00.000'',''2007-03-04 00:00:00.000'',''2007-03-05 00:00:00.000'',''2007-03-06 00:00:00.000'',''2007-03-07 00:00:00.000'',''2007-03-08 00:00:00.000'',''2007-03-09 00:00:00.000'',''2007-03-10 00:00:00.000'',''2007-03-11 00:00:00.000'',''2007-03-12 00:00:00.000'',''2007-03-13 00:00:00.000'',''2007-03-14 00:00:00.000'',''2007-03-15 00:00:00.000'',''2007-03-16 00:00:00.000'',''2007-03-17 00:00:00.000'',''2007-03-18 00:00:00.000'',''2007-03-19 00:00:00.000'',''2007-03-20 00:00:00.000'',''2007-03-21 00:00:00.000'',''2007-03-22 00:00:00.000'',''2007-03-23 00:00:00.000'',''2007-03-24 00:00:00.000'',''2007-03-25 00:00:00.000'',''2007-03-26 00:00:00.000'',''2007-03-27 00:00:00.000'',''2007-03-28 00:00:00.000'',''2007-03-29 00:00:00.000'',''2007-03-30 00:00:00.000'',''2007-03-31 00:00:00.000'',''2007-04-01 00:00:00.000'',''2007-04-02 00:00:00.000'',''2007-04-03 00:00:00.000'',''2007-04-04 00:00:00.000'',''2007-04-05 00:00:00.000'',''2007-04-06 00:00:00.000'',''2007-04-07 00:00:00.000'',''2007-04-08 00:00:00.000'',''2007-04-09 00:00:00.000'',''2007-04-10 00:00:00.000'',''2007-04-11 00:00:00.000'',''2007-04-12 00:00:00.000'',''2007-04-13 00:00:00.000'',''2007-04-14 00:00:00.000'',''2007-04-15 00:00:00.000'',''2007-04-16 00:00:00.000'',''2007-04-17 00:00:00.000'',''2007-04-18 00:00:00.000'',''2007-04-19 00:00:00.000'',''2007-04-20 00:00:00.000'',''2007-04-21 00:00:00.000'',''2007-04-22 00:00:00.000'',''2007-04-23 00:00:00.000'',''2007-04-24 00:00:00.000'',''2007-04-25 00:00:00.000'',''2007-04-26 00:00:00.000'',''2007-04-27 00:00:00.000'',''2007-04-28 00:00:00.000'',''2007-04-29 00:00:00.000'',''2007-04-30 00:00:00.000'',''2007-05-01 00:00:00.000'',''2007-05-02 00:00:00.000'',''2007-05-03 00:00:00.000'',''2007-05-04 00:00:00.000'',''2007-05-05 00:00:00.000'',''2007-05-06 00:00:00.000'',''2007-05-07 00:00:00.000'',''2007-05-08 00:00:00.000'',''2007-05-09 00:00:00.000'',''2007-05-10 00:00:00.000'',''2007-05-11 00:00:00.000'',''2007-05-12 00:00:00.000'',''2007-05-13 00:00:00.000'',''2007-05-14 00:00:00.000'',''2007-05-15 00:00:00.000'',''2007-05-16 00:00:00.000'',''2007-05-17 00:00:00.000'',''2007-05-18 00:00:00.000'',''2007-05-19 00:00:00.000'',''2007-05-20 00:00:00.000'',''2007-05-21 00:00:00.000'',''2007-05-22 00:00:00.000'',''2007-05-23 00:00:00.000'',''2007-05-24 00:00:00.000'',''2007-05-25 00:00:00.000'',''2007-05-26 00:00:00.000'',''2007-05-27 00:00:00.000'',''2007-05-28 00:00:00.000'',''2007-05-29 00:00:00.000'',''2007-05-30 00:00:00.000'',''2007-05-31 00:00:00.000'',''2007-06-01 00:00:00.000'',''2007-06-02 00:00:00.000'',''2007-06-03 00:00:00.000'',''2007-06-04 00:00:00.000'',''2007-06-05 00:00:00.000'',''2007-06-06 00:00:00.000'',''2007-06-07 00:00:00.000'',''2007-06-08 00:00:00.000'',''2007-06-09 00:00:00.000'',''2007-06-10 00:00:00.000'',''2007-06-11 00:00:00.000'',''2007-06-12 00:00:00.000'',''2007-06-13 00:00:00.000'',''2007-06-14 00:00:00.000'',''2007-06-15 00:00:00.000'',''2007-06-16 00:00:00.000'',''2007-06-17 00:00:00.000'',''2007-06-18 00:00:00.000'',''2007-06-19 00:00:00.000'',''2007-06-20 00:00:00.000'',''2007-06-21 00:00:00.000'',''2007-06-22 00:00:00.000'',''2007-06-23 00:00:00.000'',''2007-06-24 00:00:00.000'',''2007-06-25 00:00:00.000'',''2007-06-26 00:00:00.000'',''2007-06-27 00:00:00.000'',''2007-06-28 00:00:00.000'',''2007-06-29 00:00:00.000'',''2007-06-30 00:00:00.000'',''2007-07-01 00:00:00.000'',''2007-07-02 00:00:00.000'',''2007-07-03 00:00:00.000'',''2007-07-04 00:00:00.000'',''2007-07-05 00:00:00.000'',''2007-07-06 00:00:00.000'',''2007-07-07 00:00:00.000'',''2007-07-08 00:00:00.000'',''2007-07-09 00:00:00.000'',''2007-07-10 00:00:00.000'',''2007-07-11 00:00:00.000'',''2007-07-12 00:00:00.000'',''2007-07-13 00:00:00.000'',''2007-07-14 00:00:00.000'',''2007-07-15 00:00:00.000'',''2007-07-16 00:00:00.000'',''2007-07-17 00:00:00.000'',''2007-07-18 00:00:00.000'',''2007-07-19 00:00:00.000'',''2007-07-20 00:00:00.000'',''2007-07-21 00:00:00.000'',''2007-07-22 00:00:00.000'',''2007-07-23 00:00:00.000'',''2007-07-24 00:00:00.000'',''2007-07-25 00:00:00.000'',''2007-07-26 00:00:00.000'',''2007-07-27 00:00:00.000'',''2007-07-28 00:00:00.000'',''2007-07-29 00:00:00.000'',''2007-07-30 00:00:00.000'',''2007-07-31 00:00:00.000'',''2007-08-01 00:00:00.000'',''2007-08-02 00:00:00.000'',''2007-08-03 00:00:00.000'',''2007-08-04 00:00:00.000'',''2007-08-05 00:00:00.000'',''2007-08-06 00:00:00.000'',''2007-08-07 00:00:00.000'',''2007-08-08 00:00:00.000'',''2007-08-09 00:00:00.000'',''2007-08-10 00:00:00.000'',''2007-08-11 00:00:00.000'',''2007-08-12 00:00:00.000'',''2007-08-13 00:00:00.000'',''2007-08-14 00:00:00.000'',''2007-08-15 00:00:00.000'',''2007-08-16 00:00:00.000'',''2007-08-17 00:00:00.000'',''2007-08-18 00:00:00.000'',''2007-08-19 00:00:00.000'',''2007-08-20 00:00:00.000'',''2007-08-21 00:00:00.000'',''2007-08-22 00:00:00.000'',''2007-08-23 00:00:00.000'',''2007-08-24 00:00:00.000'',''2007-08-25 00:00:00.000'',''2007-08-26 00:00:00.000'',''2007-08-27 00:00:00.000'',''2007-08-28 00:00:00.000'',''2007-08-29 00:00:00.000'',''2007-08-30 00:00:00.000'',''2007-08-31 00:00:00.000'',''2007-09-01 00:00:00.000'',''2007-09-02 00:00:00.000'',''2007-09-03 00:00:00.000'',''2007-09-04 00:00:00.000'',''2007-09-05 00:00:00.000'',''2007-09-06 00:00:00.000'',''2007-09-07 00:00:00.000'',''2007-09-08 00:00:00.000'',''2007-09-09 00:00:00.000'',''2007-09-10 00:00:00.000'',''2007-09-11 00:00:00.000'',''2007-09-12 00:00:00.000'',''2007-09-13 00:00:00.000'',''2007-09-14 00:00:00.000'',''2007-09-15 00:00:00.000'',''2007-09-16 00:00:00.000'',''2007-09-17 00:00:00.000'',''2007-09-18 00:00:00.000'',''2007-09-19 00:00:00.000'',''2007-09-20 00:00:00.000'',''2007-09-21 00:00:00.000'',''2007-09-22 00:00:00.000'',''2007-09-23 00:00:00.000'',''2007-09-24 00:00:00.000'',''2007-09-25 00:00:00.000'',''2007-09-26 00:00:00.000'',''2007-09-27 00:00:00.000'',''2007-09-28 00:00:00.000'',''2007-09-29 00:00:00.000'',''2007-09-30 00:00:00.000'',''2007-10-01 00:00:00.000'',''2007-10-02 00:00:00.000'',''2007-10-03 00:00:00.000'',''2007-10-04 00:00:00.000'',''2007-10-05 00:00:00.000'',''2007-10-06 00:00:00.000'',''2007-10-07 00:00:00.000'',''2007-10-08 00:00:00.000'',''2007-10-09 00:00:00.000'',''2007-10-10 00:00:00.000'',''2007-10-11 00:00:00.000'',''2007-10-12 00:00:00.000'',''2007-10-13 00:00:00.000'',''2007-10-14 00:00:00.000'',''2007-10-15 00:00:00.000'',''2007-10-16 00:00:00.000'',''2007-10-17 00:00:00.000'',''2007-10-18 00:00:00.000'',''2007-10-19 00:00:00.000'',''2007-10-20 00:00:00.000'',''2007-10-21 00:00:00.000'',''2007-10-22 00:00:00.000'',''2007-10-23 00:00:00.000'',''2007-10-24 00:00:00.000'',''2007-10-25 00:00:00.000'',''2007-10-26 00:00:00.000'',''2007-10-27 00:00:00.000'',''2007-10-28 00:00:00.000'',''2007-10-29 00:00:00.000'',''2007-10-30 00:00:00.000'',''2007-10-31 00:00:00.000'',''2007-11-01 00:00:00.000'',''2007-11-02 00:00:00.000'',''2007-11-03 00:00:00.000'',''2007-11-04 00:00:00.000'',''2007-11-05 00:00:00.000'',''2007-11-06 00:00:00.000'',''2007-11-07 00:00:00.000'',''2007-11-08 00:00:00.000'',''2007-11-09 00:00:00.000'',''2007-11-10 00:00:00.000'',''2007-11-11 00:00:00.000'',''2007-11-12 00:00:00.000'',''2007-11-13 00:00:00.000'',''2007-11-14 00:00:00.000'',''2007-11-15 00:00:00.000'',''2007-11-16 00:00:00.000'',''2007-11-17 00:00:00.000'',''2007-11-18 00:00:00.000'',''2007-11-19 00:00:00.000'',''2007-11-20 00:00:00.000'',''2007-11-21 00:00:00.000'',''2007-11-22 00:00:00.000'',''2007-11-23 00:00:00.000'',''2007-11-24 00:00:00.000'',''2007-11-25 00:00:00.000'',''2007-11-26 00:00:00.000'',''2007-11-27 00:00:00.000'',''2007-11-28 00:00:00.000'',''2007-11-29 00:00:00.000'',''2007-11-30 00:00:00.000'',''2007-12-01 00:00:00.000'',''2008-11-02 00:00:00.000'',''2008-11-03 00:00:00.000'',''2008-11-04 00:00:00.000'',''2008-11-05 00:00:00.000'',''2008-11-06 00:00:00.000'',''2008-11-07 00:00:00.000'',''2008-11-08 00:00:00.000'',''2008-11-09 00:00:00.000'',''2008-11-10 00:00:00.000'',''2008-11-11 00:00:00.000'',''2008-11-12 00:00:00.000'',''2008-11-13 00:00:00.000'',''2008-11-14 00:00:00.000'',''2008-11-15 00:00:00.000'',''2008-11-16 00:00:00.000'',''2008-11-17 00:00:00.000'',''2008-11-18 00:00:00.000'',''2008-11-19 00:00:00.000'',''2008-11-20 00:00:00.000'',''2008-11-21 00:00:00.000'',''2008-11-22 00:00:00.000'',''2008-11-23 00:00:00.000'',''2008-11-24 00:00:00.000'',''2008-11-25 00:00:00.000'',''2008-11-26 00:00:00.000'',''2008-11-27 00:00:00.000'',''2008-11-28 00:00:00.000'',''2008-11-29 00:00:00.000'',''2008-11-30 00:00:00.000'',''2008-12-01 00:00:00.000'',''2008-12-02 00:00:00.000'',''2008-12-03 00:00:00.000'',''2008-12-04 00:00:00.000'',''2008-12-05 00:00:00.000'',''2008-12-06 00:00:00.000'',''2008-12-07 00:00:00.000'',''2008-12-08 00:00:00.000'',''2008-12-09 00:00:00.000'',''2008-12-10 00:00:00.000'',''2008-12-11 00:00:00.000'',''2008-12-12 00:00:00.000'',''2008-12-13 00:00:00.000'',''2008-12-14 00:00:00.000'',''2008-12-15 00:00:00.000'',''2008-12-16 00:00:00.000'',''2008-12-17 00:00:00.000'',''2008-12-18 00:00:00.000'',''2008-12-19 00:00:00.000'',''2008-12-20 00:00:00.000'',''2008-12-21 00:00:00.000'',''2008-12-22 00:00:00.000'',''2008-12-23 00:00:00.000'',''2008-12-24 00:00:00.000'',''2008-12-25 00:00:00.000'',''2008-12-26 00:00:00.000'',''2008-12-27 00:00:00.000'',''2008-12-28 00:00:00.000'',''2008-12-29 00:00:00.000'',''2008-12-30 00:00:00.000'',''2008-12-31 00:00:00.000'',''2009-01-01 00:00:00.000'',''2009-01-02 00:00:00.000'',''2009-01-03 00:00:00.000'',''2009-01-04 00:00:00.000'',''2009-01-05 00:00:00.000'',''2009-01-06 00:00:00.000'',''2009-01-07 00:00:00.000'',''2009-01-08 00:00:00.000'',''2009-01-09 00:00:00.000'',''2009-01-10 00:00:00.000'',''2009-01-11 00:00:00.000'',''2009-01-12 00:00:00.000'',''2009-01-13 00:00:00.000'',''2009-01-14 00:00:00.000'',''2009-01-15 00:00:00.000'',''2009-01-16 00:00:00.000'',''2009-01-17 00:00:00.000'',''2009-01-18 00:00:00.000'',''2009-01-19 00:00:00.000'',''2009-01-20 00:00:00.000'',''2009-01-21 00:00:00.000'',''2009-01-22 00:00:00.000'',''2009-01-23 00:00:00.000'',''2009-01-24 00:00:00.000'',''2009-01-25 00:00:00.000'',''2009-01-26 00:00:00.000'',''2009-01-27 00:00:00.000'',''2009-01-28 00:00:00.000'',''2009-01-29 00:00:00.000'',''2009-01-30 00:00:00.000'',''2009-01-31 00:00:00.000'',''2009-02-01 00:00:00.000'',''2009-02-02 00:00:00.000'',''2009-02-03 00:00:00.000'',''2009-02-04 00:00:00.000'',''2009-02-05 00:00:00.000'',''2009-02-06 00:00:00.000'',''2009-02-07 00:00:00.000'',''2009-02-08 00:00:00.000'',''2009-02-09 00:00:00.000'',''2009-02-10 00:00:00.000'',''2009-02-11 00:00:00.000'',''2009-02-12 00:00:00.000'',''2009-02-13 00:00:00.000'',''2009-02-14 00:00:00.000'',''2009-02-15 00:00:00.000'',''2009-02-16 00:00:00.000'',''2009-02-17 00:00:00.000'',''2009-02-18 00:00:00.000'',''2009-02-19 00:00:00.000'',''2009-02-20 00:00:00.000'',''2009-02-21 00:00:00.000'',''2009-02-22 00:00:00.000'',''2009-02-23 00:00:00.000'',''2009-02-24 00:00:00.000'',''2009-02-25 00:00:00.000'',''2009-02-26 00:00:00.000'',''2009-02-27 00:00:00.000'',''2009-02-28 00:00:00.000'',''2009-03-01 00:00:00.000'',''2009-03-02 00:00:00.000'',''2009-03-03 00:00:00.000'',''2009-03-04 00:00:00.000'',''2009-03-05 00:00:00.000'',''2009-03-06 00:00:00.000'',''2009-03-07 00:00:00.000'',''2009-03-08 00:00:00.000'',''2009-03-09 00:00:00.000'',''2009-03-10 00:00:00.000'',''2009-03-11 00:00:00.000'',''2009-03-12 00:00:00.000'',''2009-03-13 00:00:00.000'',''2009-03-14 00:00:00.000'',''2009-03-15 00:00:00.000'',''2009-03-16 00:00:00.000'',''2009-03-17 00:00:00.000'',''2009-03-18 00:00:00.000'',''2009-03-19 00:00:00.000'',''2009-03-20 00:00:00.000'',''2009-03-21 00:00:00.000'',''2009-03-22 00:00:00.000'',''2009-03-23 00:00:00.000'',''2009-03-24 00:00:00.000'',''2009-03-25 00:00:00.000'',''2009-03-26 00:00:00.000'',''2009-03-27 00:00:00.000'',''2009-03-28 00:00:00.000'',''2009-03-29 00:00:00.000'',''2009-03-30 00:00:00.000'',''2009-03-31 00:00:00.000'',''2009-04-01 00:00:00.000'',''2009-04-02 00:00:00.000'',''2009-04-03 00:00:00.000'',''2009-04-04 00:00:00.000'',''2009-04-05 00:00:00.000'',''2009-04-06 00:00:00.000'',''2009-04-07 00:00:00.000'',''2009-04-08 00:00:00.000'',''2009-04-09 00:00:00.000'',''2009-04-10 00:00:00.000'',''2009-04-11 00:00:00.000'',''2009-04-12 00:00:00.000'',''2009-04-13 00:00:00.000'',''2009-04-14 00:00:00.000'',''2009-04-15 00:00:00.000'',''2009-04-16 00:00:00.000'',''2009-04-17 00:00:00.000'',''2009-04-18 00:00:00.000'',''2009-04-19 00:00:00.000'',''2009-04-20 00:00:00.000'',''2009-04-21 00:00:00.000'',''2009-04-22 00:00:00.000'',''2009-04-23 00:00:00.000'',''2009-04-24 00:00:00.000'',''2009-04-25 00:00:00.000'',''2009-04-26 00:00:00.000'',''2009-04-27 00:00:00.000'',''2009-04-28 00:00:00.000'',''2009-04-29 00:00:00.000'',''2009-04-30 00:00:00.000'',''2009-05-01 00:00:00.000'',''2009-05-02 00:00:00.000'',''2009-05-03 00:00:00.000'',''2009-05-04 00:00:00.000'',''2009-05-05 00:00:00.000'',''2009-05-06 00:00:00.000'',''2009-05-07 00:00:00.000'',''2009-05-08 00:00:00.000'',''2009-05-09 00:00:00.000'',''2009-05-10 00:00:00.000'',''2009-05-11 00:00:00.000'',''2009-05-12 00:00:00.000'',''2009-05-13 00:00:00.000'',''2009-05-14 00:00:00.000'',''2009-05-15 00:00:00.000'',''2009-05-16 00:00:00.000'',''2009-05-17 00:00:00.000'',''2009-05-18 00:00:00.000'',''2009-05-19 00:00:00.000'',''2009-05-20 00:00:00.000'',''2009-05-21 00:00:00.000'',''2009-05-22 00:00:00.000'',''2009-05-23 00:00:00.000'',''2009-05-24 00:00:00.000'',''2009-05-25 00:00:00.000'',''2009-05-26 00:00:00.000'',''2009-05-27 00:00:00.000'',''2009-05-28 00:00:00.000'',''2009-05-29 00:00:00.000'',''2009-05-30 00:00:00.000'',''2009-05-31 00:00:00.000'',''2009-06-01 00:00:00.000'',''2009-06-02 00:00:00.000'',''2009-06-03 00:00:00.000'',''2009-06-04 00:00:00.000'',''2009-06-05 00:00:00.000'',''2009-06-06 00:00:00.000'',''2009-06-07 00:00:00.000'',''2009-06-08 00:00:00.000'',''2009-06-09 00:00:00.000'',''2009-06-10 00:00:00.000'',''2009-06-11 00:00:00.000'',''2009-06-12 00:00:00.000'',''2009-06-13 00:00:00.000'',''2009-06-14 00:00:00.000'',''2009-06-15 00:00:00.000'',''2009-06-16 00:00:00.000'',''2009-06-17 00:00:00.000'',''2009-06-18 00:00:00.000'',''2009-06-19 00:00:00.000'',''2009-06-20 00:00:00.000'',''2009-06-21 00:00:00.000'',''2009-06-22 00:00:00.000'',''2009-06-23 00:00:00.000'',''2009-06-24 00:00:00.000'',''2009-06-25 00:00:00.000'',''2009-06-26 00:00:00.000'',''2009-06-27 00:00:00.000'',''2009-06-28 00:00:00.000'',''2009-06-29 00:00:00.000'',''2009-06-30 00:00:00.000'',''2009-07-01 00:00:00.000'',''2009-07-02 00:00:00.000'',''2009-07-03 00:00:00.000'',''2009-07-04 00:00:00.000'',''2009-07-05 00:00:00.000'',''2009-07-06 00:00:00.000'',''2009-07-07 00:00:00.000'',''2009-07-08 00:00:00.000'',''2009-07-09 00:00:00.000'',''2009-07-10 00:00:00.000'',''2009-07-11 00:00:00.000'',''2009-07-12 00:00:00.000'',''2009-07-13 00:00:00.000'',''2009-07-14 00:00:00.000'',''2009-07-15 00:00:00.000'',''2009-07-16 00:00:00.000'',''2009-07-17 00:00:00.000'',''2009-07-18 00:00:00.000'',''2009-07-19 00:00:00.000'',''2009-07-20 00:00:00.000'',''2009-07-21 00:00:00.000'',''2009-07-22 00:00:00.000'',''2009-07-23 00:00:00.000'',''2009-07-24 00:00:00.000'',''2009-07-25 00:00:00.000'',''2009-07-26 00:00:00.000'',''2009-07-27 00:00:00.000'',''2009-07-28 00:00:00.000'',''2009-07-29 00:00:00.000'',''2009-07-30 00:00:00.000'',''2009-07-31 00:00:00.000'',''2009-08-01 00:00:00.000'',''2009-08-02 00:00:00.000'',''2009-08-03 00:00:00.000'',''2009-08-04 00:00:00.000'',''2009-08-05 00:00:00.000'',''2009-08-06 00:00:00.000'',''2009-08-07 00:00:00.000'',''2009-08-08 00:00:00.000'',''2009-08-09 00:00:00.000'',''2009-08-10 00:00:00.000'',''2009-08-11 00:00:00.000'',''2009-08-12 00:00:00.000'',''2009-08-13 00:00:00.000'',''2009-08-14 00:00:00.000'',''2009-08-15 00:00:00.000'',''2009-08-16 00:00:00.000'',''2009-08-17 00:00:00.000'',''2009-08-18 00:00:00.000'',''2009-08-19 00:00:00.000'',''2009-08-20 00:00:00.000'',''2009-08-21 00:00:00.000'',''2009-08-22 00:00:00.000'',''2009-08-23 00:00:00.000'',''2009-08-24 00:00:00.000'',''2009-08-25 00:00:00.000'',''2009-08-26 00:00:00.000'',''2009-08-27 00:00:00.000'',''2009-08-28 00:00:00.000'',''2009-08-29 00:00:00.000'',''2009-08-30 00:00:00.000'',''2009-08-31 00:00:00.000'',''2009-09-01 00:00:00.000'',''2009-09-02 00:00:00.000'',''2009-09-03 00:00:00.000'',''2009-09-04 00:00:00.000'',''2009-09-05 00:00:00.000'',''2009-09-06 00:00:00.000'',''2009-09-07 00:00:00.000'',''2009-09-08 00:00:00.000'',''2009-09-09 00:00:00.000'',''2009-09-10 00:00:00.000'',''2009-09-11 00:00:00.000'',''2009-09-12 00:00:00.000'',''2009-09-13 00:00:00.000'',''2009-09-14 00:00:00.000'',''2009-09-15 00:00:00.000'',''2009-09-16 00:00:00.000'',''2009-09-17 00:00:00.000'',''2009-09-18 00:00:00.000'',''2009-09-19 00:00:00.000'',''2009-09-20 00:00:00.000'',''2009-09-21 00:00:00.000'',''2009-09-22 00:00:00.000'',''2009-09-23 00:00:00.000'',''2009-09-24 00:00:00.000'',''2009-09-25 00:00:00.000'',''2009-09-26 00:00:00.000'',''2009-09-27 00:00:00.000'',''2009-09-28 00:00:00.000'',''2009-09-29 00:00:00.000'',''2009-09-30 00:00:00.000'',''2009-10-01 00:00:00.000'',''2009-10-02 00:00:00.000'',''2009-10-03 00:00:00.000'',''2009-10-04 00:00:00.000'',''2009-10-05 00:00:00.000'',''2009-10-06 00:00:00.000'',''2009-10-07 00:00:00.000'',''2009-10-08 00:00:00.000'',''2009-10-09 00:00:00.000'',''2009-10-10 00:00:00.000'',''2009-10-11 00:00:00.000'',''2009-10-12 00:00:00.000'',''2009-10-13 00:00:00.000'',''2009-10-14 00:00:00.000'',''2009-10-15 00:00:00.000'',''2009-10-16 00:00:00.000'',''2009-10-17 00:00:00.000'',''2009-10-18 00:00:00.000'',''2009-10-19 00:00:00.000'',''2009-10-20 00:00:00.000'',''2009-10-21 00:00:00.000'',''2009-10-22 00:00:00.000'',''2009-10-23 00:00:00.000'',''2009-10-24 00:00:00.000'',''2009-10-25 00:00:00.000'',''2009-10-26 00:00:00.000'',''2009-10-27 00:00:00.000'',''2009-10-28 00:00:00.000'',''2009-10-29 00:00:00.000'',''2009-10-30 00:00:00.000'',''2009-10-31 00:00:00.000'',''2009-11-01 00:00:00.000'',''2009-11-02 00:00:00.000'',''2009-11-03 00:00:00.000'',''2009-11-04 00:00:00.000'',''2009-11-05 00:00:00.000'',''2009-11-06 00:00:00.000'',''2009-11-07 00:00:00.000'',''2009-11-08 00:00:00.000'',''2009-11-09 00:00:00.000'',''2009-11-10 00:00:00.000'',''2009-11-11 00:00:00.000'',''2009-11-12 00:00:00.000'',''2009-11-13 00:00:00.000'',''2009-11-14 00:00:00.000'',''2009-11-15 00:00:00.000'',''2009-11-16 00:00:00.000'',''2009-11-17 00:00:00.000'',''2009-11-18 00:00:00.000'',''2009-11-19 00:00:00.000'',''2009-11-20 00:00:00.000'',''2009-11-21 00:00:00.000'',''2009-11-22 00:00:00.000'',''2009-11-23 00:00:00.000'',''2009-11-24 00:00:00.000'',''2009-11-25 00:00:00.000'',''2009-11-26 00:00:00.000'',''2009-11-27 00:00:00.000'',''2009-11-28 00:00:00.000'',''2009-11-29 00:00:00.000'',''2009-11-30 00:00:00.000'',''2009-12-01 00:00:00.000'',''2009-12-02 00:00:00.000'',''2009-12-03 00:00:00.000'',''2009-12-04 00:00:00.000'',''2009-12-05 00:00:00.000'',''2009-12-06 00:00:00.000'',''2009-12-07 00:00:00.000'',''2009-12-08 00:00:00.000'',''2009-12-09 00:00:00.000'',''2009-12-10 00:00:00.000'',''2009-12-11 00:00:00.000'',''2009-12-12 00:00:00.000'',''2009-12-13 00:00:00.000'',''2009-12-14 00:00:00.000'',''2009-12-15 00:00:00.000'',''2009-12-16 00:00:00.000'',''2009-12-17 00:00:00.000'',''2009-12-18 00:00:00.000'',''2009-12-19 00:00:00.000'',''2009-12-20 00:00:00.000'',''2009-12-21 00:00:00.000'',''2009-12-22 00:00:00.000'',''2009-12-23 00:00:00.000'',''2009-12-24 00:00:00.000'',''2009-12-25 00:00:00.000'',''2009-12-26 00:00:00.000'',''2009-12-27 00:00:00.000'',''2009-12-28 00:00:00.000'',''2009-12-29 00:00:00.000'',''2009-12-30 00:00:00.000'')">
                                        <Intrinsic FunctionName="RangePartitionNew">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Column="@parm1" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="(1)" />
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="''2007-06-30 00:00:00.000''" />
                                          </ScalarOperator>   
                                        </Intrinsic>
                                      </ScalarOperator>
                                    </RangeExpressions>
                                  </StartRange>
                                  <EndRange ScanType="LE">
                                    <RangeColumns>
                                      <ColumnReference Column="PtnId1000" />
                                    </RangeColumns>
                                    <RangeExpressions>
                                      <ScalarOperator ScalarString="RangePartitionNew([@parm2],(1),''2007-06-30 00:00:00.000'',''2007-01-03 00:00:00.000'',''2007-01-04 00:00:00.000'',''2007-01-05 00:00:00.000'',''2007-01-06 00:00:00.000'',''2007-01-07 00:00:00.000'',''2007-01-08 00:00:00.000'',''2007-01-09 00:00:00.000'',''2007-01-10 00:00:00.000'',''2007-01-11 00:00:00.000'',''2007-01-12 00:00:00.000'',''2007-01-13 00:00:00.000'',''2007-01-14 00:00:00.000'',''2007-01-15 00:00:00.000'',''2007-01-16 00:00:00.000'',''2007-01-17 00:00:00.000'',''2007-01-18 00:00:00.000'',''2007-01-19 00:00:00.000'',''2007-01-20 00:00:00.000'',''2007-01-21 00:00:00.000'',''2007-01-22 00:00:00.000'',''2007-01-23 00:00:00.000'',''2007-01-24 00:00:00.000'',''2007-01-25 00:00:00.000'',''2007-01-26 00:00:00.000'',''2007-01-27 00:00:00.000'',''2007-01-28 00:00:00.000'',''2007-01-29 00:00:00.000'',''2007-01-30 00:00:00.000'',''2007-01-31 00:00:00.000'',''2007-02-01 00:00:00.000'',''2007-02-02 00:00:00.000'',''2007-02-03 00:00:00.000'',''2007-02-04 00:00:00.000'',''2007-02-05 00:00:00.000'',''2007-02-06 00:00:00.000'',''2007-02-07 00:00:00.000'',''2007-02-08 00:00:00.000'',''2007-02-09 00:00:00.000'',''2007-02-10 00:00:00.000'',''2007-02-11 00:00:00.000'',''2007-02-12 00:00:00.000'',''2007-02-13 00:00:00.000'',''2007-02-14 00:00:00.000'',''2007-02-15 00:00:00.000'',''2007-02-16 00:00:00.000'',''2007-02-17 00:00:00.000'',''2007-02-18 00:00:00.000'',''2007-02-19 00:00:00.000'',''2007-02-20 00:00:00.000'',''2007-02-21 00:00:00.000'',''2007-02-22 00:00:00.000'',''2007-02-23 00:00:00.000'',''2007-02-24 00:00:00.000'',''2007-02-25 00:00:00.000'',''2007-02-26 00:00:00.000'',''2007-02-27 00:00:00.000'',''2007-02-28 00:00:00.000'',''2007-03-01 00:00:00.000'',''2007-03-02 00:00:00.000'',''2007-03-03 00:00:00.000'',''2007-03-04 00:00:00.000'',''2007-03-05 00:00:00.000'',''2007-03-06 00:00:00.000'',''2007-03-07 00:00:00.000'',''2007-03-08 00:00:00.000'',''2007-03-09 00:00:00.000'',''2007-03-10 00:00:00.000'',''2007-03-11 00:00:00.000'',''2007-03-12 00:00:00.000'',''2007-03-13 00:00:00.000'',''2007-03-14 00:00:00.000'',''2007-03-15 00:00:00.000'',''2007-03-16 00:00:00.000'',''2007-03-17 00:00:00.000'',''2007-03-18 00:00:00.000'',''2007-03-19 00:00:00.000'',''2007-03-20 00:00:00.000'',''2007-03-21 00:00:00.000'',''2007-03-22 00:00:00.000'',''2007-03-23 00:00:00.000'',''2007-03-24 00:00:00.000'',''2007-03-25 00:00:00.000'',''2007-03-26 00:00:00.000'',''2007-03-27 00:00:00.000'',''2007-03-28 00:00:00.000'',''2007-03-29 00:00:00.000'',''2007-03-30 00:00:00.000'',''2007-03-31 00:00:00.000'',''2007-04-01 00:00:00.000'',''2007-04-02 00:00:00.000'',''2007-04-03 00:00:00.000'',''2007-04-04 00:00:00.000'',''2007-04-05 00:00:00.000'',''2007-04-06 00:00:00.000'',''2007-04-07 00:00:00.000'',''2007-04-08 00:00:00.000'',''2007-04-09 00:00:00.000'',''2007-04-10 00:00:00.000'',''2007-04-11 00:00:00.000'',''2007-04-12 00:00:00.000'',''2007-04-13 00:00:00.000'',''2007-04-14 00:00:00.000'',''2007-04-15 00:00:00.000'',''2007-04-16 00:00:00.000'',''2007-04-17 00:00:00.000'',''2007-04-18 00:00:00.000'',''2007-04-19 00:00:00.000'',''2007-04-20 00:00:00.000'',''2007-04-21 00:00:00.000'',''2007-04-22 00:00:00.000'',''2007-04-23 00:00:00.000'',''2007-04-24 00:00:00.000'',''2007-04-25 00:00:00.000'',''2007-04-26 00:00:00.000'',''2007-04-27 00:00:00.000'',''2007-04-28 00:00:00.000'',''2007-04-29 00:00:00.000'',''2007-04-30 00:00:00.000'',''2007-05-01 00:00:00.000'',''2007-05-02 00:00:00.000'',''2007-05-03 00:00:00.000'',''2007-05-04 00:00:00.000'',''2007-05-05 00:00:00.000'',''2007-05-06 00:00:00.000'',''2007-05-07 00:00:00.000'',''2007-05-08 00:00:00.000'',''2007-05-09 00:00:00.000'',''2007-05-10 00:00:00.000'',''2007-05-11 00:00:00.000'',''2007-05-12 00:00:00.000'',''2007-05-13 00:00:00.000'',''2007-05-14 00:00:00.000'',''2007-05-15 00:00:00.000'',''2007-05-16 00:00:00.000'',''2007-05-17 00:00:00.000'',''2007-05-18 00:00:00.000'',''2007-05-19 00:00:00.000'',''2007-05-20 00:00:00.000'',''2007-05-21 00:00:00.000'',''2007-05-22 00:00:00.000'',''2007-05-23 00:00:00.000'',''2007-05-24 00:00:00.000'',''2007-05-25 00:00:00.000'',''2007-05-26 00:00:00.000'',''2007-05-27 00:00:00.000'',''2007-05-28 00:00:00.000'',''2007-05-29 00:00:00.000'',''2007-05-30 00:00:00.000'',''2007-05-31 00:00:00.000'',''2007-06-01 00:00:00.000'',''2007-06-02 00:00:00.000'',''2007-06-03 00:00:00.000'',''2007-06-04 00:00:00.000'',''2007-06-05 00:00:00.000'',''2007-06-06 00:00:00.000'',''2007-06-07 00:00:00.000'',''2007-06-08 00:00:00.000'',''2007-06-09 00:00:00.000'',''2007-06-10 00:00:00.000'',''2007-06-11 00:00:00.000'',''2007-06-12 00:00:00.000'',''2007-06-13 00:00:00.000'',''2007-06-14 00:00:00.000'',''2007-06-15 00:00:00.000'',''2007-06-16 00:00:00.000'',''2007-06-17 00:00:00.000'',''2007-06-18 00:00:00.000'',''2007-06-19 00:00:00.000'',''2007-06-20 00:00:00.000'',''2007-06-21 00:00:00.000'',''2007-06-22 00:00:00.000'',''2007-06-23 00:00:00.000'',''2007-06-24 00:00:00.000'',''2007-06-25 00:00:00.000'',''2007-06-26 00:00:00.000'',''2007-06-27 00:00:00.000'',''2007-06-28 00:00:00.000'',''2007-06-29 00:00:00.000'',''2007-06-30 00:00:00.000'',''2007-07-01 00:00:00.000'',''2007-07-02 00:00:00.000'',''2007-07-03 00:00:00.000'',''2007-07-04 00:00:00.000'',''2007-07-05 00:00:00.000'',''2007-07-06 00:00:00.000'',''2007-07-07 00:00:00.000'',''2007-07-08 00:00:00.000'',''2007-07-09 00:00:00.000'',''2007-07-10 00:00:00.000'',''2007-07-11 00:00:00.000'',''2007-07-12 00:00:00.000'',''2007-07-13 00:00:00.000'',''2007-07-14 00:00:00.000'',''2007-07-15 00:00:00.000'',''2007-07-16 00:00:00.000'',''2007-07-17 00:00:00.000'',''2007-07-18 00:00:00.000'',''2007-07-19 00:00:00.000'',''2007-07-20 00:00:00.000'',''2007-07-21 00:00:00.000'',''2007-07-22 00:00:00.000'',''2007-07-23 00:00:00.000'',''2007-07-24 00:00:00.000'',''2007-07-25 00:00:00.000'',''2007-07-26 00:00:00.000'',''2007-07-27 00:00:00.000'',''2007-07-28 00:00:00.000'',''2007-07-29 00:00:00.000'',''2007-07-30 00:00:00.000'',''2007-07-31 00:00:00.000'',''2007-08-01 00:00:00.000'',''2007-08-02 00:00:00.000'',''2007-08-03 00:00:00.000'',''2007-08-04 00:00:00.000'',''2007-08-05 00:00:00.000'',''2007-08-06 00:00:00.000'',''2007-08-07 00:00:00.000'',''2007-08-08 00:00:00.000'',''2007-08-09 00:00:00.000'',''2007-08-10 00:00:00.000'',''2007-08-11 00:00:00.000'',''2007-08-12 00:00:00.000'',''2007-08-13 00:00:00.000'',''2007-08-14 00:00:00.000'',''2007-08-15 00:00:00.000'',''2007-08-16 00:00:00.000'',''2007-08-17 00:00:00.000'',''2007-08-18 00:00:00.000'',''2007-08-19 00:00:00.000'',''2007-08-20 00:00:00.000'',''2007-08-21 00:00:00.000'',''2007-08-22 00:00:00.000'',''2007-08-23 00:00:00.000'',''2007-08-24 00:00:00.000'',''2007-08-25 00:00:00.000'',''2007-08-26 00:00:00.000'',''2007-08-27 00:00:00.000'',''2007-08-28 00:00:00.000'',''2007-08-29 00:00:00.000'',''2007-08-30 00:00:00.000'',''2007-08-31 00:00:00.000'',''2007-09-01 00:00:00.000'',''2007-09-02 00:00:00.000'',''2007-09-03 00:00:00.000'',''2007-09-04 00:00:00.000'',''2007-09-05 00:00:00.000'',''2007-09-06 00:00:00.000'',''2007-09-07 00:00:00.000'',''2007-09-08 00:00:00.000'',''2007-09-09 00:00:00.000'',''2007-09-10 00:00:00.000'',''2007-09-11 00:00:00.000'',''2007-09-12 00:00:00.000'',''2007-09-13 00:00:00.000'',''2007-09-14 00:00:00.000'',''2007-09-15 00:00:00.000'',''2007-09-16 00:00:00.000'',''2007-09-17 00:00:00.000'',''2007-09-18 00:00:00.000'',''2007-09-19 00:00:00.000'',''2007-09-20 00:00:00.000'',''2007-09-21 00:00:00.000'',''2007-09-22 00:00:00.000'',''2007-09-23 00:00:00.000'',''2007-09-24 00:00:00.000'',''2007-09-25 00:00:00.000'',''2007-09-26 00:00:00.000'',''2007-09-27 00:00:00.000'',''2007-09-28 00:00:00.000'',''2007-09-29 00:00:00.000'',''2007-09-30 00:00:00.000'',''2007-10-01 00:00:00.000'',''2007-10-02 00:00:00.000'',''2007-10-03 00:00:00.000'',''2007-10-04 00:00:00.000'',''2007-10-05 00:00:00.000'',''2007-10-06 00:00:00.000'',''2007-10-07 00:00:00.000'',''2007-10-08 00:00:00.000'',''2007-10-09 00:00:00.000'',''2007-10-10 00:00:00.000'',''2007-10-11 00:00:00.000'',''2007-10-12 00:00:00.000'',''2007-10-13 00:00:00.000'',''2007-10-14 00:00:00.000'',''2007-10-15 00:00:00.000'',''2007-10-16 00:00:00.000'',''2007-10-17 00:00:00.000'',''2007-10-18 00:00:00.000'',''2007-10-19 00:00:00.000'',''2007-10-20 00:00:00.000'',''2007-10-21 00:00:00.000'',''2007-10-22 00:00:00.000'',''2007-10-23 00:00:00.000'',''2007-10-24 00:00:00.000'',''2007-10-25 00:00:00.000'',''2007-10-26 00:00:00.000'',''2007-10-27 00:00:00.000'',''2007-10-28 00:00:00.000'',''2007-10-29 00:00:00.000'',''2007-10-30 00:00:00.000'',''2007-10-31 00:00:00.000'',''2007-11-01 00:00:00.000'',''2007-11-02 00:00:00.000'',''2007-11-03 00:00:00.000'',''2007-11-04 00:00:00.000'',''2007-11-05 00:00:00.000'',''2007-11-06 00:00:00.000'',''2007-11-07 00:00:00.000'',''2007-11-08 00:00:00.000'',''2007-11-09 00:00:00.000'',''2007-11-10 00:00:00.000'',''2007-11-11 00:00:00.000'',''2007-11-12 00:00:00.000'',''2007-11-13 00:00:00.000'',''2007-11-14 00:00:00.000'',''2007-11-15 00:00:00.000'',''2007-11-16 00:00:00.000'',''2007-11-17 00:00:00.000'',''2007-11-18 00:00:00.000'',''2007-11-19 00:00:00.000'',''2007-11-20 00:00:00.000'',''2007-11-21 00:00:00.000'',''2007-11-22 00:00:00.000'',''2007-11-23 00:00:00.000'',''2007-11-24 00:00:00.000'',''2007-11-25 00:00:00.000'',''2007-11-26 00:00:00.000'',''2007-11-27 00:00:00.000'',''2007-11-28 00:00:00.000'',''2007-11-29 00:00:00.000'',''2007-11-30 00:00:00.000'',''2007-12-01 00:00:00.000'',''2008-11-02 00:00:00.000'',''2008-11-03 00:00:00.000'',''2008-11-04 00:00:00.000'',''2008-11-05 00:00:00.000'',''2008-11-06 00:00:00.000'',''2008-11-07 00:00:00.000'',''2008-11-08 00:00:00.000'',''2008-11-09 00:00:00.000'',''2008-11-10 00:00:00.000'',''2008-11-11 00:00:00.000'',''2008-11-12 00:00:00.000'',''2008-11-13 00:00:00.000'',''2008-11-14 00:00:00.000'',''2008-11-15 00:00:00.000'',''2008-11-16 00:00:00.000'',''2008-11-17 00:00:00.000'',''2008-11-18 00:00:00.000'',''2008-11-19 00:00:00.000'',''2008-11-20 00:00:00.000'',''2008-11-21 00:00:00.000'',''2008-11-22 00:00:00.000'',''2008-11-23 00:00:00.000'',''2008-11-24 00:00:00.000'',''2008-11-25 00:00:00.000'',''2008-11-26 00:00:00.000'',''2008-11-27 00:00:00.000'',''2008-11-28 00:00:00.000'',''2008-11-29 00:00:00.000'',''2008-11-30 00:00:00.000'',''2008-12-01 00:00:00.000'',''2008-12-02 00:00:00.000'',''2008-12-03 00:00:00.000'',''2008-12-04 00:00:00.000'',''2008-12-05 00:00:00.000'',''2008-12-06 00:00:00.000'',''2008-12-07 00:00:00.000'',''2008-12-08 00:00:00.000'',''2008-12-09 00:00:00.000'',''2008-12-10 00:00:00.000'',''2008-12-11 00:00:00.000'',''2008-12-12 00:00:00.000'',''2008-12-13 00:00:00.000'',''2008-12-14 00:00:00.000'',''2008-12-15 00:00:00.000'',''2008-12-16 00:00:00.000'',''2008-12-17 00:00:00.000'',''2008-12-18 00:00:00.000'',''2008-12-19 00:00:00.000'',''2008-12-20 00:00:00.000'',''2008-12-21 00:00:00.000'',''2008-12-22 00:00:00.000'',''2008-12-23 00:00:00.000'',''2008-12-24 00:00:00.000'',''2008-12-25 00:00:00.000'',''2008-12-26 00:00:00.000'',''2008-12-27 00:00:00.000'',''2008-12-28 00:00:00.000'',''2008-12-29 00:00:00.000'',''2008-12-30 00:00:00.000'',''2008-12-31 00:00:00.000'',''2009-01-01 00:00:00.000'',''2009-01-02 00:00:00.000'',''2009-01-03 00:00:00.000'',''2009-01-04 00:00:00.000'',''2009-01-05 00:00:00.000'',''2009-01-06 00:00:00.000'',''2009-01-07 00:00:00.000'',''2009-01-08 00:00:00.000'',''2009-01-09 00:00:00.000'',''2009-01-10 00:00:00.000'',''2009-01-11 00:00:00.000'',''2009-01-12 00:00:00.000'',''2009-01-13 00:00:00.000'',''2009-01-14 00:00:00.000'',''2009-01-15 00:00:00.000'',''2009-01-16 00:00:00.000'',''2009-01-17 00:00:00.000'',''2009-01-18 00:00:00.000'',''2009-01-19 00:00:00.000'',''2009-01-20 00:00:00.000'',''2009-01-21 00:00:00.000'',''2009-01-22 00:00:00.000'',''2009-01-23 00:00:00.000'',''2009-01-24 00:00:00.000'',''2009-01-25 00:00:00.000'',''2009-01-26 00:00:00.000'',''2009-01-27 00:00:00.000'',''2009-01-28 00:00:00.000'',''2009-01-29 00:00:00.000'',''2009-01-30 00:00:00.000'',''2009-01-31 00:00:00.000'',''2009-02-01 00:00:00.000'',''2009-02-02 00:00:00.000'',''2009-02-03 00:00:00.000'',''2009-02-04 00:00:00.000'',''2009-02-05 00:00:00.000'',''2009-02-06 00:00:00.000'',''2009-02-07 00:00:00.000'',''2009-02-08 00:00:00.000'',''2009-02-09 00:00:00.000'',''2009-02-10 00:00:00.000'',''2009-02-11 00:00:00.000'',''2009-02-12 00:00:00.000'',''2009-02-13 00:00:00.000'',''2009-02-14 00:00:00.000'',''2009-02-15 00:00:00.000'',''2009-02-16 00:00:00.000'',''2009-02-17 00:00:00.000'',''2009-02-18 00:00:00.000'',''2009-02-19 00:00:00.000'',''2009-02-20 00:00:00.000'',''2009-02-21 00:00:00.000'',''2009-02-22 00:00:00.000'',''2009-02-23 00:00:00.000'',''2009-02-24 00:00:00.000'',''2009-02-25 00:00:00.000'',''2009-02-26 00:00:00.000'',''2009-02-27 00:00:00.000'',''2009-02-28 00:00:00.000'',''2009-03-01 00:00:00.000'',''2009-03-02 00:00:00.000'',''2009-03-03 00:00:00.000'',''2009-03-04 00:00:00.000'',''2009-03-05 00:00:00.000'',''2009-03-06 00:00:00.000'',''2009-03-07 00:00:00.000'',''2009-03-08 00:00:00.000'',''2009-03-09 00:00:00.000'',''2009-03-10 00:00:00.000'',''2009-03-11 00:00:00.000'',''2009-03-12 00:00:00.000'',''2009-03-13 00:00:00.000'',''2009-03-14 00:00:00.000'',''2009-03-15 00:00:00.000'',''2009-03-16 00:00:00.000'',''2009-03-17 00:00:00.000'',''2009-03-18 00:00:00.000'',''2009-03-19 00:00:00.000'',''2009-03-20 00:00:00.000'',''2009-03-21 00:00:00.000'',''2009-03-22 00:00:00.000'',''2009-03-23 00:00:00.000'',''2009-03-24 00:00:00.000'',''2009-03-25 00:00:00.000'',''2009-03-26 00:00:00.000'',''2009-03-27 00:00:00.000'',''2009-03-28 00:00:00.000'',''2009-03-29 00:00:00.000'',''2009-03-30 00:00:00.000'',''2009-03-31 00:00:00.000'',''2009-04-01 00:00:00.000'',''2009-04-02 00:00:00.000'',''2009-04-03 00:00:00.000'',''2009-04-04 00:00:00.000'',''2009-04-05 00:00:00.000'',''2009-04-06 00:00:00.000'',''2009-04-07 00:00:00.000'',''2009-04-08 00:00:00.000'',''2009-04-09 00:00:00.000'',''2009-04-10 00:00:00.000'',''2009-04-11 00:00:00.000'',''2009-04-12 00:00:00.000'',''2009-04-13 00:00:00.000'',''2009-04-14 00:00:00.000'',''2009-04-15 00:00:00.000'',''2009-04-16 00:00:00.000'',''2009-04-17 00:00:00.000'',''2009-04-18 00:00:00.000'',''2009-04-19 00:00:00.000'',''2009-04-20 00:00:00.000'',''2009-04-21 00:00:00.000'',''2009-04-22 00:00:00.000'',''2009-04-23 00:00:00.000'',''2009-04-24 00:00:00.000'',''2009-04-25 00:00:00.000'',''2009-04-26 00:00:00.000'',''2009-04-27 00:00:00.000'',''2009-04-28 00:00:00.000'',''2009-04-29 00:00:00.000'',''2009-04-30 00:00:00.000'',''2009-05-01 00:00:00.000'',''2009-05-02 00:00:00.000'',''2009-05-03 00:00:00.000'',''2009-05-04 00:00:00.000'',''2009-05-05 00:00:00.000'',''2009-05-06 00:00:00.000'',''2009-05-07 00:00:00.000'',''2009-05-08 00:00:00.000'',''2009-05-09 00:00:00.000'',''2009-05-10 00:00:00.000'',''2009-05-11 00:00:00.000'',''2009-05-12 00:00:00.000'',''2009-05-13 00:00:00.000'',''2009-05-14 00:00:00.000'',''2009-05-15 00:00:00.000'',''2009-05-16 00:00:00.000'',''2009-05-17 00:00:00.000'',''2009-05-18 00:00:00.000'',''2009-05-19 00:00:00.000'',''2009-05-20 00:00:00.000'',''2009-05-21 00:00:00.000'',''2009-05-22 00:00:00.000'',''2009-05-23 00:00:00.000'',''2009-05-24 00:00:00.000'',''2009-05-25 00:00:00.000'',''2009-05-26 00:00:00.000'',''2009-05-27 00:00:00.000'',''2009-05-28 00:00:00.000'',''2009-05-29 00:00:00.000'',''2009-05-30 00:00:00.000'',''2009-05-31 00:00:00.000'',''2009-06-01 00:00:00.000'',''2009-06-02 00:00:00.000'',''2009-06-03 00:00:00.000'',''2009-06-04 00:00:00.000'',''2009-06-05 00:00:00.000'',''2009-06-06 00:00:00.000'',''2009-06-07 00:00:00.000'',''2009-06-08 00:00:00.000'',''2009-06-09 00:00:00.000'',''2009-06-10 00:00:00.000'',''2009-06-11 00:00:00.000'',''2009-06-12 00:00:00.000'',''2009-06-13 00:00:00.000'',''2009-06-14 00:00:00.000'',''2009-06-15 00:00:00.000'',''2009-06-16 00:00:00.000'',''2009-06-17 00:00:00.000'',''2009-06-18 00:00:00.000'',''2009-06-19 00:00:00.000'',''2009-06-20 00:00:00.000'',''2009-06-21 00:00:00.000'',''2009-06-22 00:00:00.000'',''2009-06-23 00:00:00.000'',''2009-06-24 00:00:00.000'',''2009-06-25 00:00:00.000'',''2009-06-26 00:00:00.000'',''2009-06-27 00:00:00.000'',''2009-06-28 00:00:00.000'',''2009-06-29 00:00:00.000'',''2009-06-30 00:00:00.000'',''2009-07-01 00:00:00.000'',''2009-07-02 00:00:00.000'',''2009-07-03 00:00:00.000'',''2009-07-04 00:00:00.000'',''2009-07-05 00:00:00.000'',''2009-07-06 00:00:00.000'',''2009-07-07 00:00:00.000'',''2009-07-08 00:00:00.000'',''2009-07-09 00:00:00.000'',''2009-07-10 00:00:00.000'',''2009-07-11 00:00:00.000'',''2009-07-12 00:00:00.000'',''2009-07-13 00:00:00.000'',''2009-07-14 00:00:00.000'',''2009-07-15 00:00:00.000'',''2009-07-16 00:00:00.000'',''2009-07-17 00:00:00.000'',''2009-07-18 00:00:00.000'',''2009-07-19 00:00:00.000'',''2009-07-20 00:00:00.000'',''2009-07-21 00:00:00.000'',''2009-07-22 00:00:00.000'',''2009-07-23 00:00:00.000'',''2009-07-24 00:00:00.000'',''2009-07-25 00:00:00.000'',''2009-07-26 00:00:00.000'',''2009-07-27 00:00:00.000'',''2009-07-28 00:00:00.000'',''2009-07-29 00:00:00.000'',''2009-07-30 00:00:00.000'',''2009-07-31 00:00:00.000'',''2009-08-01 00:00:00.000'',''2009-08-02 00:00:00.000'',''2009-08-03 00:00:00.000'',''2009-08-04 00:00:00.000'',''2009-08-05 00:00:00.000'',''2009-08-06 00:00:00.000'',''2009-08-07 00:00:00.000'',''2009-08-08 00:00:00.000'',''2009-08-09 00:00:00.000'',''2009-08-10 00:00:00.000'',''2009-08-11 00:00:00.000'',''2009-08-12 00:00:00.000'',''2009-08-13 00:00:00.000'',''2009-08-14 00:00:00.000'',''2009-08-15 00:00:00.000'',''2009-08-16 00:00:00.000'',''2009-08-17 00:00:00.000'',''2009-08-18 00:00:00.000'',''2009-08-19 00:00:00.000'',''2009-08-20 00:00:00.000'',''2009-08-21 00:00:00.000'',''2009-08-22 00:00:00.000'',''2009-08-23 00:00:00.000'',''2009-08-24 00:00:00.000'',''2009-08-25 00:00:00.000'',''2009-08-26 00:00:00.000'',''2009-08-27 00:00:00.000'',''2009-08-28 00:00:00.000'',''2009-08-29 00:00:00.000'',''2009-08-30 00:00:00.000'',''2009-08-31 00:00:00.000'',''2009-09-01 00:00:00.000'',''2009-09-02 00:00:00.000'',''2009-09-03 00:00:00.000'',''2009-09-04 00:00:00.000'',''2009-09-05 00:00:00.000'',''2009-09-06 00:00:00.000'',''2009-09-07 00:00:00.000'',''2009-09-08 00:00:00.000'',''2009-09-09 00:00:00.000'',''2009-09-10 00:00:00.000'',''2009-09-11 00:00:00.000'',''2009-09-12 00:00:00.000'',''2009-09-13 00:00:00.000'',''2009-09-14 00:00:00.000'',''2009-09-15 00:00:00.000'',''2009-09-16 00:00:00.000'',''2009-09-17 00:00:00.000'',''2009-09-18 00:00:00.000'',''2009-09-19 00:00:00.000'',''2009-09-20 00:00:00.000'',''2009-09-21 00:00:00.000'',''2009-09-22 00:00:00.000'',''2009-09-23 00:00:00.000'',''2009-09-24 00:00:00.000'',''2009-09-25 00:00:00.000'',''2009-09-26 00:00:00.000'',''2009-09-27 00:00:00.000'',''2009-09-28 00:00:00.000'',''2009-09-29 00:00:00.000'',''2009-09-30 00:00:00.000'',''2009-10-01 00:00:00.000'',''2009-10-02 00:00:00.000'',''2009-10-03 00:00:00.000'',''2009-10-04 00:00:00.000'',''2009-10-05 00:00:00.000'',''2009-10-06 00:00:00.000'',''2009-10-07 00:00:00.000'',''2009-10-08 00:00:00.000'',''2009-10-09 00:00:00.000'',''2009-10-10 00:00:00.000'',''2009-10-11 00:00:00.000'',''2009-10-12 00:00:00.000'',''2009-10-13 00:00:00.000'',''2009-10-14 00:00:00.000'',''2009-10-15 00:00:00.000'',''2009-10-16 00:00:00.000'',''2009-10-17 00:00:00.000'',''2009-10-18 00:00:00.000'',''2009-10-19 00:00:00.000'',''2009-10-20 00:00:00.000'',''2009-10-21 00:00:00.000'',''2009-10-22 00:00:00.000'',''2009-10-23 00:00:00.000'',''2009-10-24 00:00:00.000'',''2009-10-25 00:00:00.000'',''2009-10-26 00:00:00.000'',''2009-10-27 00:00:00.000'',''2009-10-28 00:00:00.000'',''2009-10-29 00:00:00.000'',''2009-10-30 00:00:00.000'',''2009-10-31 00:00:00.000'',''2009-11-01 00:00:00.000'',''2009-11-02 00:00:00.000'',''2009-11-03 00:00:00.000'',''2009-11-04 00:00:00.000'',''2009-11-05 00:00:00.000'',''2009-11-06 00:00:00.000'',''2009-11-07 00:00:00.000'',''2009-11-08 00:00:00.000'',''2009-11-09 00:00:00.000'',''2009-11-10 00:00:00.000'',''2009-11-11 00:00:00.000'',''2009-11-12 00:00:00.000'',''2009-11-13 00:00:00.000'',''2009-11-14 00:00:00.000'',''2009-11-15 00:00:00.000'',''2009-11-16 00:00:00.000'',''2009-11-17 00:00:00.000'',''2009-11-18 00:00:00.000'',''2009-11-19 00:00:00.000'',''2009-11-20 00:00:00.000'',''2009-11-21 00:00:00.000'',''2009-11-22 00:00:00.000'',''2009-11-23 00:00:00.000'',''2009-11-24 00:00:00.000'',''2009-11-25 00:00:00.000'',''2009-11-26 00:00:00.000'',''2009-11-27 00:00:00.000'',''2009-11-28 00:00:00.000'',''2009-11-29 00:00:00.000'',''2009-11-30 00:00:00.000'',''2009-12-01 00:00:00.000'',''2009-12-02 00:00:00.000'',''2009-12-03 00:00:00.000'',''2009-12-04 00:00:00.000'',''2009-12-05 00:00:00.000'',''2009-12-06 00:00:00.000'',''2009-12-07 00:00:00.000'',''2009-12-08 00:00:00.000'',''2009-12-09 00:00:00.000'',''2009-12-10 00:00:00.000'',''2009-12-11 00:00:00.000'',''2009-12-12 00:00:00.000'',''2009-12-13 00:00:00.000'',''2009-12-14 00:00:00.000'',''2009-12-15 00:00:00.000'',''2009-12-16 00:00:00.000'',''2009-12-17 00:00:00.000'',''2009-12-18 00:00:00.000'',''2009-12-19 00:00:00.000'',''2009-12-20 00:00:00.000'',''2009-12-21 00:00:00.000'',''2009-12-22 00:00:00.000'',''2009-12-23 00:00:00.000'',''2009-12-24 00:00:00.000'',''2009-12-25 00:00:00.000'',''2009-12-26 00:00:00.000'',''2009-12-27 00:00:00.000'',''2009-12-28 00:00:00.000'',''2009-12-29 00:00:00.000'',''2009-12-30 00:00:00.000'')">
                                        <Intrinsic FunctionName="RangePartitionNew">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Column="@parm2" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="(1)" />
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="''2007-06-30 00:00:00.000''" />
                                          </ScalarOperator>
                                        </Intrinsic>
                                      </ScalarOperator>
                                    </RangeExpressions>
                                  </EndRange>
                                </SeekKeys>
                                <SeekKeys>
                                  <StartRange ScanType="GE">
                                    <RangeColumns>
                                      <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Alias="[fcto]" Column="DateKey" />
                                    </RangeColumns>
                                    <RangeExpressions>
                                      <ScalarOperator ScalarString="[@parm1]">
                                        <Identifier>
                                          <ColumnReference Column="@parm1" />
                                        </Identifier>
                                      </ScalarOperator>
                                    </RangeExpressions>
                                  </StartRange>
                                  <EndRange ScanType="LE">
                                    <RangeColumns>
                                      <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Alias="[fcto]" Column="DateKey" />
                                    </RangeColumns>
                                    <RangeExpressions>
                                      <ScalarOperator ScalarString="[@parm2]">
                                        <Identifier>
                                          <ColumnReference Column="@parm2" />
                                        </Identifier>
                                      </ScalarOperator>
                                    </RangeExpressions>
                                  </EndRange>
                                </SeekKeys>
                              </SeekPredicateNew>
                            </SeekPredicates>
                          </IndexScan>
                        </RelOp>
                      </Hash>
                    </RelOp>
                  </ComputeScalar>
                </RelOp>
              </Parallelism>
            </RelOp>
            <ParameterList>
              <ColumnReference Column="@parm2" ParameterDataType="datetime" ParameterRuntimeValue="''2009-11-23 00:00:00.000''" />
              <ColumnReference Column="@parm1" ParameterDataType="datetime" ParameterRuntimeValue="''2007-06-30 00:00:00.000''" />
            </ParameterList>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="6" StatementEstRows="1" StatementId="2" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="GoodEnoughPlanFound" CardinalityEstimationModelVersion="150" StatementSubTreeCost="0.0138832" StatementText="DECLARE @st_id INT = (&#xD;&#xA;	SELECT	stsss.stats_id&#xD;&#xA;	FROM	sys.stats stsss&#xD;&#xA;	WHERE	stsss.object_id = @obct_id&#xD;&#xA;	AND		stsss.name = ''WA_FactOnlineSalesPartitioning_Stats_DateKey''&#xD;&#xA;)" StatementType="SELECT" QueryHash="0xD2A83DFF1C5E5CB3" QueryPlanHash="0x417199F0D4B8CA2F" RetrievedFromCache="true" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="0" NonParallelPlanReason="CouldNotGenerateValidParallelPlan" CachedPlanSize="64" CompileTime="188" CompileCPU="22" CompileMemory="1416">
            <MemoryGrantInfo SerialRequiredMemory="0" SerialDesiredMemory="0" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="4331840" />
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Statistics="[_WA_Sys_00000002_00000036]" ModificationCount="7" SamplingPercent="100" LastUpdate="2021-04-16T12:31:37.44" />
              <StatisticsInfo Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Statistics="[clst]" ModificationCount="213" SamplingPercent="100" LastUpdate="2009-04-13T12:59:17.34" />
              <StatisticsInfo Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Statistics="[_WA_Sys_00000002_0000003C]" ModificationCount="2" SamplingPercent="100" LastUpdate="2021-05-02T16:46:34.51" />
              <StatisticsInfo Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Statistics="[clst]" ModificationCount="25" SamplingPercent="100" LastUpdate="2021-04-14T14:31:53.85" />
              <StatisticsInfo Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Statistics="[_WA_Sys_00000003_0000003C]" ModificationCount="1" SamplingPercent="100" LastUpdate="2021-05-02T16:46:34.51" />
              <StatisticsInfo Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Statistics="[_WA_Sys_00000004_0000003C]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-05-02T16:46:34.52" />
            </OptimizerStatsUsage>
            <WaitStats>
              <Wait WaitType="PAGEIOLATCH_SH" WaitTimeMs="24" WaitCount="1" />
            </WaitStats>
            <QueryTimeStats CpuTime="0" ElapsedTime="25" />   
            <RelOp AvgRowSize="11" EstimateCPU="1E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="0" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="0.0138832">
              <OutputList>
                <ColumnReference Column="Expr1034" />
              </OutputList>
              <ComputeScalar>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1034" />
                    <ScalarOperator ScalarString="[Expr1039]">
                      <Identifier>
                        <ColumnReference Column="Expr1039" />
                      </Identifier>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="11" EstimateCPU="4.18E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Left Outer Join" NodeId="1" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="0.0138831">
                  <OutputList>
                    <ColumnReference Column="Expr1039" />
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="25" ActualCPUms="0" />
                  </RunTimeInformation>
                  <NestedLoops Optimized="false">
                    <RelOp AvgRowSize="9" EstimateCPU="1.157E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Constant Scan" NodeId="2" Parallel="false" PhysicalOp="Constant Scan" EstimatedTotalSubtreeCost="1.157E-06">
                      <OutputList />
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                      </RunTimeInformation>
                      <ConstantScan />
                    </RelOp>
                    <RelOp AvgRowSize="11" EstimateCPU="4.8E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Assert" NodeId="3" Parallel="false" PhysicalOp="Assert" EstimatedTotalSubtreeCost="0.0138778">
                      <OutputList>
                        <ColumnReference Column="Expr1039" />
                      </OutputList>
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="25" ActualCPUms="0" />
                      </RunTimeInformation>
                      <Assert StartupExpression="false">
                        <RelOp AvgRowSize="19" EstimateCPU="7.33695E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="4" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="0.0138773">
                          <OutputList>
                            <ColumnReference Column="Expr1038" />
                            <ColumnReference Column="Expr1039" />
                          </OutputList>
                          <RunTimeInformation>
                            <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="25" ActualCPUms="0" />
                          </RunTimeInformation>
                          <StreamAggregate>
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Column="Expr1038" />
                                <ScalarOperator ScalarString="Count(*)">
                                  <Aggregate AggType="countstar" Distinct="false" />
                                </ScalarOperator>
                              </DefinedValue>
                              <DefinedValue>
                                <ColumnReference Column="Expr1039" />
                                <ScalarOperator ScalarString="ANY([Union1022])">
                                  <Aggregate AggType="ANY" Distinct="false">
                                    <ScalarOperator>
                                      <Identifier>
                                        <ColumnReference Column="Union1022" />
                                      </Identifier>
                                    </ScalarOperator>
                                  </Aggregate>
                                </ScalarOperator>
                              </DefinedValue>
                            </DefinedValues>
                            <RelOp AvgRowSize="11" EstimateCPU="1.13949E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="11.3949" LogicalOp="Concatenation" NodeId="5" Parallel="false" PhysicalOp="Concatenation" EstimatedTotalSubtreeCost="0.01387">
                              <OutputList>
                                <ColumnReference Column="Union1022" />
                              </OutputList>
                              <RunTimeInformation>
                                <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="25" ActualCPUms="0" />
                              </RunTimeInformation>
                              <Concat>
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Column="Union1022" />
                                    <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                    <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                  </DefinedValue>
                                </DefinedValues>
                                <RelOp AvgRowSize="11" EstimateCPU="4.18E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Left Anti Semi Join" NodeId="6" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="0.00986022">
                                  <OutputList>
                                    <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                  </OutputList>
                                  <RunTimeInformation>
                                    <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="25" ActualCPUms="0" />
                                  </RunTimeInformation>
                                  <NestedLoops Optimized="false">
                                    <Predicate>
                                      <ScalarOperator ScalarString="[Contoso].[sys].[sysidxstats].[indid] as [s].[indid]=[tempdb].[sys].[sysobjvalues].[valnum] as [o].[valnum]">
                                        <Compare CompareOp="EQ">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                    </Predicate>
                                    <RelOp AvgRowSize="15" EstimateCPU="4.18E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Inner Join" NodeId="8" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="0.00657126">
                                      <OutputList>
                                        <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                      </OutputList>
                                      <RunTimeInformation>
                                        <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="25" ActualCPUms="0" />
                                      </RunTimeInformation>
                                      <NestedLoops Optimized="false">
                                        <OuterReferences>
                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="id" />
                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                        </OuterReferences>
                                        <RelOp AvgRowSize="15" EstimateCPU="8.8E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Filter" NodeId="9" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.00328398">
                                          <OutputList>
                                            <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="id" />
                                            <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                          </OutputList>
                                          <RunTimeInformation>
                                            <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="25" ActualCPUms="0" />
                                          </RunTimeInformation>
                                          <Filter StartupExpression="false">
                                            <RelOp AvgRowSize="15" EstimateCPU="0.0001581" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Index Seek" NodeId="10" Parallel="false" PhysicalOp="Index Seek" EstimatedTotalSubtreeCost="0.0032831" TableCardinality="601">
                                              <OutputList>
                                                <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="id" />
                                                <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                              </OutputList>
                                              <RunTimeInformation>
                                                <RunTimeCountersPerThread Thread="0" ActualRows="1" ActualRowsRead="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="25" ActualCPUms="0" ActualScans="0" ActualLogicalReads="2" ActualPhysicalReads="1" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                              </RunTimeInformation>
                                              <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                                <DefinedValues>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="id" />
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                                  </DefinedValue>
                                                </DefinedValues>
                                                <Object Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Index="[nc]" Alias="[s]" IndexKind="NonClustered" Storage="RowStore" />
                                                <SeekPredicates>
                                                  <SeekPredicateNew>
                                                    <SeekKeys>
                                                      <Prefix ScanType="EQ">
                                                        <RangeColumns>
                                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="name" />
                                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="id" />
                                                        </RangeColumns>
                                                        <RangeExpressions>
                                                          <ScalarOperator ScalarString="N''WA_FactOnlineSalesPartitioning_Stats_DateKey''">
                                                            <Const ConstValue="N''WA_FactOnlineSalesPartitioning_Stats_DateKey''" />
                                                          </ScalarOperator>
                                                          <ScalarOperator ScalarString="[@obct_id]">
                                                            <Identifier>
                                                              <ColumnReference Column="@obct_id" />
                                                            </Identifier>
                                                          </ScalarOperator>
                                                        </RangeExpressions>
                                                      </Prefix>
                                                    </SeekKeys>
                                                  </SeekPredicateNew>
                                                </SeekPredicates>
                                              </IndexScan>
                                            </RelOp>
                                            <Predicate>
                                              <ScalarOperator ScalarString="has_access(''CO'',[Contoso].[sys].[sysidxstats].[id] as [s].[id])=(1)">
                                                <Compare CompareOp="EQ">
                                                  <ScalarOperator>
                                                    <Intrinsic FunctionName="has_access">
                                                      <ScalarOperator>
                                                        <Const ConstValue="''CO''" />
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="id" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="" />
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="" />
                                                      </ScalarOperator>
                                                    </Intrinsic>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Const ConstValue="(1)" />
                                                  </ScalarOperator>
                                                </Compare>
                                              </ScalarOperator>
                                            </Predicate>
                                          </Filter>
                                        </RelOp>
                                        <RelOp AvgRowSize="11" EstimateCPU="0.0001581" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Clustered Index Seek" NodeId="12" Parallel="false" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="0.0032831" TableCardinality="601">
                                          <OutputList />
                                          <RunTimeInformation>
                                            <RunTimeCountersPerThread Thread="0" ActualRows="1" ActualRowsRead="1" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="2" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                          </RunTimeInformation>
                                          <IndexScan Lookup="true" Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                            <DefinedValues />
                                            <Object Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Index="[clst]" Alias="[s]" TableReferenceId="-1" IndexKind="Clustered" Storage="RowStore" />
                                            <SeekPredicates>
                                              <SeekPredicateNew>
                                                <SeekKeys>
                                                  <Prefix ScanType="EQ">
                                                    <RangeColumns>
                                                      <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="id" />
                                                      <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                                    </RangeColumns>
                                                    <RangeExpressions>
                                                      <ScalarOperator ScalarString="[Contoso].[sys].[sysidxstats].[id] as [s].[id]">
                                                        <Identifier>
                                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="id" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator ScalarString="[Contoso].[sys].[sysidxstats].[indid] as [s].[indid]">
                                                        <Identifier>
                                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="indid" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                    </RangeExpressions>
                                                  </Prefix>
                                                </SeekKeys>
                                              </SeekPredicateNew>
                                            </SeekPredicates>
                                            <Predicate>
                                              <ScalarOperator ScalarString="([Contoso].[sys].[sysidxstats].[status] as [s].[status]&amp;(2))=(2) AND ([Contoso].[sys].[sysidxstats].[status] as [s].[status]&amp;(67108864))=(0)">
                                                <Logical Operation="AND">
                                                  <ScalarOperator>
                                                    <Compare CompareOp="EQ">
                                                      <ScalarOperator>
                                                        <Arithmetic Operation="BIT_AND">
                                                          <ScalarOperator>
                                                            <Identifier>
                                                              <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="status" />
                                                            </Identifier>
                                                          </ScalarOperator>
                                                          <ScalarOperator>
                                                            <Const ConstValue="(2)" />
                                                          </ScalarOperator>
                                                        </Arithmetic>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="(2)" />
                                                      </ScalarOperator>
                                                    </Compare>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Compare CompareOp="EQ">
                                                      <ScalarOperator>
                                                        <Arithmetic Operation="BIT_AND">
                                                          <ScalarOperator>
                                                            <Identifier>
                                                              <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysidxstats]" Alias="[s]" Column="status" />
                                                            </Identifier>
                                                          </ScalarOperator>
                                                          <ScalarOperator>
                                                            <Const ConstValue="(67108864)" />
                                                          </ScalarOperator>
                                                        </Arithmetic>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="(0)" />
                                                      </ScalarOperator>
                                                    </Compare>
                                                  </ScalarOperator>
                                                </Logical>
                                              </ScalarOperator>
                                            </Predicate>
                                          </IndexScan>
                                        </RelOp>
                                      </NestedLoops>
                                    </RelOp>
                                    <RelOp AvgRowSize="11" EstimateCPU="0.0001581" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Clustered Index Seek" NodeId="13" Parallel="false" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="0.0032831" TableCardinality="182">
                                      <OutputList>
                                        <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                      </OutputList>
                                      <RunTimeInformation>
                                        <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="1" ActualLogicalReads="2" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                      </RunTimeInformation>
                                      <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                          </DefinedValue>
                                        </DefinedValues>
                                        <Object Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Index="[clst]" Alias="[o]" TableReferenceId="1" IndexKind="Clustered" Storage="RowStore" />
                                        <SeekPredicates>
                                          <SeekPredicateNew>
                                            <SeekKeys>
                                              <Prefix ScanType="EQ">
                                                <RangeColumns>
                                                  <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valclass" />
                                                  <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="objid" />
                                                  <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="subobjid" />
                                                </RangeColumns>
                                                <RangeExpressions>
                                                  <ScalarOperator ScalarString="(54)">
                                                    <Const ConstValue="(54)" />
                                                  </ScalarOperator>
                                                  <ScalarOperator ScalarString="CONVERT_IMPLICIT(int,db_id(),0)">
                                                    <Identifier>
                                                      <ColumnReference Column="ConstExpr1035">
                                                        <ScalarOperator>
                                                          <Convert DataType="int" Style="0" Implicit="true">
                                                            <ScalarOperator>
                                                              <Intrinsic FunctionName="db_id">
                                                                <ScalarOperator>
                                                                  <Const ConstValue="" />
                                                                </ScalarOperator>
                                                              </Intrinsic>
                                                            </ScalarOperator>
                                                          </Convert>
                                                        </ScalarOperator>
                                                      </ColumnReference>
                                                    </Identifier>
                                                  </ScalarOperator>
                                                  <ScalarOperator ScalarString="[@obct_id]">
                                                    <Identifier>
                                                      <ColumnReference Column="@obct_id" />
                                                    </Identifier>
                                                  </ScalarOperator>
                                                </RangeExpressions>
                                              </Prefix>
                                              <EndRange ScanType="LT">
                                                <RangeColumns>
                                                  <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                                </RangeColumns>
                                                <RangeExpressions>
                                                  <ScalarOperator ScalarString="(262144)">
                                                    <Const ConstValue="(262144)" />
                                                  </ScalarOperator>
                                                </RangeExpressions>
                                              </EndRange>
                                            </SeekKeys>
                                          </SeekPredicateNew>
                                        </SeekPredicates>
                                      </IndexScan>
                                    </RelOp>
                                  </NestedLoops>
                                </RelOp>
                                <RelOp AvgRowSize="11" EstimateCPU="6.144E-05" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="10.3949" LogicalOp="Filter" NodeId="14" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.00400862">
                                  <OutputList>
                                    <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                  </OutputList>
                                  <RunTimeInformation>
                                    <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                                  </RunTimeInformation>
                                  <Filter StartupExpression="false">
                                    <RelOp AvgRowSize="143" EstimateCPU="0.00053504" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="128" LogicalOp="Left Outer Join" NodeId="15" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="0.00394718">
                                      <OutputList>
                                        <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                        <ColumnReference Table="[TEMPSTATS]" Column="name" />
                                      </OutputList>
                                      <RunTimeInformation>
                                        <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                                      </RunTimeInformation>
                                      <NestedLoops Optimized="false">
                                        <OuterReferences>
                                          <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="objid" />
                                          <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="subobjid" />
                                          <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                        </OuterReferences>
                                        <RelOp AvgRowSize="19" EstimateCPU="8.8E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Filter" NodeId="16" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.00328398">
                                          <OutputList>
                                            <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="objid" />
                                            <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="subobjid" />
                                            <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                          </OutputList>
                                          <RunTimeInformation>
                                            <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                                          </RunTimeInformation>
                                          <Filter StartupExpression="false">
                                            <RelOp AvgRowSize="19" EstimateCPU="0.0001581" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Clustered Index Seek" NodeId="17" Parallel="false" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="0.0032831" TableCardinality="182">
                                              <OutputList>
                                                <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="objid" />
                                                <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="subobjid" />
                                                <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                              </OutputList>
                                              <RunTimeInformation>
                                                <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="1" ActualLogicalReads="2" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                              </RunTimeInformation>
                                              <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                                <DefinedValues>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="objid" />
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="subobjid" />
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                                  </DefinedValue>
                                                </DefinedValues>
                                                <Object Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Index="[clst]" Alias="[o]" TableReferenceId="2" IndexKind="Clustered" Storage="RowStore" />
                                                <SeekPredicates>
                                                  <SeekPredicateNew>
                                                    <SeekKeys>
                                                      <Prefix ScanType="EQ">
                                                        <RangeColumns>
                                                          <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valclass" />
                                                          <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="objid" />
                                                          <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="subobjid" />
                                                        </RangeColumns>
                                                        <RangeExpressions>
                                                          <ScalarOperator ScalarString="(54)">
                                                            <Const ConstValue="(54)" />
                                                          </ScalarOperator>
                                                          <ScalarOperator ScalarString="CONVERT_IMPLICIT(int,db_id(),0)">
                                                            <Identifier>
                                                              <ColumnReference Column="ConstExpr1036">
                                                                <ScalarOperator>
                                                                  <Convert DataType="int" Style="0" Implicit="true">
                                                                    <ScalarOperator>
                                                                      <Intrinsic FunctionName="db_id">
                                                                        <ScalarOperator>
                                                                          <Const ConstValue="" />
                                                                        </ScalarOperator>
                                                                      </Intrinsic>
                                                                    </ScalarOperator>
                                                                  </Convert>
                                                                </ScalarOperator>
                                                              </ColumnReference>
                                                            </Identifier>
                                                          </ScalarOperator>
                                                          <ScalarOperator ScalarString="[@obct_id]">
                                                            <Identifier>
                                                              <ColumnReference Column="@obct_id" />
                                                            </Identifier>
                                                          </ScalarOperator>
                                                        </RangeExpressions>
                                                      </Prefix>
                                                    </SeekKeys>
                                                  </SeekPredicateNew>
                                                </SeekPredicates>
                                              </IndexScan>
                                            </RelOp>
                                            <Predicate>
                                              <ScalarOperator ScalarString="has_access(''CO'',[tempdb].[sys].[sysobjvalues].[subobjid] as [o].[subobjid])=(1)">
                                                <Compare CompareOp="EQ">
                                                  <ScalarOperator>
                                                    <Intrinsic FunctionName="has_access">
                                                      <ScalarOperator>
                                                        <Const ConstValue="''CO''" />
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="subobjid" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="" />
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="" />
                                                      </ScalarOperator>
                                                    </Intrinsic>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Const ConstValue="(1)" />
                                                  </ScalarOperator>
                                                </Compare>
                                              </ScalarOperator>
                                            </Predicate>
                                          </Filter>
                                        </RelOp>
                                        <RelOp AvgRowSize="139" EstimateCPU="0.000128157" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="128" LogicalOp="Table-valued function" NodeId="18" Parallel="false" PhysicalOp="Table-valued function" EstimatedTotalSubtreeCost="0.000128157">
                                          <OutputList>
                                            <ColumnReference Table="[TEMPSTATS]" Column="name" />
                                          </OutputList>
                                          <MemoryFractions Input="1" Output="1" />
                                          <RunTimeInformation>
                                            <RunTimeCountersPerThread Thread="0" ActualRebinds="0" ActualRewinds="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                                          </RunTimeInformation>
                                          <TableValuedFunction>
                                            <DefinedValues>
                                              <DefinedValue>
                                                <ColumnReference Table="[TEMPSTATS]" Column="name" />
                                              </DefinedValue>
                                            </DefinedValues>
                                            <Object Table="[TEMPSTATS]" />
                                            <ParameterList>
                                              <ScalarOperator ScalarString="[tempdb].[sys].[sysobjvalues].[objid] as [o].[objid]">
                                                <Identifier>
                                                  <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="objid" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator ScalarString="[tempdb].[sys].[sysobjvalues].[subobjid] as [o].[subobjid]">
                                                <Identifier>
                                                  <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="subobjid" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator ScalarString="[tempdb].[sys].[sysobjvalues].[valnum] as [o].[valnum]">
                                                <Identifier>
                                                  <ColumnReference Database="[tempdb]" Schema="[sys]" Table="[sysobjvalues]" Alias="[o]" Column="valnum" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator ScalarString="(0)">
                                                <Const ConstValue="(0)" />
                                              </ScalarOperator>
                                            </ParameterList>
                                          </TableValuedFunction>
                                        </RelOp>
                                      </NestedLoops>
                                    </RelOp>
                                    <Predicate>
                                      <ScalarOperator ScalarString="TEMPSTATS.[name]=N''WA_FactOnlineSalesPartitioning_Stats_DateKey''">
                                        <Compare CompareOp="EQ">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Table="[TEMPSTATS]" Column="name" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="N''WA_FactOnlineSalesPartitioning_Stats_DateKey''" />
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                    </Predicate>
                                  </Filter>
                                </RelOp>
                              </Concat>
                            </RelOp>
                          </StreamAggregate>
                        </RelOp>
                        <Predicate>
                          <ScalarOperator ScalarString="CASE WHEN [Expr1038]&gt;(1) THEN (0) ELSE NULL END">
                            <IF>
                              <Condition>
                                <ScalarOperator>
                                  <Compare CompareOp="GT">
                                    <ScalarOperator>
                                      <Identifier>
                                        <ColumnReference Column="Expr1038" />
                                      </Identifier>
                                    </ScalarOperator>
                                    <ScalarOperator>
                                      <Const ConstValue="(1)" />
                                    </ScalarOperator>
                                  </Compare>
                                </ScalarOperator>
                              </Condition>
                              <Then>
                                <ScalarOperator>
                                  <Const ConstValue="(0)" />
                                </ScalarOperator>
                              </Then>
                              <Else>
                                <ScalarOperator>
                                  <Const ConstValue="NULL" />
                                </ScalarOperator>
                              </Else>
                            </IF>
                          </ScalarOperator>
                        </Predicate>
                      </Assert>
                    </RelOp>
                  </NestedLoops>
                </RelOp>
              </ComputeScalar>
            </RelOp>
            <ParameterList>
              <ColumnReference Column="@st_id" ParameterDataType="int" ParameterRuntimeValue="(2)" />
              <ColumnReference Column="@obct_id" ParameterDataType="int" ParameterRuntimeValue="(775673811)" />
            </ParameterList>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="10" StatementEstRows="1" StatementId="3" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="GoodEnoughPlanFound" CardinalityEstimationModelVersion="150" StatementSubTreeCost="0.0165773" StatementText="SELECT	stpro.partition_number, pttg.range_key, stpro.rows, stpro.modification_counter&#xD;&#xA;INTO	#statistics&#xD;&#xA;FROM	sys.dm_db_incremental_stats_properties(@obct_id, @st_id) stpro&#xD;&#xA;LEFT JOIN&#xD;&#xA;(&#xD;&#xA;	SELECT	partiton_number = ptti.boundary_id, [range_key] = CONVERT(DATETIME, ptti.value) &#xD;&#xA;	FROM	sys.partition_range_values ptti&#xD;&#xA;	WHERE	ptti.function_id = (SELECT pfos.function_id FROM sys.partition_functions pfos WHERE pfos.name = ''DateKeyFunction'')&#xD;&#xA;) pttg ON stpro.partition_number = pttg.partiton_number&#xD;&#xA;ORDER BY stpro.partition_number" StatementType="SELECT INTO" QueryHash="0x4A01D18B52F171E5" QueryPlanHash="0x720CADF9D2C20DBC" RetrievedFromCache="true" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="1" CachedPlanSize="72" CompileTime="13" CompileCPU="13" CompileMemory="968">
            <Warnings>
              <PlanAffectingConvert ConvertIssue="Cardinality Estimate" Expression="CONVERT(datetime,[Contoso].[sys].[sysobjvalues].[value],0)" />
            </Warnings>
            <MemoryGrantInfo SerialRequiredMemory="0" SerialDesiredMemory="0" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="4331840" />
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Statistics="[_WA_Sys_00000003_0000003C]" ModificationCount="39" SamplingPercent="100" LastUpdate="2021-04-18T13:21:53.04" />
              <StatisticsInfo Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Statistics="[clst]" ModificationCount="39" SamplingPercent="100" LastUpdate="2021-04-18T13:21:52.93" />
              <StatisticsInfo Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Statistics="[clst]" ModificationCount="46" SamplingPercent="100" LastUpdate="2008-07-09T16:20:01.63" />
              <StatisticsInfo Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Statistics="[_WA_Sys_00000002_0000003C]" ModificationCount="39" SamplingPercent="100" LastUpdate="2021-04-18T13:21:53" />
              <StatisticsInfo Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Statistics="[_WA_Sys_00000002_00000040]" ModificationCount="46" SamplingPercent="100" LastUpdate="2009-08-27T01:20:48.33" />
            </OptimizerStatsUsage>
            <WaitStats>
              <Wait WaitType="PAGEIOLATCH_SH" WaitTimeMs="278" WaitCount="19" />
              <Wait WaitType="MEMORY_ALLOCATION_EXT" WaitTimeMs="67" WaitCount="3275" />
            </WaitStats>
            <QueryTimeStats CpuTime="233" ElapsedTime="433" />
            <RelOp AvgRowSize="9" EstimateCPU="1E-06" EstimateIO="0.01" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Insert" NodeId="0" Parallel="false" PhysicalOp="Table Insert" EstimatedTotalSubtreeCost="0.0165773">
              <OutputList />
              <RunTimeInformation>
                <RunTimeCountersPerThread Thread="0" ActualRows="759" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="487" ActualCPUms="209" ActualScans="0" ActualLogicalReads="762" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
              </RunTimeInformation>
              <Update DMLRequestSort="false">
                <Object Table="[#statistics]" Storage="RowStore" />
                <SetPredicate>
                  <ScalarOperator ScalarString="[#statistics].[partition_number] = DM_DB_STATS_PROPERTIES.[partition_number],[#statistics].[range_key] = [Expr1011],[#statistics].[rows] = DM_DB_STATS_PROPERTIES.[rows],[#statistics].[modification_counter] = DM_DB_STATS_PROPERTIES.[modification_counter]">
                    <ScalarExpressionList>
                      <ScalarOperator>
                        <MultipleAssign>
                          <Assign>
                            <ColumnReference Table="[#statistics]" Column="partition_number" />
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="partition_number" />
                              </Identifier>
                            </ScalarOperator>
                          </Assign>
                          <Assign>
                            <ColumnReference Table="[#statistics]" Column="range_key" />
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Column="Expr1011" />
                              </Identifier>
                            </ScalarOperator>
                          </Assign>
                          <Assign>
                            <ColumnReference Table="[#statistics]" Column="rows" />
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="rows" />
                              </Identifier>
                            </ScalarOperator>
                          </Assign>
                          <Assign>
                            <ColumnReference Table="[#statistics]" Column="modification_counter" />
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="modification_counter" />
                              </Identifier>
                            </ScalarOperator>
                          </Assign>
                        </MultipleAssign>
                      </ScalarOperator>
                    </ScalarExpressionList>
                  </ScalarOperator>
                </SetPredicate>
                <RelOp AvgRowSize="35" EstimateCPU="4.18E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Left Outer Join" NodeId="1" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="0.0065763">
                  <OutputList>
                    <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="rows" />
                    <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="modification_counter" />
                    <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="partition_number" />
                    <ColumnReference Column="Expr1011" />
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="0" ActualRows="759" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="382" ActualCPUms="200" />
                  </RunTimeInformation>
                  <NestedLoops Optimized="false">
                    <OuterReferences>
                      <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="partition_number" />
                    </OuterReferences>
                    <RelOp AvgRowSize="27" EstimateCPU="4.8E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Filter" NodeId="2" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="1.637E-06">
                      <OutputList>
                        <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="rows" />
                        <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="modification_counter" />
                        <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="partition_number" />
                      </OutputList>
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="759" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="369" ActualCPUms="187" />
                      </RunTimeInformation>
                      <Filter StartupExpression="false">
                        <RelOp AvgRowSize="27" EstimateCPU="1.157E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Table-valued function" NodeId="3" Parallel="false" PhysicalOp="Table-valued function" EstimatedTotalSubtreeCost="1.157E-06">
                          <OutputList>
                            <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="rows" />
                            <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="modification_counter" />
                            <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="partition_number" />
                          </OutputList>
                          <MemoryFractions Input="0" Output="0" />
                          <RunTimeInformation>
                            <RunTimeCountersPerThread Thread="0" ActualRebinds="1" ActualRewinds="0" ActualRows="1517" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="368" ActualCPUms="186" />
                          </RunTimeInformation>
                          <TableValuedFunction>
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="rows" />
                              </DefinedValue>
                              <DefinedValue>
                                <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="modification_counter" />
                              </DefinedValue>
                              <DefinedValue>
                                <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="partition_number" />
                              </DefinedValue>
                            </DefinedValues>
                            <Object Table="[DM_DB_STATS_PROPERTIES]" />
                            <ParameterList>
                              <ScalarOperator ScalarString="[@obct_id]">
                                <Identifier>
                                  <ColumnReference Column="@obct_id" />
                                </Identifier>
                              </ScalarOperator>
                              <ScalarOperator ScalarString="[@st_id]">
                                <Identifier>
                                  <ColumnReference Column="@st_id" />
                                </Identifier>
                              </ScalarOperator>
                            </ParameterList>
                          </TableValuedFunction>
                        </RelOp>
                        <Predicate>
                          <ScalarOperator ScalarString="DM_DB_STATS_PROPERTIES.[partition_number] IS NOT NULL">
                            <Compare CompareOp="IS NOT">
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="partition_number" />
                                </Identifier>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Const ConstValue="NULL" />
                              </ScalarOperator>
                            </Compare>
                          </ScalarOperator>
                        </Predicate>
                      </Filter>
                    </RelOp>
                    <RelOp AvgRowSize="15" EstimateCPU="1E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="4" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="0.00657048">
                      <OutputList>
                        <ColumnReference Column="Expr1011" />
                      </OutputList>
                      <ComputeScalar>
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Expr1011" />
                            <ScalarOperator ScalarString="CONVERT(datetime,[Contoso].[sys].[sysobjvalues].[value],0)">
                              <Convert DataType="datetime" Style="0" Implicit="false">
                                <ScalarOperator>
                                  <Identifier>
                                    <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Column="value" />
                                  </Identifier>
                                </ScalarOperator>
                              </Convert>
                            </ScalarOperator>
                          </DefinedValue>
                        </DefinedValues>
                        <RelOp AvgRowSize="4019" EstimateCPU="4.18E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Inner Join" NodeId="5" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="0.00657038">
                          <OutputList>
                            <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Column="value" />
                          </OutputList>
                          <RunTimeInformation>
                            <RunTimeCountersPerThread Thread="0" ActualRows="758" Batches="0" ActualEndOfScans="759" ActualExecutions="759" ActualExecutionMode="Row" ActualElapsedms="12" ActualCPUms="12" />
                          </RunTimeInformation>
                          <NestedLoops Optimized="false">
                            <OuterReferences>
                              <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Alias="[f]" Column="id" />
                            </OuterReferences>
                            <RelOp AvgRowSize="11" EstimateCPU="0.0001581" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Index Seek" NodeId="6" Parallel="false" PhysicalOp="Index Seek" EstimatedTotalSubtreeCost="0.0032831" TableCardinality="20">
                              <OutputList>
                                <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Alias="[f]" Column="id" />
                              </OutputList>
                              <RunTimeInformation>
                                <RunTimeCountersPerThread Thread="0" ActualRows="759" ActualRowsRead="759" Batches="0" ActualEndOfScans="759" ActualExecutions="759" ActualExecutionMode="Row" ActualElapsedms="4" ActualCPUms="4" ActualScans="0" ActualLogicalReads="1518" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                              </RunTimeInformation>
                              <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Alias="[f]" Column="id" />
                                  </DefinedValue>
                                </DefinedValues>
                                <Object Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Index="[nc]" Alias="[f]" IndexKind="NonClustered" Storage="RowStore" />
                                <SeekPredicates>
                                  <SeekPredicateNew>
                                    <SeekKeys>
                                      <Prefix ScanType="EQ">
                                        <RangeColumns>
                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Alias="[f]" Column="name" />
                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Alias="[f]" Column="class" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="N''DateKeyFunction''">
                                            <Const ConstValue="N''DateKeyFunction''" />
                                          </ScalarOperator>
                                          <ScalarOperator ScalarString="(30)">
                                            <Const ConstValue="(30)" />
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </Prefix>
                                    </SeekKeys>
                                  </SeekPredicateNew>
                                </SeekPredicates>
                              </IndexScan>
                            </RelOp>
                            <RelOp AvgRowSize="4019" EstimateCPU="0.0001581" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Clustered Index Seek" NodeId="7" Parallel="false" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="0.0032831" TableCardinality="7460">
                              <OutputList>
                                <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Column="value" />
                              </OutputList>
                              <RunTimeInformation>
                                <RunTimeCountersPerThread Thread="0" ActualRows="758" ActualRowsRead="758" Batches="0" ActualEndOfScans="759" ActualExecutions="759" ActualExecutionMode="Row" ActualElapsedms="6" ActualCPUms="6" ActualScans="759" ActualLogicalReads="2285" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                              </RunTimeInformation>
                              <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Column="value" />
                                  </DefinedValue>
                                </DefinedValues>
                                <Object Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Index="[clst]" IndexKind="Clustered" Storage="RowStore" />
                                <SeekPredicates>
                                  <SeekPredicateNew>
                                    <SeekKeys>
                                      <Prefix ScanType="EQ">
                                        <RangeColumns>
                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Column="valclass" />
                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Column="objid" />
                                          <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysobjvalues]" Column="subobjid" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="(30)">
                                            <Const ConstValue="(30)" />
                                          </ScalarOperator>
                                          <ScalarOperator ScalarString="[Contoso].[sys].[sysclsobjs].[id] as [f].[id]">
                                            <Identifier>
                                              <ColumnReference Database="[Contoso]" Schema="[sys]" Table="[sysclsobjs]" Alias="[f]" Column="id" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator ScalarString="DM_DB_STATS_PROPERTIES.[partition_number]">
                                            <Identifier>
                                              <ColumnReference Table="[DM_DB_STATS_PROPERTIES]" Column="partition_number" />
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
                      </ComputeScalar>
                    </RelOp>
                  </NestedLoops>
                </RelOp>
              </Update>
            </RelOp>
            <ParameterList>
              <ColumnReference Column="@st_id" ParameterDataType="int" ParameterRuntimeValue="(2)" />
              <ColumnReference Column="@obct_id" ParameterDataType="int" ParameterRuntimeValue="(775673811)" />
            </ParameterList>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="11" StatementEstRows="1" StatementId="4" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="GoodEnoughPlanFound" CardinalityEstimationModelVersion="150" StatementSubTreeCost="0.00679502" StatementText="SELECT	&#xD;&#xA;	@first = MIN(CASE WHEN @parm1 &lt;stpro.range_key THEN stpro.range_key END),&#xD;&#xA;	@last  = MIN(CASE WHEN @parm2 &lt;stpro.range_key THEN stpro.range_key END)&#xD;&#xA;FROM	#statistics stpro" StatementType="SELECT" QueryHash="0x7D4639F0BA4580C6" QueryPlanHash="0x30E49E7DE96B11DF" RetrievedFromCache="true" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="1" CachedPlanSize="16" CompileTime="1" CompileCPU="1" CompileMemory="184">
            <MemoryGrantInfo SerialRequiredMemory="0" SerialDesiredMemory="0" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="4239104" />
            <QueryTimeStats CpuTime="0" ElapsedTime="0" />
            <RelOp AvgRowSize="23" EstimateCPU="0.0004559" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="0" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="0.00679502">
              <OutputList>
                <ColumnReference Column="Expr1002" />
                <ColumnReference Column="Expr1003" />
              </OutputList>
              <RunTimeInformation>
                <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
              </RunTimeInformation>
              <StreamAggregate>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1002" />
                    <ScalarOperator ScalarString="MIN(CASE WHEN [@parm1]&lt;#statistics.[range_key] as [stpro].[range_key] THEN #statistics.[range_key] as [stpro].[range_key] ELSE NULL END)">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <IF>
                            <Condition>
                              <ScalarOperator>
                                <Compare CompareOp="LT">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Column="@parm1" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Table="#statistics" Alias="[stpro]" Column="range_key" />
                                    </Identifier>
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                            </Condition>
                            <Then>
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Table="#statistics" Alias="[stpro]" Column="range_key" />
                                </Identifier>
                              </ScalarOperator>
                            </Then>
                            <Else>
                              <ScalarOperator>
                                <Const ConstValue="NULL" />
                              </ScalarOperator>
                            </Else>
                          </IF>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                  <DefinedValue>
                    <ColumnReference Column="Expr1003" />
                    <ScalarOperator ScalarString="MIN(CASE WHEN [@parm2]&lt;#statistics.[range_key] as [stpro].[range_key] THEN #statistics.[range_key] as [stpro].[range_key] ELSE NULL END)">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <IF>
                            <Condition>
                              <ScalarOperator>
                                <Compare CompareOp="LT">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Column="@parm2" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Table="#statistics" Alias="[stpro]" Column="range_key" />
                                    </Identifier>
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                            </Condition>
                            <Then>
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Table="#statistics" Alias="[stpro]" Column="range_key" />
                                </Identifier>
                              </ScalarOperator>
                            </Then>
                            <Else>
                              <ScalarOperator>
                                <Const ConstValue="NULL" />
                              </ScalarOperator>
                            </Else>
                          </IF>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="15" EstimateCPU="0.0009919" EstimateIO="0.00534722" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="759" EstimatedRowsRead="759" LogicalOp="Table Scan" NodeId="1" Parallel="false" PhysicalOp="Table Scan" EstimatedTotalSubtreeCost="0.00633912" TableCardinality="759">
                  <OutputList>
                    <ColumnReference Table="#statistics" Alias="[stpro]" Column="range_key" />
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="0" ActualRows="759" ActualRowsRead="759" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="1" ActualLogicalReads="4" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                  </RunTimeInformation>
                  <TableScan Ordered="false" ForcedIndex="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Table="#statistics" Alias="[stpro]" Column="range_key" />
                      </DefinedValue>
                    </DefinedValues>
                    <Object Database="[tempdb]" Schema="[dbo]" Table="[#statistics]" Alias="[stpro]" Storage="RowStore" />
                  </TableScan>
                </RelOp>
              </StreamAggregate>
            </RelOp>
            <ParameterList>
              <ColumnReference Column="@last" ParameterDataType="datetime" ParameterRuntimeValue="''2009-11-24 00:00:00.000''" />
              <ColumnReference Column="@first" ParameterDataType="datetime" ParameterRuntimeValue="''2007-07-01 00:00:00.000''" />
              <ColumnReference Column="@parm2" ParameterDataType="datetime" ParameterRuntimeValue="''2009-11-23 00:00:00.000''" />
              <ColumnReference Column="@parm1" ParameterDataType="datetime" ParameterRuntimeValue="''2007-06-30 00:00:00.000''" />
            </ParameterList>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="12" StatementEstRows="1" StatementId="5" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="GoodEnoughPlanFound" CardinalityEstimationModelVersion="150" StatementSubTreeCost="0.00330088" StatementText="IF EXISTS (&#xD;&#xA;	SELECT	*&#xD;&#xA;	FROM	#statistics sttics&#xD;&#xA;	WHERE	sttics.range_key &lt;= @last&#xD;&#xA;	AND		sttics.modification_counter = 0&#xD;&#xA;)" StatementType="COND WITH QUERY" QueryHash="0x5C20ECFBA4E065E3" QueryPlanHash="0xDA4DC56FACF432C2" RetrievedFromCache="true" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="1" CachedPlanSize="24" CompileTime="79" CompileCPU="42" CompileMemory="208">
            <MemoryGrantInfo SerialRequiredMemory="0" SerialDesiredMemory="0" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="4239104" />
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[tempdb]" Schema="[dbo]" Table="[#statistics_________________________________________________________________________________________________________000000000005]" Statistics="[_WA_Sys_00000004_A3D0EDE7]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-05-02T16:47:33.72" />
            </OptimizerStatsUsage>
            <QueryTimeStats CpuTime="0" ElapsedTime="0" />
            <RelOp AvgRowSize="11" EstimateCPU="1E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="0" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="0.00330088">
              <OutputList>
                <ColumnReference Column="Expr1003" />
              </OutputList>
              <ComputeScalar>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1003" />
                    <ScalarOperator ScalarString="CASE WHEN [Expr1004] THEN (1) ELSE (0) END">
                      <IF>
                        <Condition>
                          <ScalarOperator>
                            <Identifier>
                              <ColumnReference Column="Expr1004" />
                            </Identifier>
                          </ScalarOperator>
                        </Condition>
                        <Then>
                          <ScalarOperator>
                            <Const ConstValue="(1)" />
                          </ScalarOperator>
                        </Then>
                        <Else>
                          <ScalarOperator>
                            <Const ConstValue="(0)" />
                          </ScalarOperator>
                        </Else>
                      </IF>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="9" EstimateCPU="4.18E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Left Semi Join" NodeId="1" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="0.00330078">
                  <OutputList>
                    <ColumnReference Column="Expr1004" />
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                  </RunTimeInformation>
                  <NestedLoops Optimized="false">
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="Expr1004" />
                      </DefinedValue>
                    </DefinedValues>
                    <ProbeColumn>
                      <ColumnReference Column="Expr1004" />
                    </ProbeColumn>
                    <RelOp AvgRowSize="9" EstimateCPU="1.157E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Constant Scan" NodeId="2" Parallel="false" PhysicalOp="Constant Scan" EstimatedTotalSubtreeCost="1.157E-06">
                      <OutputList />
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                      </RunTimeInformation>
                      <ConstantScan />
                    </RelOp>
                    <RelOp AvgRowSize="23" EstimateCPU="0.0009919" EstimateIO="0.00534722" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" EstimateRowsWithoutRowGoal="227.7" EstimatedRowsRead="759" LogicalOp="Table Scan" NodeId="3" Parallel="false" PhysicalOp="Table Scan" EstimatedTotalSubtreeCost="0.00329251" TableCardinality="759">
                      <OutputList />
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="1" ActualRowsRead="1" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="1" ActualLogicalReads="1" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                      </RunTimeInformation>
                      <TableScan Ordered="false" ForcedIndex="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                        <DefinedValues />
                        <Object Database="[tempdb]" Schema="[dbo]" Table="[#statistics]" Alias="[sttics]" Storage="RowStore" />
                        <Predicate>
                          <ScalarOperator ScalarString="#statistics.[range_key] as [sttics].[range_key]&lt;=[@last] AND #statistics.[modification_counter] as [sttics].[modification_counter]=(0)">
                            <Logical Operation="AND">
                              <ScalarOperator>
                                <Compare CompareOp="LE">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Table="#statistics" Alias="[sttics]" Column="range_key" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Column="@last" />
                                    </Identifier>
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Compare CompareOp="EQ">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Table="#statistics" Alias="[sttics]" Column="modification_counter" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Const ConstValue="(0)" />
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                            </Logical>
                          </ScalarOperator>
                        </Predicate>
                      </TableScan>
                    </RelOp>
                  </NestedLoops>
                </RelOp>
              </ComputeScalar>
            </RelOp>
            <ParameterList>
              <ColumnReference Column="@last" ParameterDataType="datetime" ParameterRuntimeValue="''2009-11-24 00:00:00.000''" />
            </ParameterList>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="13" StatementEstRows="1" StatementId="6" StatementOptmLevel="FULL" CardinalityEstimationModelVersion="150" StatementSubTreeCost="31.7331" StatementText="SELECT	@cot1 = COUNT(*)&#xD;&#xA;	FROM	FactOnlineSalesPartitioning fcto&#xD;&#xA;	WHERE	fcto.DateKey &gt;= @parm1 &#xD;&#xA;	AND		fcto.DateKey &lt; @first" StatementType="SELECT" QueryHash="0xF6152DEAA4B0666B" QueryPlanHash="0xC382862AA40C73AF" RetrievedFromCache="true" SecurityPolicyApplied="false" BatchModeOnRowStoreUsed="true">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="8" MemoryGrant="24776" CachedPlanSize="144" CompileTime="38" CompileCPU="38" CompileMemory="3592">
            <ThreadStat Branches="1" UsedThreads="8">
              <ThreadReservation NodeId="0" ReservedThreads="9" />
            </ThreadStat>
            <MemoryGrantInfo SerialRequiredMemory="3072" SerialDesiredMemory="3104" RequiredMemory="24712" DesiredMemory="24776" RequestedMemory="24776" GrantWaitTime="0" GrantedMemory="24776" MaxUsedMemory="2952" MaxQueryMemory="1066040" LastRequestedMemory="0" IsMemoryGrantFeedbackAdjusted="No: First Execution" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="4331840" />
            <WaitStats>
              <Wait WaitType="CXROWSET_SYNC" WaitTimeMs="206" WaitCount="28" />
              <Wait WaitType="LATCH_SH" WaitTimeMs="39" WaitCount="1" />
              <Wait WaitType="CXPACKET" WaitTimeMs="5" WaitCount="8" />
              <Wait WaitType="MEMORY_ALLOCATION_EXT" WaitTimeMs="3" WaitCount="224" />
              <Wait WaitType="HTBUILD" WaitTimeMs="3" WaitCount="14" />
              <Wait WaitType="HTDELETE" WaitTimeMs="2" WaitCount="14" />
              <Wait WaitType="RESERVED_MEMORY_ALLOCATION_EXT" WaitTimeMs="1" WaitCount="183" />
            </WaitStats>
            <QueryTimeStats CpuTime="92" ElapsedTime="43" />
            <RelOp AvgRowSize="15" EstimateCPU="1E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="0" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="31.7241">
              <OutputList>
                <ColumnReference Column="Expr1003" />
              </OutputList>
              <ComputeScalar>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1003" />
                    <ScalarOperator ScalarString="CONVERT_IMPLICIT(bigint,[Expr1002],0)">
                      <Convert DataType="bigint" Style="0" Implicit="true">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Column="Expr1002" />
                          </Identifier>
                        </ScalarOperator>
                      </Convert>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="11" EstimateCPU="0.0285019" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Gather Streams" NodeId="1" Parallel="true" PhysicalOp="Parallelism" EstimatedTotalSubtreeCost="31.7241">
                  <OutputList>
                    <ColumnReference Column="Expr1002" />
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="44" ActualCPUms="1" />
                  </RunTimeInformation>
                  <Parallelism>
                    <RelOp AvgRowSize="11" EstimateCPU="0" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="2" Parallel="true" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="31.6956">
                      <OutputList>
                        <ColumnReference Column="Expr1002" />
                      </OutputList>
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="8" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="7" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="6" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="5" ActualRows="1" Batches="1" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="4" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="3" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="2" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="1" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                        <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                      </RunTimeInformation>
                      <ComputeScalar>
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Expr1002" />
                            <ScalarOperator ScalarString="CONVERT_IMPLICIT(int,[Expr1006],0)">
                              <Convert DataType="int" Style="0" Implicit="true">
                                <ScalarOperator>
                                  <Identifier>
                                    <ColumnReference Column="Expr1006" />
                                  </Identifier>
                                </ScalarOperator>
                              </Convert>
                            </ScalarOperator>
                          </DefinedValue>
                        </DefinedValues>
                        <RelOp AvgRowSize="11" EstimateCPU="0.0225244" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Aggregate" NodeId="3" Parallel="true" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="31.6956">
                          <OutputList>
                            <ColumnReference Column="Expr1006" />
                          </OutputList>
                          <MemoryFractions Input="1" Output="1" />
                          <RunTimeInformation>
                            <RunTimeCountersPerThread Thread="8" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="1" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="7" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="1" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="6" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="5" ActualRows="1" Batches="1" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="1" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="4" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="1" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="3" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="1" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="2" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="1" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="1" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                            <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                          </RunTimeInformation>
                          <Hash>
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Column="Expr1006" />
                                <ScalarOperator ScalarString="COUNT(*)">
                                  <Aggregate AggType="COUNT*" Distinct="false" />
                                </ScalarOperator>
                              </DefinedValue>
                            </DefinedValues>
                            <HashKeysBuild />
                            <RelOp AvgRowSize="9" EstimateCPU="0.590112" EstimateIO="31.083" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="2074930" EstimatedRowsRead="2074930" LogicalOp="Clustered Index Seek" NodeId="4" Parallel="true" Partitioned="true" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="31.6731" TableCardinality="12627600">
                              <OutputList />
                              <RunTimeInformation>
                                <RunTimeCountersPerThread Thread="8" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="40" ActualCPUms="0" ActualScans="1" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="7" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="40" ActualCPUms="0" ActualScans="1" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="6" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="41" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="5" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="41" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="4" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="41" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="3" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="40" ActualCPUms="39" ActualScans="1" ActualLogicalReads="3" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="2" ActualRows="11108" ActualRowsRead="11108" Batches="13" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="41" ActualCPUms="41" ActualScans="1" ActualLogicalReads="225" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="1" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="1" ActualExecutionMode="Batch" ActualElapsedms="40" ActualCPUms="0" ActualScans="1" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                <RunTimeCountersPerThread Thread="0" ActualRows="0" Batches="0" ActualEndOfScans="0" ActualExecutions="0" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" />
                              </RunTimeInformation>
                              <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                <DefinedValues />
                                <Object Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Index="[PK_FactOnlineSalesPartitioning_SalesKey]" Alias="[fcto]" IndexKind="Clustered" Storage="RowStore" />
                                <SeekPredicates>
                                  <SeekPredicateNew>
                                    <SeekKeys>
                                      <StartRange ScanType="GE">
                                        <RangeColumns>
                                          <ColumnReference Column="PtnId1000" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="RangePartitionNew([@parm1],(1),''2007-06-30 00:00:00.000'',''2007-01-03 00:00:00.000'',''2007-01-04 00:00:00.000'',''2007-01-05 00:00:00.000'',''2007-01-06 00:00:00.000'',''2007-01-07 00:00:00.000'',''2007-01-08 00:00:00.000'',''2007-01-09 00:00:00.000'',''2007-01-10 00:00:00.000'',''2007-01-11 00:00:00.000'',''2007-01-12 00:00:00.000'',''2007-01-13 00:00:00.000'',''2007-01-14 00:00:00.000'',''2007-01-15 00:00:00.000'',''2007-01-16 00:00:00.000'',''2007-01-17 00:00:00.000'',''2007-01-18 00:00:00.000'',''2007-01-19 00:00:00.000'',''2007-01-20 00:00:00.000'',''2007-01-21 00:00:00.000'',''2007-01-22 00:00:00.000'',''2007-01-23 00:00:00.000'',''2007-01-24 00:00:00.000'',''2007-01-25 00:00:00.000'',''2007-01-26 00:00:00.000'',''2007-01-27 00:00:00.000'',''2007-01-28 00:00:00.000'',''2007-01-29 00:00:00.000'',''2007-01-30 00:00:00.000'',''2007-01-31 00:00:00.000'',''2007-02-01 00:00:00.000'',''2007-02-02 00:00:00.000'',''2007-02-03 00:00:00.000'',''2007-02-04 00:00:00.000'',''2007-02-05 00:00:00.000'',''2007-02-06 00:00:00.000'',''2007-02-07 00:00:00.000'',''2007-02-08 00:00:00.000'',''2007-02-09 00:00:00.000'',''2007-02-10 00:00:00.000'',''2007-02-11 00:00:00.000'',''2007-02-12 00:00:00.000'',''2007-02-13 00:00:00.000'',''2007-02-14 00:00:00.000'',''2007-02-15 00:00:00.000'',''2007-02-16 00:00:00.000'',''2007-02-17 00:00:00.000'',''2007-02-18 00:00:00.000'',''2007-02-19 00:00:00.000'',''2007-02-20 00:00:00.000'',''2007-02-21 00:00:00.000'',''2007-02-22 00:00:00.000'',''2007-02-23 00:00:00.000'',''2007-02-24 00:00:00.000'',''2007-02-25 00:00:00.000'',''2007-02-26 00:00:00.000'',''2007-02-27 00:00:00.000'',''2007-02-28 00:00:00.000'',''2007-03-01 00:00:00.000'',''2007-03-02 00:00:00.000'',''2007-03-03 00:00:00.000'',''2007-03-04 00:00:00.000'',''2007-03-05 00:00:00.000'',''2007-03-06 00:00:00.000'',''2007-03-07 00:00:00.000'',''2007-03-08 00:00:00.000'',''2007-03-09 00:00:00.000'',''2007-03-10 00:00:00.000'',''2007-03-11 00:00:00.000'',''2007-03-12 00:00:00.000'',''2007-03-13 00:00:00.000'',''2007-03-14 00:00:00.000'',''2007-03-15 00:00:00.000'',''2007-03-16 00:00:00.000'',''2007-03-17 00:00:00.000'',''2007-03-18 00:00:00.000'',''2007-03-19 00:00:00.000'',''2007-03-20 00:00:00.000'',''2007-03-21 00:00:00.000'',''2007-03-22 00:00:00.000'',''2007-03-23 00:00:00.000'',''2007-03-24 00:00:00.000'',''2007-03-25 00:00:00.000'',''2007-03-26 00:00:00.000'',''2007-03-27 00:00:00.000'',''2007-03-28 00:00:00.000'',''2007-03-29 00:00:00.000'',''2007-03-30 00:00:00.000'',''2007-03-31 00:00:00.000'',''2007-04-01 00:00:00.000'',''2007-04-02 00:00:00.000'',''2007-04-03 00:00:00.000'',''2007-04-04 00:00:00.000'',''2007-04-05 00:00:00.000'',''2007-04-06 00:00:00.000'',''2007-04-07 00:00:00.000'',''2007-04-08 00:00:00.000'',''2007-04-09 00:00:00.000'',''2007-04-10 00:00:00.000'',''2007-04-11 00:00:00.000'',''2007-04-12 00:00:00.000'',''2007-04-13 00:00:00.000'',''2007-04-14 00:00:00.000'',''2007-04-15 00:00:00.000'',''2007-04-16 00:00:00.000'',''2007-04-17 00:00:00.000'',''2007-04-18 00:00:00.000'',''2007-04-19 00:00:00.000'',''2007-04-20 00:00:00.000'',''2007-04-21 00:00:00.000'',''2007-04-22 00:00:00.000'',''2007-04-23 00:00:00.000'',''2007-04-24 00:00:00.000'',''2007-04-25 00:00:00.000'',''2007-04-26 00:00:00.000'',''2007-04-27 00:00:00.000'',''2007-04-28 00:00:00.000'',''2007-04-29 00:00:00.000'',''2007-04-30 00:00:00.000'',''2007-05-01 00:00:00.000'',''2007-05-02 00:00:00.000'',''2007-05-03 00:00:00.000'',''2007-05-04 00:00:00.000'',''2007-05-05 00:00:00.000'',''2007-05-06 00:00:00.000'',''2007-05-07 00:00:00.000'',''2007-05-08 00:00:00.000'',''2007-05-09 00:00:00.000'',''2007-05-10 00:00:00.000'',''2007-05-11 00:00:00.000'',''2007-05-12 00:00:00.000'',''2007-05-13 00:00:00.000'',''2007-05-14 00:00:00.000'',''2007-05-15 00:00:00.000'',''2007-05-16 00:00:00.000'',''2007-05-17 00:00:00.000'',''2007-05-18 00:00:00.000'',''2007-05-19 00:00:00.000'',''2007-05-20 00:00:00.000'',''2007-05-21 00:00:00.000'',''2007-05-22 00:00:00.000'',''2007-05-23 00:00:00.000'',''2007-05-24 00:00:00.000'',''2007-05-25 00:00:00.000'',''2007-05-26 00:00:00.000'',''2007-05-27 00:00:00.000'',''2007-05-28 00:00:00.000'',''2007-05-29 00:00:00.000'',''2007-05-30 00:00:00.000'',''2007-05-31 00:00:00.000'',''2007-06-01 00:00:00.000'',''2007-06-02 00:00:00.000'',''2007-06-03 00:00:00.000'',''2007-06-04 00:00:00.000'',''2007-06-05 00:00:00.000'',''2007-06-06 00:00:00.000'',''2007-06-07 00:00:00.000'',''2007-06-08 00:00:00.000'',''2007-06-09 00:00:00.000'',''2007-06-10 00:00:00.000'',''2007-06-11 00:00:00.000'',''2007-06-12 00:00:00.000'',''2007-06-13 00:00:00.000'',''2007-06-14 00:00:00.000'',''2007-06-15 00:00:00.000'',''2007-06-16 00:00:00.000'',''2007-06-17 00:00:00.000'',''2007-06-18 00:00:00.000'',''2007-06-19 00:00:00.000'',''2007-06-20 00:00:00.000'',''2007-06-21 00:00:00.000'',''2007-06-22 00:00:00.000'',''2007-06-23 00:00:00.000'',''2007-06-24 00:00:00.000'',''2007-06-25 00:00:00.000'',''2007-06-26 00:00:00.000'',''2007-06-27 00:00:00.000'',''2007-06-28 00:00:00.000'',''2007-06-29 00:00:00.000'',''2007-06-30 00:00:00.000'',''2007-07-01 00:00:00.000'',''2007-07-02 00:00:00.000'',''2007-07-03 00:00:00.000'',''2007-07-04 00:00:00.000'',''2007-07-05 00:00:00.000'',''2007-07-06 00:00:00.000'',''2007-07-07 00:00:00.000'',''2007-07-08 00:00:00.000'',''2007-07-09 00:00:00.000'',''2007-07-10 00:00:00.000'',''2007-07-11 00:00:00.000'',''2007-07-12 00:00:00.000'',''2007-07-13 00:00:00.000'',''2007-07-14 00:00:00.000'',''2007-07-15 00:00:00.000'',''2007-07-16 00:00:00.000'',''2007-07-17 00:00:00.000'',''2007-07-18 00:00:00.000'',''2007-07-19 00:00:00.000'',''2007-07-20 00:00:00.000'',''2007-07-21 00:00:00.000'',''2007-07-22 00:00:00.000'',''2007-07-23 00:00:00.000'',''2007-07-24 00:00:00.000'',''2007-07-25 00:00:00.000'',''2007-07-26 00:00:00.000'',''2007-07-27 00:00:00.000'',''2007-07-28 00:00:00.000'',''2007-07-29 00:00:00.000'',''2007-07-30 00:00:00.000'',''2007-07-31 00:00:00.000'',''2007-08-01 00:00:00.000'',''2007-08-02 00:00:00.000'',''2007-08-03 00:00:00.000'',''2007-08-04 00:00:00.000'',''2007-08-05 00:00:00.000'',''2007-08-06 00:00:00.000'',''2007-08-07 00:00:00.000'',''2007-08-08 00:00:00.000'',''2007-08-09 00:00:00.000'',''2007-08-10 00:00:00.000'',''2007-08-11 00:00:00.000'',''2007-08-12 00:00:00.000'',''2007-08-13 00:00:00.000'',''2007-08-14 00:00:00.000'',''2007-08-15 00:00:00.000'',''2007-08-16 00:00:00.000'',''2007-08-17 00:00:00.000'',''2007-08-18 00:00:00.000'',''2007-08-19 00:00:00.000'',''2007-08-20 00:00:00.000'',''2007-08-21 00:00:00.000'',''2007-08-22 00:00:00.000'',''2007-08-23 00:00:00.000'',''2007-08-24 00:00:00.000'',''2007-08-25 00:00:00.000'',''2007-08-26 00:00:00.000'',''2007-08-27 00:00:00.000'',''2007-08-28 00:00:00.000'',''2007-08-29 00:00:00.000'',''2007-08-30 00:00:00.000'',''2007-08-31 00:00:00.000'',''2007-09-01 00:00:00.000'',''2007-09-02 00:00:00.000'',''2007-09-03 00:00:00.000'',''2007-09-04 00:00:00.000'',''2007-09-05 00:00:00.000'',''2007-09-06 00:00:00.000'',''2007-09-07 00:00:00.000'',''2007-09-08 00:00:00.000'',''2007-09-09 00:00:00.000'',''2007-09-10 00:00:00.000'',''2007-09-11 00:00:00.000'',''2007-09-12 00:00:00.000'',''2007-09-13 00:00:00.000'',''2007-09-14 00:00:00.000'',''2007-09-15 00:00:00.000'',''2007-09-16 00:00:00.000'',''2007-09-17 00:00:00.000'',''2007-09-18 00:00:00.000'',''2007-09-19 00:00:00.000'',''2007-09-20 00:00:00.000'',''2007-09-21 00:00:00.000'',''2007-09-22 00:00:00.000'',''2007-09-23 00:00:00.000'',''2007-09-24 00:00:00.000'',''2007-09-25 00:00:00.000'',''2007-09-26 00:00:00.000'',''2007-09-27 00:00:00.000'',''2007-09-28 00:00:00.000'',''2007-09-29 00:00:00.000'',''2007-09-30 00:00:00.000'',''2007-10-01 00:00:00.000'',''2007-10-02 00:00:00.000'',''2007-10-03 00:00:00.000'',''2007-10-04 00:00:00.000'',''2007-10-05 00:00:00.000'',''2007-10-06 00:00:00.000'',''2007-10-07 00:00:00.000'',''2007-10-08 00:00:00.000'',''2007-10-09 00:00:00.000'',''2007-10-10 00:00:00.000'',''2007-10-11 00:00:00.000'',''2007-10-12 00:00:00.000'',''2007-10-13 00:00:00.000'',''2007-10-14 00:00:00.000'',''2007-10-15 00:00:00.000'',''2007-10-16 00:00:00.000'',''2007-10-17 00:00:00.000'',''2007-10-18 00:00:00.000'',''2007-10-19 00:00:00.000'',''2007-10-20 00:00:00.000'',''2007-10-21 00:00:00.000'',''2007-10-22 00:00:00.000'',''2007-10-23 00:00:00.000'',''2007-10-24 00:00:00.000'',''2007-10-25 00:00:00.000'',''2007-10-26 00:00:00.000'',''2007-10-27 00:00:00.000'',''2007-10-28 00:00:00.000'',''2007-10-29 00:00:00.000'',''2007-10-30 00:00:00.000'',''2007-10-31 00:00:00.000'',''2007-11-01 00:00:00.000'',''2007-11-02 00:00:00.000'',''2007-11-03 00:00:00.000'',''2007-11-04 00:00:00.000'',''2007-11-05 00:00:00.000'',''2007-11-06 00:00:00.000'',''2007-11-07 00:00:00.000'',''2007-11-08 00:00:00.000'',''2007-11-09 00:00:00.000'',''2007-11-10 00:00:00.000'',''2007-11-11 00:00:00.000'',''2007-11-12 00:00:00.000'',''2007-11-13 00:00:00.000'',''2007-11-14 00:00:00.000'',''2007-11-15 00:00:00.000'',''2007-11-16 00:00:00.000'',''2007-11-17 00:00:00.000'',''2007-11-18 00:00:00.000'',''2007-11-19 00:00:00.000'',''2007-11-20 00:00:00.000'',''2007-11-21 00:00:00.000'',''2007-11-22 00:00:00.000'',''2007-11-23 00:00:00.000'',''2007-11-24 00:00:00.000'',''2007-11-25 00:00:00.000'',''2007-11-26 00:00:00.000'',''2007-11-27 00:00:00.000'',''2007-11-28 00:00:00.000'',''2007-11-29 00:00:00.000'',''2007-11-30 00:00:00.000'',''2007-12-01 00:00:00.000'',''2008-11-02 00:00:00.000'',''2008-11-03 00:00:00.000'',''2008-11-04 00:00:00.000'',''2008-11-05 00:00:00.000'',''2008-11-06 00:00:00.000'',''2008-11-07 00:00:00.000'',''2008-11-08 00:00:00.000'',''2008-11-09 00:00:00.000'',''2008-11-10 00:00:00.000'',''2008-11-11 00:00:00.000'',''2008-11-12 00:00:00.000'',''2008-11-13 00:00:00.000'',''2008-11-14 00:00:00.000'',''2008-11-15 00:00:00.000'',''2008-11-16 00:00:00.000'',''2008-11-17 00:00:00.000'',''2008-11-18 00:00:00.000'',''2008-11-19 00:00:00.000'',''2008-11-20 00:00:00.000'',''2008-11-21 00:00:00.000'',''2008-11-22 00:00:00.000'',''2008-11-23 00:00:00.000'',''2008-11-24 00:00:00.000'',''2008-11-25 00:00:00.000'',''2008-11-26 00:00:00.000'',''2008-11-27 00:00:00.000'',''2008-11-28 00:00:00.000'',''2008-11-29 00:00:00.000'',''2008-11-30 00:00:00.000'',''2008-12-01 00:00:00.000'',''2008-12-02 00:00:00.000'',''2008-12-03 00:00:00.000'',''2008-12-04 00:00:00.000'',''2008-12-05 00:00:00.000'',''2008-12-06 00:00:00.000'',''2008-12-07 00:00:00.000'',''2008-12-08 00:00:00.000'',''2008-12-09 00:00:00.000'',''2008-12-10 00:00:00.000'',''2008-12-11 00:00:00.000'',''2008-12-12 00:00:00.000'',''2008-12-13 00:00:00.000'',''2008-12-14 00:00:00.000'',''2008-12-15 00:00:00.000'',''2008-12-16 00:00:00.000'',''2008-12-17 00:00:00.000'',''2008-12-18 00:00:00.000'',''2008-12-19 00:00:00.000'',''2008-12-20 00:00:00.000'',''2008-12-21 00:00:00.000'',''2008-12-22 00:00:00.000'',''2008-12-23 00:00:00.000'',''2008-12-24 00:00:00.000'',''2008-12-25 00:00:00.000'',''2008-12-26 00:00:00.000'',''2008-12-27 00:00:00.000'',''2008-12-28 00:00:00.000'',''2008-12-29 00:00:00.000'',''2008-12-30 00:00:00.000'',''2008-12-31 00:00:00.000'',''2009-01-01 00:00:00.000'',''2009-01-02 00:00:00.000'',''2009-01-03 00:00:00.000'',''2009-01-04 00:00:00.000'',''2009-01-05 00:00:00.000'',''2009-01-06 00:00:00.000'',''2009-01-07 00:00:00.000'',''2009-01-08 00:00:00.000'',''2009-01-09 00:00:00.000'',''2009-01-10 00:00:00.000'',''2009-01-11 00:00:00.000'',''2009-01-12 00:00:00.000'',''2009-01-13 00:00:00.000'',''2009-01-14 00:00:00.000'',''2009-01-15 00:00:00.000'',''2009-01-16 00:00:00.000'',''2009-01-17 00:00:00.000'',''2009-01-18 00:00:00.000'',''2009-01-19 00:00:00.000'',''2009-01-20 00:00:00.000'',''2009-01-21 00:00:00.000'',''2009-01-22 00:00:00.000'',''2009-01-23 00:00:00.000'',''2009-01-24 00:00:00.000'',''2009-01-25 00:00:00.000'',''2009-01-26 00:00:00.000'',''2009-01-27 00:00:00.000'',''2009-01-28 00:00:00.000'',''2009-01-29 00:00:00.000'',''2009-01-30 00:00:00.000'',''2009-01-31 00:00:00.000'',''2009-02-01 00:00:00.000'',''2009-02-02 00:00:00.000'',''2009-02-03 00:00:00.000'',''2009-02-04 00:00:00.000'',''2009-02-05 00:00:00.000'',''2009-02-06 00:00:00.000'',''2009-02-07 00:00:00.000'',''2009-02-08 00:00:00.000'',''2009-02-09 00:00:00.000'',''2009-02-10 00:00:00.000'',''2009-02-11 00:00:00.000'',''2009-02-12 00:00:00.000'',''2009-02-13 00:00:00.000'',''2009-02-14 00:00:00.000'',''2009-02-15 00:00:00.000'',''2009-02-16 00:00:00.000'',''2009-02-17 00:00:00.000'',''2009-02-18 00:00:00.000'',''2009-02-19 00:00:00.000'',''2009-02-20 00:00:00.000'',''2009-02-21 00:00:00.000'',''2009-02-22 00:00:00.000'',''2009-02-23 00:00:00.000'',''2009-02-24 00:00:00.000'',''2009-02-25 00:00:00.000'',''2009-02-26 00:00:00.000'',''2009-02-27 00:00:00.000'',''2009-02-28 00:00:00.000'',''2009-03-01 00:00:00.000'',''2009-03-02 00:00:00.000'',''2009-03-03 00:00:00.000'',''2009-03-04 00:00:00.000'',''2009-03-05 00:00:00.000'',''2009-03-06 00:00:00.000'',''2009-03-07 00:00:00.000'',''2009-03-08 00:00:00.000'',''2009-03-09 00:00:00.000'',''2009-03-10 00:00:00.000'',''2009-03-11 00:00:00.000'',''2009-03-12 00:00:00.000'',''2009-03-13 00:00:00.000'',''2009-03-14 00:00:00.000'',''2009-03-15 00:00:00.000'',''2009-03-16 00:00:00.000'',''2009-03-17 00:00:00.000'',''2009-03-18 00:00:00.000'',''2009-03-19 00:00:00.000'',''2009-03-20 00:00:00.000'',''2009-03-21 00:00:00.000'',''2009-03-22 00:00:00.000'',''2009-03-23 00:00:00.000'',''2009-03-24 00:00:00.000'',''2009-03-25 00:00:00.000'',''2009-03-26 00:00:00.000'',''2009-03-27 00:00:00.000'',''2009-03-28 00:00:00.000'',''2009-03-29 00:00:00.000'',''2009-03-30 00:00:00.000'',''2009-03-31 00:00:00.000'',''2009-04-01 00:00:00.000'',''2009-04-02 00:00:00.000'',''2009-04-03 00:00:00.000'',''2009-04-04 00:00:00.000'',''2009-04-05 00:00:00.000'',''2009-04-06 00:00:00.000'',''2009-04-07 00:00:00.000'',''2009-04-08 00:00:00.000'',''2009-04-09 00:00:00.000'',''2009-04-10 00:00:00.000'',''2009-04-11 00:00:00.000'',''2009-04-12 00:00:00.000'',''2009-04-13 00:00:00.000'',''2009-04-14 00:00:00.000'',''2009-04-15 00:00:00.000'',''2009-04-16 00:00:00.000'',''2009-04-17 00:00:00.000'',''2009-04-18 00:00:00.000'',''2009-04-19 00:00:00.000'',''2009-04-20 00:00:00.000'',''2009-04-21 00:00:00.000'',''2009-04-22 00:00:00.000'',''2009-04-23 00:00:00.000'',''2009-04-24 00:00:00.000'',''2009-04-25 00:00:00.000'',''2009-04-26 00:00:00.000'',''2009-04-27 00:00:00.000'',''2009-04-28 00:00:00.000'',''2009-04-29 00:00:00.000'',''2009-04-30 00:00:00.000'',''2009-05-01 00:00:00.000'',''2009-05-02 00:00:00.000'',''2009-05-03 00:00:00.000'',''2009-05-04 00:00:00.000'',''2009-05-05 00:00:00.000'',''2009-05-06 00:00:00.000'',''2009-05-07 00:00:00.000'',''2009-05-08 00:00:00.000'',''2009-05-09 00:00:00.000'',''2009-05-10 00:00:00.000'',''2009-05-11 00:00:00.000'',''2009-05-12 00:00:00.000'',''2009-05-13 00:00:00.000'',''2009-05-14 00:00:00.000'',''2009-05-15 00:00:00.000'',''2009-05-16 00:00:00.000'',''2009-05-17 00:00:00.000'',''2009-05-18 00:00:00.000'',''2009-05-19 00:00:00.000'',''2009-05-20 00:00:00.000'',''2009-05-21 00:00:00.000'',''2009-05-22 00:00:00.000'',''2009-05-23 00:00:00.000'',''2009-05-24 00:00:00.000'',''2009-05-25 00:00:00.000'',''2009-05-26 00:00:00.000'',''2009-05-27 00:00:00.000'',''2009-05-28 00:00:00.000'',''2009-05-29 00:00:00.000'',''2009-05-30 00:00:00.000'',''2009-05-31 00:00:00.000'',''2009-06-01 00:00:00.000'',''2009-06-02 00:00:00.000'',''2009-06-03 00:00:00.000'',''2009-06-04 00:00:00.000'',''2009-06-05 00:00:00.000'',''2009-06-06 00:00:00.000'',''2009-06-07 00:00:00.000'',''2009-06-08 00:00:00.000'',''2009-06-09 00:00:00.000'',''2009-06-10 00:00:00.000'',''2009-06-11 00:00:00.000'',''2009-06-12 00:00:00.000'',''2009-06-13 00:00:00.000'',''2009-06-14 00:00:00.000'',''2009-06-15 00:00:00.000'',''2009-06-16 00:00:00.000'',''2009-06-17 00:00:00.000'',''2009-06-18 00:00:00.000'',''2009-06-19 00:00:00.000'',''2009-06-20 00:00:00.000'',''2009-06-21 00:00:00.000'',''2009-06-22 00:00:00.000'',''2009-06-23 00:00:00.000'',''2009-06-24 00:00:00.000'',''2009-06-25 00:00:00.000'',''2009-06-26 00:00:00.000'',''2009-06-27 00:00:00.000'',''2009-06-28 00:00:00.000'',''2009-06-29 00:00:00.000'',''2009-06-30 00:00:00.000'',''2009-07-01 00:00:00.000'',''2009-07-02 00:00:00.000'',''2009-07-03 00:00:00.000'',''2009-07-04 00:00:00.000'',''2009-07-05 00:00:00.000'',''2009-07-06 00:00:00.000'',''2009-07-07 00:00:00.000'',''2009-07-08 00:00:00.000'',''2009-07-09 00:00:00.000'',''2009-07-10 00:00:00.000'',''2009-07-11 00:00:00.000'',''2009-07-12 00:00:00.000'',''2009-07-13 00:00:00.000'',''2009-07-14 00:00:00.000'',''2009-07-15 00:00:00.000'',''2009-07-16 00:00:00.000'',''2009-07-17 00:00:00.000'',''2009-07-18 00:00:00.000'',''2009-07-19 00:00:00.000'',''2009-07-20 00:00:00.000'',''2009-07-21 00:00:00.000'',''2009-07-22 00:00:00.000'',''2009-07-23 00:00:00.000'',''2009-07-24 00:00:00.000'',''2009-07-25 00:00:00.000'',''2009-07-26 00:00:00.000'',''2009-07-27 00:00:00.000'',''2009-07-28 00:00:00.000'',''2009-07-29 00:00:00.000'',''2009-07-30 00:00:00.000'',''2009-07-31 00:00:00.000'',''2009-08-01 00:00:00.000'',''2009-08-02 00:00:00.000'',''2009-08-03 00:00:00.000'',''2009-08-04 00:00:00.000'',''2009-08-05 00:00:00.000'',''2009-08-06 00:00:00.000'',''2009-08-07 00:00:00.000'',''2009-08-08 00:00:00.000'',''2009-08-09 00:00:00.000'',''2009-08-10 00:00:00.000'',''2009-08-11 00:00:00.000'',''2009-08-12 00:00:00.000'',''2009-08-13 00:00:00.000'',''2009-08-14 00:00:00.000'',''2009-08-15 00:00:00.000'',''2009-08-16 00:00:00.000'',''2009-08-17 00:00:00.000'',''2009-08-18 00:00:00.000'',''2009-08-19 00:00:00.000'',''2009-08-20 00:00:00.000'',''2009-08-21 00:00:00.000'',''2009-08-22 00:00:00.000'',''2009-08-23 00:00:00.000'',''2009-08-24 00:00:00.000'',''2009-08-25 00:00:00.000'',''2009-08-26 00:00:00.000'',''2009-08-27 00:00:00.000'',''2009-08-28 00:00:00.000'',''2009-08-29 00:00:00.000'',''2009-08-30 00:00:00.000'',''2009-08-31 00:00:00.000'',''2009-09-01 00:00:00.000'',''2009-09-02 00:00:00.000'',''2009-09-03 00:00:00.000'',''2009-09-04 00:00:00.000'',''2009-09-05 00:00:00.000'',''2009-09-06 00:00:00.000'',''2009-09-07 00:00:00.000'',''2009-09-08 00:00:00.000'',''2009-09-09 00:00:00.000'',''2009-09-10 00:00:00.000'',''2009-09-11 00:00:00.000'',''2009-09-12 00:00:00.000'',''2009-09-13 00:00:00.000'',''2009-09-14 00:00:00.000'',''2009-09-15 00:00:00.000'',''2009-09-16 00:00:00.000'',''2009-09-17 00:00:00.000'',''2009-09-18 00:00:00.000'',''2009-09-19 00:00:00.000'',''2009-09-20 00:00:00.000'',''2009-09-21 00:00:00.000'',''2009-09-22 00:00:00.000'',''2009-09-23 00:00:00.000'',''2009-09-24 00:00:00.000'',''2009-09-25 00:00:00.000'',''2009-09-26 00:00:00.000'',''2009-09-27 00:00:00.000'',''2009-09-28 00:00:00.000'',''2009-09-29 00:00:00.000'',''2009-09-30 00:00:00.000'',''2009-10-01 00:00:00.000'',''2009-10-02 00:00:00.000'',''2009-10-03 00:00:00.000'',''2009-10-04 00:00:00.000'',''2009-10-05 00:00:00.000'',''2009-10-06 00:00:00.000'',''2009-10-07 00:00:00.000'',''2009-10-08 00:00:00.000'',''2009-10-09 00:00:00.000'',''2009-10-10 00:00:00.000'',''2009-10-11 00:00:00.000'',''2009-10-12 00:00:00.000'',''2009-10-13 00:00:00.000'',''2009-10-14 00:00:00.000'',''2009-10-15 00:00:00.000'',''2009-10-16 00:00:00.000'',''2009-10-17 00:00:00.000'',''2009-10-18 00:00:00.000'',''2009-10-19 00:00:00.000'',''2009-10-20 00:00:00.000'',''2009-10-21 00:00:00.000'',''2009-10-22 00:00:00.000'',''2009-10-23 00:00:00.000'',''2009-10-24 00:00:00.000'',''2009-10-25 00:00:00.000'',''2009-10-26 00:00:00.000'',''2009-10-27 00:00:00.000'',''2009-10-28 00:00:00.000'',''2009-10-29 00:00:00.000'',''2009-10-30 00:00:00.000'',''2009-10-31 00:00:00.000'',''2009-11-01 00:00:00.000'',''2009-11-02 00:00:00.000'',''2009-11-03 00:00:00.000'',''2009-11-04 00:00:00.000'',''2009-11-05 00:00:00.000'',''2009-11-06 00:00:00.000'',''2009-11-07 00:00:00.000'',''2009-11-08 00:00:00.000'',''2009-11-09 00:00:00.000'',''2009-11-10 00:00:00.000'',''2009-11-11 00:00:00.000'',''2009-11-12 00:00:00.000'',''2009-11-13 00:00:00.000'',''2009-11-14 00:00:00.000'',''2009-11-15 00:00:00.000'',''2009-11-16 00:00:00.000'',''2009-11-17 00:00:00.000'',''2009-11-18 00:00:00.000'',''2009-11-19 00:00:00.000'',''2009-11-20 00:00:00.000'',''2009-11-21 00:00:00.000'',''2009-11-22 00:00:00.000'',''2009-11-23 00:00:00.000'',''2009-11-24 00:00:00.000'',''2009-11-25 00:00:00.000'',''2009-11-26 00:00:00.000'',''2009-11-27 00:00:00.000'',''2009-11-28 00:00:00.000'',''2009-11-29 00:00:00.000'',''2009-11-30 00:00:00.000'',''2009-12-01 00:00:00.000'',''2009-12-02 00:00:00.000'',''2009-12-03 00:00:00.000'',''2009-12-04 00:00:00.000'',''2009-12-05 00:00:00.000'',''2009-12-06 00:00:00.000'',''2009-12-07 00:00:00.000'',''2009-12-08 00:00:00.000'',''2009-12-09 00:00:00.000'',''2009-12-10 00:00:00.000'',''2009-12-11 00:00:00.000'',''2009-12-12 00:00:00.000'',''2009-12-13 00:00:00.000'',''2009-12-14 00:00:00.000'',''2009-12-15 00:00:00.000'',''2009-12-16 00:00:00.000'',''2009-12-17 00:00:00.000'',''2009-12-18 00:00:00.000'',''2009-12-19 00:00:00.000'',''2009-12-20 00:00:00.000'',''2009-12-21 00:00:00.000'',''2009-12-22 00:00:00.000'',''2009-12-23 00:00:00.000'',''2009-12-24 00:00:00.000'',''2009-12-25 00:00:00.000'',''2009-12-26 00:00:00.000'',''2009-12-27 00:00:00.000'',''2009-12-28 00:00:00.000'',''2009-12-29 00:00:00.000'',''2009-12-30 00:00:00.000'')">
                                            <Intrinsic FunctionName="RangePartitionNew">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="@parm1" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="(1)" />
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="''2007-06-30 00:00:00.000''" />
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </StartRange>
                                      <EndRange ScanType="LE">
                                        <RangeColumns>
                                          <ColumnReference Column="PtnId1000" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="RangePartitionNew([@first],(1),''2007-06-30 00:00:00.000'',''2007-01-03 00:00:00.000'',''2007-01-04 00:00:00.000'',''2007-01-05 00:00:00.000'',''2007-01-06 00:00:00.000'',''2007-01-07 00:00:00.000'',''2007-01-08 00:00:00.000'',''2007-01-09 00:00:00.000'',''2007-01-10 00:00:00.000'',''2007-01-11 00:00:00.000'',''2007-01-12 00:00:00.000'',''2007-01-13 00:00:00.000'',''2007-01-14 00:00:00.000'',''2007-01-15 00:00:00.000'',''2007-01-16 00:00:00.000'',''2007-01-17 00:00:00.000'',''2007-01-18 00:00:00.000'',''2007-01-19 00:00:00.000'',''2007-01-20 00:00:00.000'',''2007-01-21 00:00:00.000'',''2007-01-22 00:00:00.000'',''2007-01-23 00:00:00.000'',''2007-01-24 00:00:00.000'',''2007-01-25 00:00:00.000'',''2007-01-26 00:00:00.000'',''2007-01-27 00:00:00.000'',''2007-01-28 00:00:00.000'',''2007-01-29 00:00:00.000'',''2007-01-30 00:00:00.000'',''2007-01-31 00:00:00.000'',''2007-02-01 00:00:00.000'',''2007-02-02 00:00:00.000'',''2007-02-03 00:00:00.000'',''2007-02-04 00:00:00.000'',''2007-02-05 00:00:00.000'',''2007-02-06 00:00:00.000'',''2007-02-07 00:00:00.000'',''2007-02-08 00:00:00.000'',''2007-02-09 00:00:00.000'',''2007-02-10 00:00:00.000'',''2007-02-11 00:00:00.000'',''2007-02-12 00:00:00.000'',''2007-02-13 00:00:00.000'',''2007-02-14 00:00:00.000'',''2007-02-15 00:00:00.000'',''2007-02-16 00:00:00.000'',''2007-02-17 00:00:00.000'',''2007-02-18 00:00:00.000'',''2007-02-19 00:00:00.000'',''2007-02-20 00:00:00.000'',''2007-02-21 00:00:00.000'',''2007-02-22 00:00:00.000'',''2007-02-23 00:00:00.000'',''2007-02-24 00:00:00.000'',''2007-02-25 00:00:00.000'',''2007-02-26 00:00:00.000'',''2007-02-27 00:00:00.000'',''2007-02-28 00:00:00.000'',''2007-03-01 00:00:00.000'',''2007-03-02 00:00:00.000'',''2007-03-03 00:00:00.000'',''2007-03-04 00:00:00.000'',''2007-03-05 00:00:00.000'',''2007-03-06 00:00:00.000'',''2007-03-07 00:00:00.000'',''2007-03-08 00:00:00.000'',''2007-03-09 00:00:00.000'',''2007-03-10 00:00:00.000'',''2007-03-11 00:00:00.000'',''2007-03-12 00:00:00.000'',''2007-03-13 00:00:00.000'',''2007-03-14 00:00:00.000'',''2007-03-15 00:00:00.000'',''2007-03-16 00:00:00.000'',''2007-03-17 00:00:00.000'',''2007-03-18 00:00:00.000'',''2007-03-19 00:00:00.000'',''2007-03-20 00:00:00.000'',''2007-03-21 00:00:00.000'',''2007-03-22 00:00:00.000'',''2007-03-23 00:00:00.000'',''2007-03-24 00:00:00.000'',''2007-03-25 00:00:00.000'',''2007-03-26 00:00:00.000'',''2007-03-27 00:00:00.000'',''2007-03-28 00:00:00.000'',''2007-03-29 00:00:00.000'',''2007-03-30 00:00:00.000'',''2007-03-31 00:00:00.000'',''2007-04-01 00:00:00.000'',''2007-04-02 00:00:00.000'',''2007-04-03 00:00:00.000'',''2007-04-04 00:00:00.000'',''2007-04-05 00:00:00.000'',''2007-04-06 00:00:00.000'',''2007-04-07 00:00:00.000'',''2007-04-08 00:00:00.000'',''2007-04-09 00:00:00.000'',''2007-04-10 00:00:00.000'',''2007-04-11 00:00:00.000'',''2007-04-12 00:00:00.000'',''2007-04-13 00:00:00.000'',''2007-04-14 00:00:00.000'',''2007-04-15 00:00:00.000'',''2007-04-16 00:00:00.000'',''2007-04-17 00:00:00.000'',''2007-04-18 00:00:00.000'',''2007-04-19 00:00:00.000'',''2007-04-20 00:00:00.000'',''2007-04-21 00:00:00.000'',''2007-04-22 00:00:00.000'',''2007-04-23 00:00:00.000'',''2007-04-24 00:00:00.000'',''2007-04-25 00:00:00.000'',''2007-04-26 00:00:00.000'',''2007-04-27 00:00:00.000'',''2007-04-28 00:00:00.000'',''2007-04-29 00:00:00.000'',''2007-04-30 00:00:00.000'',''2007-05-01 00:00:00.000'',''2007-05-02 00:00:00.000'',''2007-05-03 00:00:00.000'',''2007-05-04 00:00:00.000'',''2007-05-05 00:00:00.000'',''2007-05-06 00:00:00.000'',''2007-05-07 00:00:00.000'',''2007-05-08 00:00:00.000'',''2007-05-09 00:00:00.000'',''2007-05-10 00:00:00.000'',''2007-05-11 00:00:00.000'',''2007-05-12 00:00:00.000'',''2007-05-13 00:00:00.000'',''2007-05-14 00:00:00.000'',''2007-05-15 00:00:00.000'',''2007-05-16 00:00:00.000'',''2007-05-17 00:00:00.000'',''2007-05-18 00:00:00.000'',''2007-05-19 00:00:00.000'',''2007-05-20 00:00:00.000'',''2007-05-21 00:00:00.000'',''2007-05-22 00:00:00.000'',''2007-05-23 00:00:00.000'',''2007-05-24 00:00:00.000'',''2007-05-25 00:00:00.000'',''2007-05-26 00:00:00.000'',''2007-05-27 00:00:00.000'',''2007-05-28 00:00:00.000'',''2007-05-29 00:00:00.000'',''2007-05-30 00:00:00.000'',''2007-05-31 00:00:00.000'',''2007-06-01 00:00:00.000'',''2007-06-02 00:00:00.000'',''2007-06-03 00:00:00.000'',''2007-06-04 00:00:00.000'',''2007-06-05 00:00:00.000'',''2007-06-06 00:00:00.000'',''2007-06-07 00:00:00.000'',''2007-06-08 00:00:00.000'',''2007-06-09 00:00:00.000'',''2007-06-10 00:00:00.000'',''2007-06-11 00:00:00.000'',''2007-06-12 00:00:00.000'',''2007-06-13 00:00:00.000'',''2007-06-14 00:00:00.000'',''2007-06-15 00:00:00.000'',''2007-06-16 00:00:00.000'',''2007-06-17 00:00:00.000'',''2007-06-18 00:00:00.000'',''2007-06-19 00:00:00.000'',''2007-06-20 00:00:00.000'',''2007-06-21 00:00:00.000'',''2007-06-22 00:00:00.000'',''2007-06-23 00:00:00.000'',''2007-06-24 00:00:00.000'',''2007-06-25 00:00:00.000'',''2007-06-26 00:00:00.000'',''2007-06-27 00:00:00.000'',''2007-06-28 00:00:00.000'',''2007-06-29 00:00:00.000'',''2007-06-30 00:00:00.000'',''2007-07-01 00:00:00.000'',''2007-07-02 00:00:00.000'',''2007-07-03 00:00:00.000'',''2007-07-04 00:00:00.000'',''2007-07-05 00:00:00.000'',''2007-07-06 00:00:00.000'',''2007-07-07 00:00:00.000'',''2007-07-08 00:00:00.000'',''2007-07-09 00:00:00.000'',''2007-07-10 00:00:00.000'',''2007-07-11 00:00:00.000'',''2007-07-12 00:00:00.000'',''2007-07-13 00:00:00.000'',''2007-07-14 00:00:00.000'',''2007-07-15 00:00:00.000'',''2007-07-16 00:00:00.000'',''2007-07-17 00:00:00.000'',''2007-07-18 00:00:00.000'',''2007-07-19 00:00:00.000'',''2007-07-20 00:00:00.000'',''2007-07-21 00:00:00.000'',''2007-07-22 00:00:00.000'',''2007-07-23 00:00:00.000'',''2007-07-24 00:00:00.000'',''2007-07-25 00:00:00.000'',''2007-07-26 00:00:00.000'',''2007-07-27 00:00:00.000'',''2007-07-28 00:00:00.000'',''2007-07-29 00:00:00.000'',''2007-07-30 00:00:00.000'',''2007-07-31 00:00:00.000'',''2007-08-01 00:00:00.000'',''2007-08-02 00:00:00.000'',''2007-08-03 00:00:00.000'',''2007-08-04 00:00:00.000'',''2007-08-05 00:00:00.000'',''2007-08-06 00:00:00.000'',''2007-08-07 00:00:00.000'',''2007-08-08 00:00:00.000'',''2007-08-09 00:00:00.000'',''2007-08-10 00:00:00.000'',''2007-08-11 00:00:00.000'',''2007-08-12 00:00:00.000'',''2007-08-13 00:00:00.000'',''2007-08-14 00:00:00.000'',''2007-08-15 00:00:00.000'',''2007-08-16 00:00:00.000'',''2007-08-17 00:00:00.000'',''2007-08-18 00:00:00.000'',''2007-08-19 00:00:00.000'',''2007-08-20 00:00:00.000'',''2007-08-21 00:00:00.000'',''2007-08-22 00:00:00.000'',''2007-08-23 00:00:00.000'',''2007-08-24 00:00:00.000'',''2007-08-25 00:00:00.000'',''2007-08-26 00:00:00.000'',''2007-08-27 00:00:00.000'',''2007-08-28 00:00:00.000'',''2007-08-29 00:00:00.000'',''2007-08-30 00:00:00.000'',''2007-08-31 00:00:00.000'',''2007-09-01 00:00:00.000'',''2007-09-02 00:00:00.000'',''2007-09-03 00:00:00.000'',''2007-09-04 00:00:00.000'',''2007-09-05 00:00:00.000'',''2007-09-06 00:00:00.000'',''2007-09-07 00:00:00.000'',''2007-09-08 00:00:00.000'',''2007-09-09 00:00:00.000'',''2007-09-10 00:00:00.000'',''2007-09-11 00:00:00.000'',''2007-09-12 00:00:00.000'',''2007-09-13 00:00:00.000'',''2007-09-14 00:00:00.000'',''2007-09-15 00:00:00.000'',''2007-09-16 00:00:00.000'',''2007-09-17 00:00:00.000'',''2007-09-18 00:00:00.000'',''2007-09-19 00:00:00.000'',''2007-09-20 00:00:00.000'',''2007-09-21 00:00:00.000'',''2007-09-22 00:00:00.000'',''2007-09-23 00:00:00.000'',''2007-09-24 00:00:00.000'',''2007-09-25 00:00:00.000'',''2007-09-26 00:00:00.000'',''2007-09-27 00:00:00.000'',''2007-09-28 00:00:00.000'',''2007-09-29 00:00:00.000'',''2007-09-30 00:00:00.000'',''2007-10-01 00:00:00.000'',''2007-10-02 00:00:00.000'',''2007-10-03 00:00:00.000'',''2007-10-04 00:00:00.000'',''2007-10-05 00:00:00.000'',''2007-10-06 00:00:00.000'',''2007-10-07 00:00:00.000'',''2007-10-08 00:00:00.000'',''2007-10-09 00:00:00.000'',''2007-10-10 00:00:00.000'',''2007-10-11 00:00:00.000'',''2007-10-12 00:00:00.000'',''2007-10-13 00:00:00.000'',''2007-10-14 00:00:00.000'',''2007-10-15 00:00:00.000'',''2007-10-16 00:00:00.000'',''2007-10-17 00:00:00.000'',''2007-10-18 00:00:00.000'',''2007-10-19 00:00:00.000'',''2007-10-20 00:00:00.000'',''2007-10-21 00:00:00.000'',''2007-10-22 00:00:00.000'',''2007-10-23 00:00:00.000'',''2007-10-24 00:00:00.000'',''2007-10-25 00:00:00.000'',''2007-10-26 00:00:00.000'',''2007-10-27 00:00:00.000'',''2007-10-28 00:00:00.000'',''2007-10-29 00:00:00.000'',''2007-10-30 00:00:00.000'',''2007-10-31 00:00:00.000'',''2007-11-01 00:00:00.000'',''2007-11-02 00:00:00.000'',''2007-11-03 00:00:00.000'',''2007-11-04 00:00:00.000'',''2007-11-05 00:00:00.000'',''2007-11-06 00:00:00.000'',''2007-11-07 00:00:00.000'',''2007-11-08 00:00:00.000'',''2007-11-09 00:00:00.000'',''2007-11-10 00:00:00.000'',''2007-11-11 00:00:00.000'',''2007-11-12 00:00:00.000'',''2007-11-13 00:00:00.000'',''2007-11-14 00:00:00.000'',''2007-11-15 00:00:00.000'',''2007-11-16 00:00:00.000'',''2007-11-17 00:00:00.000'',''2007-11-18 00:00:00.000'',''2007-11-19 00:00:00.000'',''2007-11-20 00:00:00.000'',''2007-11-21 00:00:00.000'',''2007-11-22 00:00:00.000'',''2007-11-23 00:00:00.000'',''2007-11-24 00:00:00.000'',''2007-11-25 00:00:00.000'',''2007-11-26 00:00:00.000'',''2007-11-27 00:00:00.000'',''2007-11-28 00:00:00.000'',''2007-11-29 00:00:00.000'',''2007-11-30 00:00:00.000'',''2007-12-01 00:00:00.000'',''2008-11-02 00:00:00.000'',''2008-11-03 00:00:00.000'',''2008-11-04 00:00:00.000'',''2008-11-05 00:00:00.000'',''2008-11-06 00:00:00.000'',''2008-11-07 00:00:00.000'',''2008-11-08 00:00:00.000'',''2008-11-09 00:00:00.000'',''2008-11-10 00:00:00.000'',''2008-11-11 00:00:00.000'',''2008-11-12 00:00:00.000'',''2008-11-13 00:00:00.000'',''2008-11-14 00:00:00.000'',''2008-11-15 00:00:00.000'',''2008-11-16 00:00:00.000'',''2008-11-17 00:00:00.000'',''2008-11-18 00:00:00.000'',''2008-11-19 00:00:00.000'',''2008-11-20 00:00:00.000'',''2008-11-21 00:00:00.000'',''2008-11-22 00:00:00.000'',''2008-11-23 00:00:00.000'',''2008-11-24 00:00:00.000'',''2008-11-25 00:00:00.000'',''2008-11-26 00:00:00.000'',''2008-11-27 00:00:00.000'',''2008-11-28 00:00:00.000'',''2008-11-29 00:00:00.000'',''2008-11-30 00:00:00.000'',''2008-12-01 00:00:00.000'',''2008-12-02 00:00:00.000'',''2008-12-03 00:00:00.000'',''2008-12-04 00:00:00.000'',''2008-12-05 00:00:00.000'',''2008-12-06 00:00:00.000'',''2008-12-07 00:00:00.000'',''2008-12-08 00:00:00.000'',''2008-12-09 00:00:00.000'',''2008-12-10 00:00:00.000'',''2008-12-11 00:00:00.000'',''2008-12-12 00:00:00.000'',''2008-12-13 00:00:00.000'',''2008-12-14 00:00:00.000'',''2008-12-15 00:00:00.000'',''2008-12-16 00:00:00.000'',''2008-12-17 00:00:00.000'',''2008-12-18 00:00:00.000'',''2008-12-19 00:00:00.000'',''2008-12-20 00:00:00.000'',''2008-12-21 00:00:00.000'',''2008-12-22 00:00:00.000'',''2008-12-23 00:00:00.000'',''2008-12-24 00:00:00.000'',''2008-12-25 00:00:00.000'',''2008-12-26 00:00:00.000'',''2008-12-27 00:00:00.000'',''2008-12-28 00:00:00.000'',''2008-12-29 00:00:00.000'',''2008-12-30 00:00:00.000'',''2008-12-31 00:00:00.000'',''2009-01-01 00:00:00.000'',''2009-01-02 00:00:00.000'',''2009-01-03 00:00:00.000'',''2009-01-04 00:00:00.000'',''2009-01-05 00:00:00.000'',''2009-01-06 00:00:00.000'',''2009-01-07 00:00:00.000'',''2009-01-08 00:00:00.000'',''2009-01-09 00:00:00.000'',''2009-01-10 00:00:00.000'',''2009-01-11 00:00:00.000'',''2009-01-12 00:00:00.000'',''2009-01-13 00:00:00.000'',''2009-01-14 00:00:00.000'',''2009-01-15 00:00:00.000'',''2009-01-16 00:00:00.000'',''2009-01-17 00:00:00.000'',''2009-01-18 00:00:00.000'',''2009-01-19 00:00:00.000'',''2009-01-20 00:00:00.000'',''2009-01-21 00:00:00.000'',''2009-01-22 00:00:00.000'',''2009-01-23 00:00:00.000'',''2009-01-24 00:00:00.000'',''2009-01-25 00:00:00.000'',''2009-01-26 00:00:00.000'',''2009-01-27 00:00:00.000'',''2009-01-28 00:00:00.000'',''2009-01-29 00:00:00.000'',''2009-01-30 00:00:00.000'',''2009-01-31 00:00:00.000'',''2009-02-01 00:00:00.000'',''2009-02-02 00:00:00.000'',''2009-02-03 00:00:00.000'',''2009-02-04 00:00:00.000'',''2009-02-05 00:00:00.000'',''2009-02-06 00:00:00.000'',''2009-02-07 00:00:00.000'',''2009-02-08 00:00:00.000'',''2009-02-09 00:00:00.000'',''2009-02-10 00:00:00.000'',''2009-02-11 00:00:00.000'',''2009-02-12 00:00:00.000'',''2009-02-13 00:00:00.000'',''2009-02-14 00:00:00.000'',''2009-02-15 00:00:00.000'',''2009-02-16 00:00:00.000'',''2009-02-17 00:00:00.000'',''2009-02-18 00:00:00.000'',''2009-02-19 00:00:00.000'',''2009-02-20 00:00:00.000'',''2009-02-21 00:00:00.000'',''2009-02-22 00:00:00.000'',''2009-02-23 00:00:00.000'',''2009-02-24 00:00:00.000'',''2009-02-25 00:00:00.000'',''2009-02-26 00:00:00.000'',''2009-02-27 00:00:00.000'',''2009-02-28 00:00:00.000'',''2009-03-01 00:00:00.000'',''2009-03-02 00:00:00.000'',''2009-03-03 00:00:00.000'',''2009-03-04 00:00:00.000'',''2009-03-05 00:00:00.000'',''2009-03-06 00:00:00.000'',''2009-03-07 00:00:00.000'',''2009-03-08 00:00:00.000'',''2009-03-09 00:00:00.000'',''2009-03-10 00:00:00.000'',''2009-03-11 00:00:00.000'',''2009-03-12 00:00:00.000'',''2009-03-13 00:00:00.000'',''2009-03-14 00:00:00.000'',''2009-03-15 00:00:00.000'',''2009-03-16 00:00:00.000'',''2009-03-17 00:00:00.000'',''2009-03-18 00:00:00.000'',''2009-03-19 00:00:00.000'',''2009-03-20 00:00:00.000'',''2009-03-21 00:00:00.000'',''2009-03-22 00:00:00.000'',''2009-03-23 00:00:00.000'',''2009-03-24 00:00:00.000'',''2009-03-25 00:00:00.000'',''2009-03-26 00:00:00.000'',''2009-03-27 00:00:00.000'',''2009-03-28 00:00:00.000'',''2009-03-29 00:00:00.000'',''2009-03-30 00:00:00.000'',''2009-03-31 00:00:00.000'',''2009-04-01 00:00:00.000'',''2009-04-02 00:00:00.000'',''2009-04-03 00:00:00.000'',''2009-04-04 00:00:00.000'',''2009-04-05 00:00:00.000'',''2009-04-06 00:00:00.000'',''2009-04-07 00:00:00.000'',''2009-04-08 00:00:00.000'',''2009-04-09 00:00:00.000'',''2009-04-10 00:00:00.000'',''2009-04-11 00:00:00.000'',''2009-04-12 00:00:00.000'',''2009-04-13 00:00:00.000'',''2009-04-14 00:00:00.000'',''2009-04-15 00:00:00.000'',''2009-04-16 00:00:00.000'',''2009-04-17 00:00:00.000'',''2009-04-18 00:00:00.000'',''2009-04-19 00:00:00.000'',''2009-04-20 00:00:00.000'',''2009-04-21 00:00:00.000'',''2009-04-22 00:00:00.000'',''2009-04-23 00:00:00.000'',''2009-04-24 00:00:00.000'',''2009-04-25 00:00:00.000'',''2009-04-26 00:00:00.000'',''2009-04-27 00:00:00.000'',''2009-04-28 00:00:00.000'',''2009-04-29 00:00:00.000'',''2009-04-30 00:00:00.000'',''2009-05-01 00:00:00.000'',''2009-05-02 00:00:00.000'',''2009-05-03 00:00:00.000'',''2009-05-04 00:00:00.000'',''2009-05-05 00:00:00.000'',''2009-05-06 00:00:00.000'',''2009-05-07 00:00:00.000'',''2009-05-08 00:00:00.000'',''2009-05-09 00:00:00.000'',''2009-05-10 00:00:00.000'',''2009-05-11 00:00:00.000'',''2009-05-12 00:00:00.000'',''2009-05-13 00:00:00.000'',''2009-05-14 00:00:00.000'',''2009-05-15 00:00:00.000'',''2009-05-16 00:00:00.000'',''2009-05-17 00:00:00.000'',''2009-05-18 00:00:00.000'',''2009-05-19 00:00:00.000'',''2009-05-20 00:00:00.000'',''2009-05-21 00:00:00.000'',''2009-05-22 00:00:00.000'',''2009-05-23 00:00:00.000'',''2009-05-24 00:00:00.000'',''2009-05-25 00:00:00.000'',''2009-05-26 00:00:00.000'',''2009-05-27 00:00:00.000'',''2009-05-28 00:00:00.000'',''2009-05-29 00:00:00.000'',''2009-05-30 00:00:00.000'',''2009-05-31 00:00:00.000'',''2009-06-01 00:00:00.000'',''2009-06-02 00:00:00.000'',''2009-06-03 00:00:00.000'',''2009-06-04 00:00:00.000'',''2009-06-05 00:00:00.000'',''2009-06-06 00:00:00.000'',''2009-06-07 00:00:00.000'',''2009-06-08 00:00:00.000'',''2009-06-09 00:00:00.000'',''2009-06-10 00:00:00.000'',''2009-06-11 00:00:00.000'',''2009-06-12 00:00:00.000'',''2009-06-13 00:00:00.000'',''2009-06-14 00:00:00.000'',''2009-06-15 00:00:00.000'',''2009-06-16 00:00:00.000'',''2009-06-17 00:00:00.000'',''2009-06-18 00:00:00.000'',''2009-06-19 00:00:00.000'',''2009-06-20 00:00:00.000'',''2009-06-21 00:00:00.000'',''2009-06-22 00:00:00.000'',''2009-06-23 00:00:00.000'',''2009-06-24 00:00:00.000'',''2009-06-25 00:00:00.000'',''2009-06-26 00:00:00.000'',''2009-06-27 00:00:00.000'',''2009-06-28 00:00:00.000'',''2009-06-29 00:00:00.000'',''2009-06-30 00:00:00.000'',''2009-07-01 00:00:00.000'',''2009-07-02 00:00:00.000'',''2009-07-03 00:00:00.000'',''2009-07-04 00:00:00.000'',''2009-07-05 00:00:00.000'',''2009-07-06 00:00:00.000'',''2009-07-07 00:00:00.000'',''2009-07-08 00:00:00.000'',''2009-07-09 00:00:00.000'',''2009-07-10 00:00:00.000'',''2009-07-11 00:00:00.000'',''2009-07-12 00:00:00.000'',''2009-07-13 00:00:00.000'',''2009-07-14 00:00:00.000'',''2009-07-15 00:00:00.000'',''2009-07-16 00:00:00.000'',''2009-07-17 00:00:00.000'',''2009-07-18 00:00:00.000'',''2009-07-19 00:00:00.000'',''2009-07-20 00:00:00.000'',''2009-07-21 00:00:00.000'',''2009-07-22 00:00:00.000'',''2009-07-23 00:00:00.000'',''2009-07-24 00:00:00.000'',''2009-07-25 00:00:00.000'',''2009-07-26 00:00:00.000'',''2009-07-27 00:00:00.000'',''2009-07-28 00:00:00.000'',''2009-07-29 00:00:00.000'',''2009-07-30 00:00:00.000'',''2009-07-31 00:00:00.000'',''2009-08-01 00:00:00.000'',''2009-08-02 00:00:00.000'',''2009-08-03 00:00:00.000'',''2009-08-04 00:00:00.000'',''2009-08-05 00:00:00.000'',''2009-08-06 00:00:00.000'',''2009-08-07 00:00:00.000'',''2009-08-08 00:00:00.000'',''2009-08-09 00:00:00.000'',''2009-08-10 00:00:00.000'',''2009-08-11 00:00:00.000'',''2009-08-12 00:00:00.000'',''2009-08-13 00:00:00.000'',''2009-08-14 00:00:00.000'',''2009-08-15 00:00:00.000'',''2009-08-16 00:00:00.000'',''2009-08-17 00:00:00.000'',''2009-08-18 00:00:00.000'',''2009-08-19 00:00:00.000'',''2009-08-20 00:00:00.000'',''2009-08-21 00:00:00.000'',''2009-08-22 00:00:00.000'',''2009-08-23 00:00:00.000'',''2009-08-24 00:00:00.000'',''2009-08-25 00:00:00.000'',''2009-08-26 00:00:00.000'',''2009-08-27 00:00:00.000'',''2009-08-28 00:00:00.000'',''2009-08-29 00:00:00.000'',''2009-08-30 00:00:00.000'',''2009-08-31 00:00:00.000'',''2009-09-01 00:00:00.000'',''2009-09-02 00:00:00.000'',''2009-09-03 00:00:00.000'',''2009-09-04 00:00:00.000'',''2009-09-05 00:00:00.000'',''2009-09-06 00:00:00.000'',''2009-09-07 00:00:00.000'',''2009-09-08 00:00:00.000'',''2009-09-09 00:00:00.000'',''2009-09-10 00:00:00.000'',''2009-09-11 00:00:00.000'',''2009-09-12 00:00:00.000'',''2009-09-13 00:00:00.000'',''2009-09-14 00:00:00.000'',''2009-09-15 00:00:00.000'',''2009-09-16 00:00:00.000'',''2009-09-17 00:00:00.000'',''2009-09-18 00:00:00.000'',''2009-09-19 00:00:00.000'',''2009-09-20 00:00:00.000'',''2009-09-21 00:00:00.000'',''2009-09-22 00:00:00.000'',''2009-09-23 00:00:00.000'',''2009-09-24 00:00:00.000'',''2009-09-25 00:00:00.000'',''2009-09-26 00:00:00.000'',''2009-09-27 00:00:00.000'',''2009-09-28 00:00:00.000'',''2009-09-29 00:00:00.000'',''2009-09-30 00:00:00.000'',''2009-10-01 00:00:00.000'',''2009-10-02 00:00:00.000'',''2009-10-03 00:00:00.000'',''2009-10-04 00:00:00.000'',''2009-10-05 00:00:00.000'',''2009-10-06 00:00:00.000'',''2009-10-07 00:00:00.000'',''2009-10-08 00:00:00.000'',''2009-10-09 00:00:00.000'',''2009-10-10 00:00:00.000'',''2009-10-11 00:00:00.000'',''2009-10-12 00:00:00.000'',''2009-10-13 00:00:00.000'',''2009-10-14 00:00:00.000'',''2009-10-15 00:00:00.000'',''2009-10-16 00:00:00.000'',''2009-10-17 00:00:00.000'',''2009-10-18 00:00:00.000'',''2009-10-19 00:00:00.000'',''2009-10-20 00:00:00.000'',''2009-10-21 00:00:00.000'',''2009-10-22 00:00:00.000'',''2009-10-23 00:00:00.000'',''2009-10-24 00:00:00.000'',''2009-10-25 00:00:00.000'',''2009-10-26 00:00:00.000'',''2009-10-27 00:00:00.000'',''2009-10-28 00:00:00.000'',''2009-10-29 00:00:00.000'',''2009-10-30 00:00:00.000'',''2009-10-31 00:00:00.000'',''2009-11-01 00:00:00.000'',''2009-11-02 00:00:00.000'',''2009-11-03 00:00:00.000'',''2009-11-04 00:00:00.000'',''2009-11-05 00:00:00.000'',''2009-11-06 00:00:00.000'',''2009-11-07 00:00:00.000'',''2009-11-08 00:00:00.000'',''2009-11-09 00:00:00.000'',''2009-11-10 00:00:00.000'',''2009-11-11 00:00:00.000'',''2009-11-12 00:00:00.000'',''2009-11-13 00:00:00.000'',''2009-11-14 00:00:00.000'',''2009-11-15 00:00:00.000'',''2009-11-16 00:00:00.000'',''2009-11-17 00:00:00.000'',''2009-11-18 00:00:00.000'',''2009-11-19 00:00:00.000'',''2009-11-20 00:00:00.000'',''2009-11-21 00:00:00.000'',''2009-11-22 00:00:00.000'',''2009-11-23 00:00:00.000'',''2009-11-24 00:00:00.000'',''2009-11-25 00:00:00.000'',''2009-11-26 00:00:00.000'',''2009-11-27 00:00:00.000'',''2009-11-28 00:00:00.000'',''2009-11-29 00:00:00.000'',''2009-11-30 00:00:00.000'',''2009-12-01 00:00:00.000'',''2009-12-02 00:00:00.000'',''2009-12-03 00:00:00.000'',''2009-12-04 00:00:00.000'',''2009-12-05 00:00:00.000'',''2009-12-06 00:00:00.000'',''2009-12-07 00:00:00.000'',''2009-12-08 00:00:00.000'',''2009-12-09 00:00:00.000'',''2009-12-10 00:00:00.000'',''2009-12-11 00:00:00.000'',''2009-12-12 00:00:00.000'',''2009-12-13 00:00:00.000'',''2009-12-14 00:00:00.000'',''2009-12-15 00:00:00.000'',''2009-12-16 00:00:00.000'',''2009-12-17 00:00:00.000'',''2009-12-18 00:00:00.000'',''2009-12-19 00:00:00.000'',''2009-12-20 00:00:00.000'',''2009-12-21 00:00:00.000'',''2009-12-22 00:00:00.000'',''2009-12-23 00:00:00.000'',''2009-12-24 00:00:00.000'',''2009-12-25 00:00:00.000'',''2009-12-26 00:00:00.000'',''2009-12-27 00:00:00.000'',''2009-12-28 00:00:00.000'',''2009-12-29 00:00:00.000'',''2009-12-30 00:00:00.000'')">
                                            <Intrinsic FunctionName="RangePartitionNew">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="@first" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="(1)" />
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="''2007-06-30 00:00:00.000''" />
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </EndRange>
                                    </SeekKeys>
                                    <SeekKeys>
                                      <StartRange ScanType="GE">
                                        <RangeColumns>
                                          <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Alias="[fcto]" Column="DateKey" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="[@parm1]">
                                            <Identifier>
                                              <ColumnReference Column="@parm1" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </StartRange>
                                      <EndRange ScanType="LT">
                                        <RangeColumns>
                                          <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Alias="[fcto]" Column="DateKey" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="[@first]">
                                            <Identifier>
                                              <ColumnReference Column="@first" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </EndRange>
                                    </SeekKeys>
                                  </SeekPredicateNew>
                                </SeekPredicates>
                              </IndexScan>
                            </RelOp>
                          </Hash>
                        </RelOp>
                      </ComputeScalar>
                    </RelOp>
                  </Parallelism>
                </RelOp>
              </ComputeScalar>
            </RelOp>
            <ParameterList>
              <ColumnReference Column="@cot1" ParameterDataType="bigint" ParameterRuntimeValue="(11108)" />
              <ColumnReference Column="@first" ParameterDataType="datetime" ParameterRuntimeValue="''2007-07-01 00:00:00.000''" />
              <ColumnReference Column="@parm1" ParameterDataType="datetime" ParameterRuntimeValue="''2007-06-30 00:00:00.000''" />
            </ParameterList>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="14" StatementEstRows="1" StatementId="7" StatementOptmLevel="TRIVIAL" CardinalityEstimationModelVersion="150" StatementSubTreeCost="0.0033" StatementText="SELECT	@cot2 = SUM(stpro.rows)&#xD;&#xA;	FROM	#statistics stpro&#xD;&#xA;	WHERE	@first &lt; stpro.range_key&#xD;&#xA;	AND		stpro.range_key &lt; @last" StatementType="SELECT" QueryHash="0x2C989B394F2497C8" QueryPlanHash="0x36581CB70C748EDB" RetrievedFromCache="true" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="1" CachedPlanSize="24" CompileTime="1" CompileCPU="1" CompileMemory="128">
            <MemoryGrantInfo SerialRequiredMemory="0" SerialDesiredMemory="0" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="4288888" />
            <QueryTimeStats CpuTime="21" ElapsedTime="21" />
            <RelOp AvgRowSize="15" EstimateCPU="0" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="0" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="0.00655107">
              <OutputList>
                <ColumnReference Column="Expr1002" />
              </OutputList>
              <ComputeScalar>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1002" />
                    <ScalarOperator ScalarString="CASE WHEN [Expr1003]=(0) THEN NULL ELSE [Expr1004] END">
                      <IF>
                        <Condition>
                          <ScalarOperator>
                            <Compare CompareOp="EQ">
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Column="Expr1003" />
                                </Identifier>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Const ConstValue="(0)" />
                              </ScalarOperator>
                            </Compare>
                          </ScalarOperator>
                        </Condition>
                        <Then>
                          <ScalarOperator>
                            <Const ConstValue="NULL" />
                          </ScalarOperator>
                        </Then>
                        <Else>
                          <ScalarOperator>
                            <Identifier>
                              <ColumnReference Column="Expr1004" />
                            </Identifier>
                          </ScalarOperator>
                        </Else>
                      </IF>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="15" EstimateCPU="7.53299E-05" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="1" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="0.00655107">
                  <OutputList>
                    <ColumnReference Column="Expr1003" />
                    <ColumnReference Column="Expr1004" />
                  </OutputList>
                  <RunTimeInformation>
                    <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="21" ActualCPUms="21" />
                  </RunTimeInformation>
                  <StreamAggregate>
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="Expr1003" />
                        <ScalarOperator ScalarString="COUNT_BIG(#statistics.[rows] as [stpro].[rows])">
                          <Aggregate AggType="COUNT_BIG" Distinct="false">
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Table="#statistics" Alias="[stpro]" Column="rows" />
                              </Identifier>
                            </ScalarOperator>
                          </Aggregate>
                        </ScalarOperator>
                      </DefinedValue>
                      <DefinedValue>
                        <ColumnReference Column="Expr1004" />
                        <ScalarOperator ScalarString="SUM(#statistics.[rows] as [stpro].[rows])">
                          <Aggregate AggType="SUM" Distinct="false">
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Table="#statistics" Alias="[stpro]" Column="rows" />
                              </Identifier>
                            </ScalarOperator>
                          </Aggregate>
                        </ScalarOperator>
                      </DefinedValue>
                    </DefinedValues>
                    <RelOp AvgRowSize="23" EstimateCPU="0.0009134" EstimateIO="0.00542572" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="124.716" EstimatedRowsRead="759" LogicalOp="Table Scan" NodeId="2" Parallel="false" PhysicalOp="Table Scan" EstimatedTotalSubtreeCost="0.00633912" TableCardinality="759">
                      <OutputList>
                        <ColumnReference Table="#statistics" Alias="[stpro]" Column="rows" />
                      </OutputList>
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="540" ActualRowsRead="759" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="21" ActualCPUms="21" ActualScans="1" ActualLogicalReads="4" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                      </RunTimeInformation>
                      <TableScan Ordered="false" ForcedIndex="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Table="#statistics" Alias="[stpro]" Column="rows" />
                          </DefinedValue>
                        </DefinedValues>
                        <Object Database="[tempdb]" Schema="[dbo]" Table="[#statistics]" Alias="[stpro]" Storage="RowStore" />
                        <Predicate>
                          <ScalarOperator ScalarString="[@first]&lt;#statistics.[range_key] as [stpro].[range_key] AND #statistics.[range_key] as [stpro].[range_key]&lt;[@last]">
                            <Logical Operation="AND">
                              <ScalarOperator>
                                <Compare CompareOp="LT">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Column="@first" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Table="#statistics" Alias="[stpro]" Column="range_key" />
                                    </Identifier>
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Compare CompareOp="LT">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Table="#statistics" Alias="[stpro]" Column="range_key" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Column="@last" />
                                    </Identifier>
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                            </Logical>
                          </ScalarOperator>
                        </Predicate>
                      </TableScan>
                    </RelOp>
                  </StreamAggregate>
                </RelOp>
              </ComputeScalar>
            </RelOp>
            <ParameterList>
              <ColumnReference Column="@cot2" ParameterDataType="bigint" ParameterRuntimeValue="(9963541)" />
              <ColumnReference Column="@last" ParameterDataType="datetime" ParameterRuntimeValue="''2009-11-24 00:00:00.000''" />
              <ColumnReference Column="@first" ParameterDataType="datetime" ParameterRuntimeValue="''2007-07-01 00:00:00.000''" />
            </ParameterList>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="15" StatementEstRows="1" StatementId="8" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="GoodEnoughPlanFound" CardinalityEstimationModelVersion="150" StatementSubTreeCost="0.8333" StatementText="SELECT	@cot3 = COUNT(*)&#xD;&#xA;	FROM	FactOnlineSalesPartitioning fcto&#xD;&#xA;	WHERE	fcto.DateKey &gt;= (SELECT TOP(1) stcc.range_key FROM #statistics stcc WHERE stcc.range_key &lt; @last ORDER BY stcc.range_key DESC) &#xD;&#xA;	AND		fcto.DateKey &lt;= @parm2" StatementType="SELECT" QueryHash="0xCCB42BC1625E2C42" QueryPlanHash="0x476FBE16713CC67A" RetrievedFromCache="true" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan DegreeOfParallelism="1" MemoryGrant="1024" CachedPlanSize="152" CompileTime="72" CompileCPU="72" CompileMemory="3424">
            <MemoryGrantInfo SerialRequiredMemory="16" SerialDesiredMemory="24" RequiredMemory="16" DesiredMemory="24" RequestedMemory="1024" GrantWaitTime="0" GrantedMemory="1024" MaxUsedMemory="16" MaxQueryMemory="1066040" LastRequestedMemory="0" IsMemoryGrantFeedbackAdjusted="No: First Execution" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="155812" EstimatedPagesCached="77906" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="4289760" />
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Statistics="[WA_FactOnlineSalesPartitioning_Stats_DateKey]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-04-18T19:24:27.01" />
              <StatisticsInfo Database="[tempdb]" Schema="[dbo]" Table="[#statistics_________________________________________________________________________________________________________000000000005]" Statistics="[_WA_Sys_00000002_A3D0EDE7]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-05-02T16:47:34.94" />
              <StatisticsInfo Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Statistics="[PK_FactOnlineSalesPartitioning_SalesKey]" ModificationCount="20" SamplingPercent="1.33129" LastUpdate="2021-04-14T14:58:34.69" />
              <StatisticsInfo Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Statistics="[_WA_Sys_00000001_2E3BD7D3]" ModificationCount="22" SamplingPercent="1.34713" LastUpdate="2021-04-14T14:31:49.25" />
            </OptimizerStatsUsage>
            <QueryTimeStats CpuTime="6" ElapsedTime="6" />
            <RelOp AvgRowSize="15" EstimateCPU="1E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="0" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="0.849881">
              <OutputList>
                <ColumnReference Column="Expr1006" />
              </OutputList>
              <ComputeScalar>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1006" />
                    <ScalarOperator ScalarString="CONVERT_IMPLICIT(bigint,[Expr1005],0)">
                      <Convert DataType="bigint" Style="0" Implicit="true">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Column="Expr1005" />
                          </Identifier>
                        </ScalarOperator>
                      </Convert>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="11" EstimateCPU="0" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Compute Scalar" NodeId="1" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="0.849881">
                  <OutputList>
                    <ColumnReference Column="Expr1005" />
                  </OutputList>
                  <ComputeScalar>
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="Expr1005" />
                        <ScalarOperator ScalarString="CONVERT_IMPLICIT(int,[Expr1009],0)">
                          <Convert DataType="int" Style="0" Implicit="true">
                            <ScalarOperator>
                              <Identifier>
                                <ColumnReference Column="Expr1009" />
                              </Identifier>
                            </ScalarOperator>
                          </Convert>
                        </ScalarOperator>
                      </DefinedValue>
                    </DefinedValues>
                    <RelOp AvgRowSize="11" EstimateCPU="0.00723027" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="2" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="0.849881">
                      <OutputList>
                        <ColumnReference Column="Expr1009" />
                      </OutputList>
                      <RunTimeInformation>
                        <RunTimeCountersPerThread Thread="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="6" ActualCPUms="6" />
                      </RunTimeInformation>
                      <StreamAggregate>
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Expr1009" />
                            <ScalarOperator ScalarString="Count(*)">
                              <Aggregate AggType="countstar" Distinct="false" />
                            </ScalarOperator>
                          </DefinedValue>
                        </DefinedValues>
                        <RelOp AvgRowSize="9" EstimateCPU="0.0503674" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="12049.6" LogicalOp="Inner Join" NodeId="3" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="0.842651">
                          <OutputList />
                          <RunTimeInformation>
                            <RunTimeCountersPerThread Thread="0" ActualRows="12702" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="5" ActualCPUms="5" />
                          </RunTimeInformation>
                          <NestedLoops Optimized="false">
                            <OuterReferences>
                              <ColumnReference Table="#statistics" Alias="[stcc]" Column="range_key" />
                            </OuterReferences>
                            <RelOp AvgRowSize="15" EstimateCPU="0.00288168" EstimateIO="0.0112613" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" EstimateRowsWithoutRowGoal="227.7" LogicalOp="TopN Sort" NodeId="4" Parallel="false" PhysicalOp="Sort" EstimatedTotalSubtreeCost="0.0208464">
                              <OutputList>
                                <ColumnReference Table="#statistics" Alias="[stcc]" Column="range_key" />
                              </OutputList>
                              <MemoryFractions Input="1" Output="1" />
                              <RunTimeInformation>
                                <RunTimeCountersPerThread Thread="0" ActualRebinds="1" ActualRewinds="0" ActualRows="1" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="0" ActualLogicalReads="0" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" InputMemoryGrant="1024" OutputMemoryGrant="1024" UsedMemoryGrant="16" />
                              </RunTimeInformation>
                              <TopSort Distinct="false" Rows="1">
                                <OrderBy>
                                  <OrderByColumn Ascending="false">
                                    <ColumnReference Table="#statistics" Alias="[stcc]" Column="range_key" />
                                  </OrderByColumn>
                                </OrderBy>
                                <RelOp AvgRowSize="15" EstimateCPU="0.0009919" EstimateIO="0.00534722" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="227.7" EstimatedRowsRead="759" LogicalOp="Table Scan" NodeId="5" Parallel="false" PhysicalOp="Table Scan" EstimatedTotalSubtreeCost="0.00633912" TableCardinality="759">
                                  <OutputList>
                                    <ColumnReference Table="#statistics" Alias="[stcc]" Column="range_key" />
                                  </OutputList>
                                  <RunTimeInformation>
                                    <RunTimeCountersPerThread Thread="0" ActualRows="721" ActualRowsRead="759" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="0" ActualCPUms="0" ActualScans="1" ActualLogicalReads="4" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                                  </RunTimeInformation>
                                  <TableScan Ordered="false" ForcedIndex="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Table="#statistics" Alias="[stcc]" Column="range_key" />
                                      </DefinedValue>
                                    </DefinedValues>
                                    <Object Database="[tempdb]" Schema="[dbo]" Table="[#statistics]" Alias="[stcc]" Storage="RowStore" />
                                    <Predicate>
                                      <ScalarOperator ScalarString="#statistics.[range_key] as [stcc].[range_key]&lt;[@last]">
                                        <Compare CompareOp="LT">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Table="#statistics" Alias="[stcc]" Column="range_key" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Column="@last" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                    </Predicate>
                                  </TableScan>
                                </RelOp>
                              </TopSort>
                            </RelOp>
                            <RelOp AvgRowSize="9" EstimateCPU="0.0490506" EstimateIO="0.722387" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="12049.6" EstimatedRowsRead="12049.6" LogicalOp="Clustered Index Seek" NodeId="6" Parallel="false" Partitioned="true" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="0.771437" TableCardinality="12627600">
                              <OutputList />
                              <RunTimeInformation>
                                <RunTimeCountersPerThread Thread="0" ActualRows="12702" ActualRowsRead="12702" Batches="0" ActualEndOfScans="1" ActualExecutions="1" ActualExecutionMode="Row" ActualElapsedms="2" ActualCPUms="2" ActualScans="1" ActualLogicalReads="257" ActualPhysicalReads="0" ActualReadAheads="0" ActualLobLogicalReads="0" ActualLobPhysicalReads="0" ActualLobReadAheads="0" />
                              </RunTimeInformation>
                              <RunTimePartitionSummary>
                                <PartitionsAccessed PartitionCount="1">
                                  <PartitionRange Start="722" End="722" />
                                </PartitionsAccessed>
                              </RunTimePartitionSummary>
                              <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                <DefinedValues />
                                <Object Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Index="[PK_FactOnlineSalesPartitioning_SalesKey]" Alias="[fcto]" IndexKind="Clustered" Storage="RowStore" />
                                <SeekPredicates>
                                  <SeekPredicateNew>
                                    <SeekKeys>
                                      <StartRange ScanType="GE">
                                        <RangeColumns>
                                          <ColumnReference Column="PtnId1000" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="RangePartitionNew(#statistics.[range_key] as [stcc].[range_key],(1),''2007-06-30 00:00:00.000'',''2007-01-03 00:00:00.000'',''2007-01-04 00:00:00.000'',''2007-01-05 00:00:00.000'',''2007-01-06 00:00:00.000'',''2007-01-07 00:00:00.000'',''2007-01-08 00:00:00.000'',''2007-01-09 00:00:00.000'',''2007-01-10 00:00:00.000'',''2007-01-11 00:00:00.000'',''2007-01-12 00:00:00.000'',''2007-01-13 00:00:00.000'',''2007-01-14 00:00:00.000'',''2007-01-15 00:00:00.000'',''2007-01-16 00:00:00.000'',''2007-01-17 00:00:00.000'',''2007-01-18 00:00:00.000'',''2007-01-19 00:00:00.000'',''2007-01-20 00:00:00.000'',''2007-01-21 00:00:00.000'',''2007-01-22 00:00:00.000'',''2007-01-23 00:00:00.000'',''2007-01-24 00:00:00.000'',''2007-01-25 00:00:00.000'',''2007-01-26 00:00:00.000'',''2007-01-27 00:00:00.000'',''2007-01-28 00:00:00.000'',''2007-01-29 00:00:00.000'',''2007-01-30 00:00:00.000'',''2007-01-31 00:00:00.000'',''2007-02-01 00:00:00.000'',''2007-02-02 00:00:00.000'',''2007-02-03 00:00:00.000'',''2007-02-04 00:00:00.000'',''2007-02-05 00:00:00.000'',''2007-02-06 00:00:00.000'',''2007-02-07 00:00:00.000'',''2007-02-08 00:00:00.000'',''2007-02-09 00:00:00.000'',''2007-02-10 00:00:00.000'',''2007-02-11 00:00:00.000'',''2007-02-12 00:00:00.000'',''2007-02-13 00:00:00.000'',''2007-02-14 00:00:00.000'',''2007-02-15 00:00:00.000'',''2007-02-16 00:00:00.000'',''2007-02-17 00:00:00.000'',''2007-02-18 00:00:00.000'',''2007-02-19 00:00:00.000'',''2007-02-20 00:00:00.000'',''2007-02-21 00:00:00.000'',''2007-02-22 00:00:00.000'',''2007-02-23 00:00:00.000'',''2007-02-24 00:00:00.000'',''2007-02-25 00:00:00.000'',''2007-02-26 00:00:00.000'',''2007-02-27 00:00:00.000'',''2007-02-28 00:00:00.000'',''2007-03-01 00:00:00.000'',''2007-03-02 00:00:00.000'',''2007-03-03 00:00:00.000'',''2007-03-04 00:00:00.000'',''2007-03-05 00:00:00.000'',''2007-03-06 00:00:00.000'',''2007-03-07 00:00:00.000'',''2007-03-08 00:00:00.000'',''2007-03-09 00:00:00.000'',''2007-03-10 00:00:00.000'',''2007-03-11 00:00:00.000'',''2007-03-12 00:00:00.000'',''2007-03-13 00:00:00.000'',''2007-03-14 00:00:00.000'',''2007-03-15 00:00:00.000'',''2007-03-16 00:00:00.000'',''2007-03-17 00:00:00.000'',''2007-03-18 00:00:00.000'',''2007-03-19 00:00:00.000'',''2007-03-20 00:00:00.000'',''2007-03-21 00:00:00.000'',''2007-03-22 00:00:00.000'',''2007-03-23 00:00:00.000'',''2007-03-24 00:00:00.000'',''2007-03-25 00:00:00.000'',''2007-03-26 00:00:00.000'',''2007-03-27 00:00:00.000'',''2007-03-28 00:00:00.000'',''2007-03-29 00:00:00.000'',''2007-03-30 00:00:00.000'',''2007-03-31 00:00:00.000'',''2007-04-01 00:00:00.000'',''2007-04-02 00:00:00.000'',''2007-04-03 00:00:00.000'',''2007-04-04 00:00:00.000'',''2007-04-05 00:00:00.000'',''2007-04-06 00:00:00.000'',''2007-04-07 00:00:00.000'',''2007-04-08 00:00:00.000'',''2007-04-09 00:00:00.000'',''2007-04-10 00:00:00.000'',''2007-04-11 00:00:00.000'',''2007-04-12 00:00:00.000'',''2007-04-13 00:00:00.000'',''2007-04-14 00:00:00.000'',''2007-04-15 00:00:00.000'',''2007-04-16 00:00:00.000'',''2007-04-17 00:00:00.000'',''2007-04-18 00:00:00.000'',''2007-04-19 00:00:00.000'',''2007-04-20 00:00:00.000'',''2007-04-21 00:00:00.000'',''2007-04-22 00:00:00.000'',''2007-04-23 00:00:00.000'',''2007-04-24 00:00:00.000'',''2007-04-25 00:00:00.000'',''2007-04-26 00:00:00.000'',''2007-04-27 00:00:00.000'',''2007-04-28 00:00:00.000'',''2007-04-29 00:00:00.000'',''2007-04-30 00:00:00.000'',''2007-05-01 00:00:00.000'',''2007-05-02 00:00:00.000'',''2007-05-03 00:00:00.000'',''2007-05-04 00:00:00.000'',''2007-05-05 00:00:00.000'',''2007-05-06 00:00:00.000'',''2007-05-07 00:00:00.000'',''2007-05-08 00:00:00.000'',''2007-05-09 00:00:00.000'',''2007-05-10 00:00:00.000'',''2007-05-11 00:00:00.000'',''2007-05-12 00:00:00.000'',''2007-05-13 00:00:00.000'',''2007-05-14 00:00:00.000'',''2007-05-15 00:00:00.000'',''2007-05-16 00:00:00.000'',''2007-05-17 00:00:00.000'',''2007-05-18 00:00:00.000'',''2007-05-19 00:00:00.000'',''2007-05-20 00:00:00.000'',''2007-05-21 00:00:00.000'',''2007-05-22 00:00:00.000'',''2007-05-23 00:00:00.000'',''2007-05-24 00:00:00.000'',''2007-05-25 00:00:00.000'',''2007-05-26 00:00:00.000'',''2007-05-27 00:00:00.000'',''2007-05-28 00:00:00.000'',''2007-05-29 00:00:00.000'',''2007-05-30 00:00:00.000'',''2007-05-31 00:00:00.000'',''2007-06-01 00:00:00.000'',''2007-06-02 00:00:00.000'',''2007-06-03 00:00:00.000'',''2007-06-04 00:00:00.000'',''2007-06-05 00:00:00.000'',''2007-06-06 00:00:00.000'',''2007-06-07 00:00:00.000'',''2007-06-08 00:00:00.000'',''2007-06-09 00:00:00.000'',''2007-06-10 00:00:00.000'',''2007-06-11 00:00:00.000'',''2007-06-12 00:00:00.000'',''2007-06-13 00:00:00.000'',''2007-06-14 00:00:00.000'',''2007-06-15 00:00:00.000'',''2007-06-16 00:00:00.000'',''2007-06-17 00:00:00.000'',''2007-06-18 00:00:00.000'',''2007-06-19 00:00:00.000'',''2007-06-20 00:00:00.000'',''2007-06-21 00:00:00.000'',''2007-06-22 00:00:00.000'',''2007-06-23 00:00:00.000'',''2007-06-24 00:00:00.000'',''2007-06-25 00:00:00.000'',''2007-06-26 00:00:00.000'',''2007-06-27 00:00:00.000'',''2007-06-28 00:00:00.000'',''2007-06-29 00:00:00.000'',''2007-06-30 00:00:00.000'',''2007-07-01 00:00:00.000'',''2007-07-02 00:00:00.000'',''2007-07-03 00:00:00.000'',''2007-07-04 00:00:00.000'',''2007-07-05 00:00:00.000'',''2007-07-06 00:00:00.000'',''2007-07-07 00:00:00.000'',''2007-07-08 00:00:00.000'',''2007-07-09 00:00:00.000'',''2007-07-10 00:00:00.000'',''2007-07-11 00:00:00.000'',''2007-07-12 00:00:00.000'',''2007-07-13 00:00:00.000'',''2007-07-14 00:00:00.000'',''2007-07-15 00:00:00.000'',''2007-07-16 00:00:00.000'',''2007-07-17 00:00:00.000'',''2007-07-18 00:00:00.000'',''2007-07-19 00:00:00.000'',''2007-07-20 00:00:00.000'',''2007-07-21 00:00:00.000'',''2007-07-22 00:00:00.000'',''2007-07-23 00:00:00.000'',''2007-07-24 00:00:00.000'',''2007-07-25 00:00:00.000'',''2007-07-26 00:00:00.000'',''2007-07-27 00:00:00.000'',''2007-07-28 00:00:00.000'',''2007-07-29 00:00:00.000'',''2007-07-30 00:00:00.000'',''2007-07-31 00:00:00.000'',''2007-08-01 00:00:00.000'',''2007-08-02 00:00:00.000'',''2007-08-03 00:00:00.000'',''2007-08-04 00:00:00.000'',''2007-08-05 00:00:00.000'',''2007-08-06 00:00:00.000'',''2007-08-07 00:00:00.000'',''2007-08-08 00:00:00.000'',''2007-08-09 00:00:00.000'',''2007-08-10 00:00:00.000'',''2007-08-11 00:00:00.000'',''2007-08-12 00:00:00.000'',''2007-08-13 00:00:00.000'',''2007-08-14 00:00:00.000'',''2007-08-15 00:00:00.000'',''2007-08-16 00:00:00.000'',''2007-08-17 00:00:00.000'',''2007-08-18 00:00:00.000'',''2007-08-19 00:00:00.000'',''2007-08-20 00:00:00.000'',''2007-08-21 00:00:00.000'',''2007-08-22 00:00:00.000'',''2007-08-23 00:00:00.000'',''2007-08-24 00:00:00.000'',''2007-08-25 00:00:00.000'',''2007-08-26 00:00:00.000'',''2007-08-27 00:00:00.000'',''2007-08-28 00:00:00.000'',''2007-08-29 00:00:00.000'',''2007-08-30 00:00:00.000'',''2007-08-31 00:00:00.000'',''2007-09-01 00:00:00.000'',''2007-09-02 00:00:00.000'',''2007-09-03 00:00:00.000'',''2007-09-04 00:00:00.000'',''2007-09-05 00:00:00.000'',''2007-09-06 00:00:00.000'',''2007-09-07 00:00:00.000'',''2007-09-08 00:00:00.000'',''2007-09-09 00:00:00.000'',''2007-09-10 00:00:00.000'',''2007-09-11 00:00:00.000'',''2007-09-12 00:00:00.000'',''2007-09-13 00:00:00.000'',''2007-09-14 00:00:00.000'',''2007-09-15 00:00:00.000'',''2007-09-16 00:00:00.000'',''2007-09-17 00:00:00.000'',''2007-09-18 00:00:00.000'',''2007-09-19 00:00:00.000'',''2007-09-20 00:00:00.000'',''2007-09-21 00:00:00.000'',''2007-09-22 00:00:00.000'',''2007-09-23 00:00:00.000'',''2007-09-24 00:00:00.000'',''2007-09-25 00:00:00.000'',''2007-09-26 00:00:00.000'',''2007-09-27 00:00:00.000'',''2007-09-28 00:00:00.000'',''2007-09-29 00:00:00.000'',''2007-09-30 00:00:00.000'',''2007-10-01 00:00:00.000'',''2007-10-02 00:00:00.000'',''2007-10-03 00:00:00.000'',''2007-10-04 00:00:00.000'',''2007-10-05 00:00:00.000'',''2007-10-06 00:00:00.000'',''2007-10-07 00:00:00.000'',''2007-10-08 00:00:00.000'',''2007-10-09 00:00:00.000'',''2007-10-10 00:00:00.000'',''2007-10-11 00:00:00.000'',''2007-10-12 00:00:00.000'',''2007-10-13 00:00:00.000'',''2007-10-14 00:00:00.000'',''2007-10-15 00:00:00.000'',''2007-10-16 00:00:00.000'',''2007-10-17 00:00:00.000'',''2007-10-18 00:00:00.000'',''2007-10-19 00:00:00.000'',''2007-10-20 00:00:00.000'',''2007-10-21 00:00:00.000'',''2007-10-22 00:00:00.000'',''2007-10-23 00:00:00.000'',''2007-10-24 00:00:00.000'',''2007-10-25 00:00:00.000'',''2007-10-26 00:00:00.000'',''2007-10-27 00:00:00.000'',''2007-10-28 00:00:00.000'',''2007-10-29 00:00:00.000'',''2007-10-30 00:00:00.000'',''2007-10-31 00:00:00.000'',''2007-11-01 00:00:00.000'',''2007-11-02 00:00:00.000'',''2007-11-03 00:00:00.000'',''2007-11-04 00:00:00.000'',''2007-11-05 00:00:00.000'',''2007-11-06 00:00:00.000'',''2007-11-07 00:00:00.000'',''2007-11-08 00:00:00.000'',''2007-11-09 00:00:00.000'',''2007-11-10 00:00:00.000'',''2007-11-11 00:00:00.000'',''2007-11-12 00:00:00.000'',''2007-11-13 00:00:00.000'',''2007-11-14 00:00:00.000'',''2007-11-15 00:00:00.000'',''2007-11-16 00:00:00.000'',''2007-11-17 00:00:00.000'',''2007-11-18 00:00:00.000'',''2007-11-19 00:00:00.000'',''2007-11-20 00:00:00.000'',''2007-11-21 00:00:00.000'',''2007-11-22 00:00:00.000'',''2007-11-23 00:00:00.000'',''2007-11-24 00:00:00.000'',''2007-11-25 00:00:00.000'',''2007-11-26 00:00:00.000'',''2007-11-27 00:00:00.000'',''2007-11-28 00:00:00.000'',''2007-11-29 00:00:00.000'',''2007-11-30 00:00:00.000'',''2007-12-01 00:00:00.000'',''2008-11-02 00:00:00.000'',''2008-11-03 00:00:00.000'',''2008-11-04 00:00:00.000'',''2008-11-05 00:00:00.000'',''2008-11-06 00:00:00.000'',''2008-11-07 00:00:00.000'',''2008-11-08 00:00:00.000'',''2008-11-09 00:00:00.000'',''2008-11-10 00:00:00.000'',''2008-11-11 00:00:00.000'',''2008-11-12 00:00:00.000'',''2008-11-13 00:00:00.000'',''2008-11-14 00:00:00.000'',''2008-11-15 00:00:00.000'',''2008-11-16 00:00:00.000'',''2008-11-17 00:00:00.000'',''2008-11-18 00:00:00.000'',''2008-11-19 00:00:00.000'',''2008-11-20 00:00:00.000'',''2008-11-21 00:00:00.000'',''2008-11-22 00:00:00.000'',''2008-11-23 00:00:00.000'',''2008-11-24 00:00:00.000'',''2008-11-25 00:00:00.000'',''2008-11-26 00:00:00.000'',''2008-11-27 00:00:00.000'',''2008-11-28 00:00:00.000'',''2008-11-29 00:00:00.000'',''2008-11-30 00:00:00.000'',''2008-12-01 00:00:00.000'',''2008-12-02 00:00:00.000'',''2008-12-03 00:00:00.000'',''2008-12-04 00:00:00.000'',''2008-12-05 00:00:00.000'',''2008-12-06 00:00:00.000'',''2008-12-07 00:00:00.000'',''2008-12-08 00:00:00.000'',''2008-12-09 00:00:00.000'',''2008-12-10 00:00:00.000'',''2008-12-11 00:00:00.000'',''2008-12-12 00:00:00.000'',''2008-12-13 00:00:00.000'',''2008-12-14 00:00:00.000'',''2008-12-15 00:00:00.000'',''2008-12-16 00:00:00.000'',''2008-12-17 00:00:00.000'',''2008-12-18 00:00:00.000'',''2008-12-19 00:00:00.000'',''2008-12-20 00:00:00.000'',''2008-12-21 00:00:00.000'',''2008-12-22 00:00:00.000'',''2008-12-23 00:00:00.000'',''2008-12-24 00:00:00.000'',''2008-12-25 00:00:00.000'',''2008-12-26 00:00:00.000'',''2008-12-27 00:00:00.000'',''2008-12-28 00:00:00.000'',''2008-12-29 00:00:00.000'',''2008-12-30 00:00:00.000'',''2008-12-31 00:00:00.000'',''2009-01-01 00:00:00.000'',''2009-01-02 00:00:00.000'',''2009-01-03 00:00:00.000'',''2009-01-04 00:00:00.000'',''2009-01-05 00:00:00.000'',''2009-01-06 00:00:00.000'',''2009-01-07 00:00:00.000'',''2009-01-08 00:00:00.000'',''2009-01-09 00:00:00.000'',''2009-01-10 00:00:00.000'',''2009-01-11 00:00:00.000'',''2009-01-12 00:00:00.000'',''2009-01-13 00:00:00.000'',''2009-01-14 00:00:00.000'',''2009-01-15 00:00:00.000'',''2009-01-16 00:00:00.000'',''2009-01-17 00:00:00.000'',''2009-01-18 00:00:00.000'',''2009-01-19 00:00:00.000'',''2009-01-20 00:00:00.000'',''2009-01-21 00:00:00.000'',''2009-01-22 00:00:00.000'',''2009-01-23 00:00:00.000'',''2009-01-24 00:00:00.000'',''2009-01-25 00:00:00.000'',''2009-01-26 00:00:00.000'',''2009-01-27 00:00:00.000'',''2009-01-28 00:00:00.000'',''2009-01-29 00:00:00.000'',''2009-01-30 00:00:00.000'',''2009-01-31 00:00:00.000'',''2009-02-01 00:00:00.000'',''2009-02-02 00:00:00.000'',''2009-02-03 00:00:00.000'',''2009-02-04 00:00:00.000'',''2009-02-05 00:00:00.000'',''2009-02-06 00:00:00.000'',''2009-02-07 00:00:00.000'',''2009-02-08 00:00:00.000'',''2009-02-09 00:00:00.000'',''2009-02-10 00:00:00.000'',''2009-02-11 00:00:00.000'',''2009-02-12 00:00:00.000'',''2009-02-13 00:00:00.000'',''2009-02-14 00:00:00.000'',''2009-02-15 00:00:00.000'',''2009-02-16 00:00:00.000'',''2009-02-17 00:00:00.000'',''2009-02-18 00:00:00.000'',''2009-02-19 00:00:00.000'',''2009-02-20 00:00:00.000'',''2009-02-21 00:00:00.000'',''2009-02-22 00:00:00.000'',''2009-02-23 00:00:00.000'',''2009-02-24 00:00:00.000'',''2009-02-25 00:00:00.000'',''2009-02-26 00:00:00.000'',''2009-02-27 00:00:00.000'',''2009-02-28 00:00:00.000'',''2009-03-01 00:00:00.000'',''2009-03-02 00:00:00.000'',''2009-03-03 00:00:00.000'',''2009-03-04 00:00:00.000'',''2009-03-05 00:00:00.000'',''2009-03-06 00:00:00.000'',''2009-03-07 00:00:00.000'',''2009-03-08 00:00:00.000'',''2009-03-09 00:00:00.000'',''2009-03-10 00:00:00.000'',''2009-03-11 00:00:00.000'',''2009-03-12 00:00:00.000'',''2009-03-13 00:00:00.000'',''2009-03-14 00:00:00.000'',''2009-03-15 00:00:00.000'',''2009-03-16 00:00:00.000'',''2009-03-17 00:00:00.000'',''2009-03-18 00:00:00.000'',''2009-03-19 00:00:00.000'',''2009-03-20 00:00:00.000'',''2009-03-21 00:00:00.000'',''2009-03-22 00:00:00.000'',''2009-03-23 00:00:00.000'',''2009-03-24 00:00:00.000'',''2009-03-25 00:00:00.000'',''2009-03-26 00:00:00.000'',''2009-03-27 00:00:00.000'',''2009-03-28 00:00:00.000'',''2009-03-29 00:00:00.000'',''2009-03-30 00:00:00.000'',''2009-03-31 00:00:00.000'',''2009-04-01 00:00:00.000'',''2009-04-02 00:00:00.000'',''2009-04-03 00:00:00.000'',''2009-04-04 00:00:00.000'',''2009-04-05 00:00:00.000'',''2009-04-06 00:00:00.000'',''2009-04-07 00:00:00.000'',''2009-04-08 00:00:00.000'',''2009-04-09 00:00:00.000'',''2009-04-10 00:00:00.000'',''2009-04-11 00:00:00.000'',''2009-04-12 00:00:00.000'',''2009-04-13 00:00:00.000'',''2009-04-14 00:00:00.000'',''2009-04-15 00:00:00.000'',''2009-04-16 00:00:00.000'',''2009-04-17 00:00:00.000'',''2009-04-18 00:00:00.000'',''2009-04-19 00:00:00.000'',''2009-04-20 00:00:00.000'',''2009-04-21 00:00:00.000'',''2009-04-22 00:00:00.000'',''2009-04-23 00:00:00.000'',''2009-04-24 00:00:00.000'',''2009-04-25 00:00:00.000'',''2009-04-26 00:00:00.000'',''2009-04-27 00:00:00.000'',''2009-04-28 00:00:00.000'',''2009-04-29 00:00:00.000'',''2009-04-30 00:00:00.000'',''2009-05-01 00:00:00.000'',''2009-05-02 00:00:00.000'',''2009-05-03 00:00:00.000'',''2009-05-04 00:00:00.000'',''2009-05-05 00:00:00.000'',''2009-05-06 00:00:00.000'',''2009-05-07 00:00:00.000'',''2009-05-08 00:00:00.000'',''2009-05-09 00:00:00.000'',''2009-05-10 00:00:00.000'',''2009-05-11 00:00:00.000'',''2009-05-12 00:00:00.000'',''2009-05-13 00:00:00.000'',''2009-05-14 00:00:00.000'',''2009-05-15 00:00:00.000'',''2009-05-16 00:00:00.000'',''2009-05-17 00:00:00.000'',''2009-05-18 00:00:00.000'',''2009-05-19 00:00:00.000'',''2009-05-20 00:00:00.000'',''2009-05-21 00:00:00.000'',''2009-05-22 00:00:00.000'',''2009-05-23 00:00:00.000'',''2009-05-24 00:00:00.000'',''2009-05-25 00:00:00.000'',''2009-05-26 00:00:00.000'',''2009-05-27 00:00:00.000'',''2009-05-28 00:00:00.000'',''2009-05-29 00:00:00.000'',''2009-05-30 00:00:00.000'',''2009-05-31 00:00:00.000'',''2009-06-01 00:00:00.000'',''2009-06-02 00:00:00.000'',''2009-06-03 00:00:00.000'',''2009-06-04 00:00:00.000'',''2009-06-05 00:00:00.000'',''2009-06-06 00:00:00.000'',''2009-06-07 00:00:00.000'',''2009-06-08 00:00:00.000'',''2009-06-09 00:00:00.000'',''2009-06-10 00:00:00.000'',''2009-06-11 00:00:00.000'',''2009-06-12 00:00:00.000'',''2009-06-13 00:00:00.000'',''2009-06-14 00:00:00.000'',''2009-06-15 00:00:00.000'',''2009-06-16 00:00:00.000'',''2009-06-17 00:00:00.000'',''2009-06-18 00:00:00.000'',''2009-06-19 00:00:00.000'',''2009-06-20 00:00:00.000'',''2009-06-21 00:00:00.000'',''2009-06-22 00:00:00.000'',''2009-06-23 00:00:00.000'',''2009-06-24 00:00:00.000'',''2009-06-25 00:00:00.000'',''2009-06-26 00:00:00.000'',''2009-06-27 00:00:00.000'',''2009-06-28 00:00:00.000'',''2009-06-29 00:00:00.000'',''2009-06-30 00:00:00.000'',''2009-07-01 00:00:00.000'',''2009-07-02 00:00:00.000'',''2009-07-03 00:00:00.000'',''2009-07-04 00:00:00.000'',''2009-07-05 00:00:00.000'',''2009-07-06 00:00:00.000'',''2009-07-07 00:00:00.000'',''2009-07-08 00:00:00.000'',''2009-07-09 00:00:00.000'',''2009-07-10 00:00:00.000'',''2009-07-11 00:00:00.000'',''2009-07-12 00:00:00.000'',''2009-07-13 00:00:00.000'',''2009-07-14 00:00:00.000'',''2009-07-15 00:00:00.000'',''2009-07-16 00:00:00.000'',''2009-07-17 00:00:00.000'',''2009-07-18 00:00:00.000'',''2009-07-19 00:00:00.000'',''2009-07-20 00:00:00.000'',''2009-07-21 00:00:00.000'',''2009-07-22 00:00:00.000'',''2009-07-23 00:00:00.000'',''2009-07-24 00:00:00.000'',''2009-07-25 00:00:00.000'',''2009-07-26 00:00:00.000'',''2009-07-27 00:00:00.000'',''2009-07-28 00:00:00.000'',''2009-07-29 00:00:00.000'',''2009-07-30 00:00:00.000'',''2009-07-31 00:00:00.000'',''2009-08-01 00:00:00.000'',''2009-08-02 00:00:00.000'',''2009-08-03 00:00:00.000'',''2009-08-04 00:00:00.000'',''2009-08-05 00:00:00.000'',''2009-08-06 00:00:00.000'',''2009-08-07 00:00:00.000'',''2009-08-08 00:00:00.000'',''2009-08-09 00:00:00.000'',''2009-08-10 00:00:00.000'',''2009-08-11 00:00:00.000'',''2009-08-12 00:00:00.000'',''2009-08-13 00:00:00.000'',''2009-08-14 00:00:00.000'',''2009-08-15 00:00:00.000'',''2009-08-16 00:00:00.000'',''2009-08-17 00:00:00.000'',''2009-08-18 00:00:00.000'',''2009-08-19 00:00:00.000'',''2009-08-20 00:00:00.000'',''2009-08-21 00:00:00.000'',''2009-08-22 00:00:00.000'',''2009-08-23 00:00:00.000'',''2009-08-24 00:00:00.000'',''2009-08-25 00:00:00.000'',''2009-08-26 00:00:00.000'',''2009-08-27 00:00:00.000'',''2009-08-28 00:00:00.000'',''2009-08-29 00:00:00.000'',''2009-08-30 00:00:00.000'',''2009-08-31 00:00:00.000'',''2009-09-01 00:00:00.000'',''2009-09-02 00:00:00.000'',''2009-09-03 00:00:00.000'',''2009-09-04 00:00:00.000'',''2009-09-05 00:00:00.000'',''2009-09-06 00:00:00.000'',''2009-09-07 00:00:00.000'',''2009-09-08 00:00:00.000'',''2009-09-09 00:00:00.000'',''2009-09-10 00:00:00.000'',''2009-09-11 00:00:00.000'',''2009-09-12 00:00:00.000'',''2009-09-13 00:00:00.000'',''2009-09-14 00:00:00.000'',''2009-09-15 00:00:00.000'',''2009-09-16 00:00:00.000'',''2009-09-17 00:00:00.000'',''2009-09-18 00:00:00.000'',''2009-09-19 00:00:00.000'',''2009-09-20 00:00:00.000'',''2009-09-21 00:00:00.000'',''2009-09-22 00:00:00.000'',''2009-09-23 00:00:00.000'',''2009-09-24 00:00:00.000'',''2009-09-25 00:00:00.000'',''2009-09-26 00:00:00.000'',''2009-09-27 00:00:00.000'',''2009-09-28 00:00:00.000'',''2009-09-29 00:00:00.000'',''2009-09-30 00:00:00.000'',''2009-10-01 00:00:00.000'',''2009-10-02 00:00:00.000'',''2009-10-03 00:00:00.000'',''2009-10-04 00:00:00.000'',''2009-10-05 00:00:00.000'',''2009-10-06 00:00:00.000'',''2009-10-07 00:00:00.000'',''2009-10-08 00:00:00.000'',''2009-10-09 00:00:00.000'',''2009-10-10 00:00:00.000'',''2009-10-11 00:00:00.000'',''2009-10-12 00:00:00.000'',''2009-10-13 00:00:00.000'',''2009-10-14 00:00:00.000'',''2009-10-15 00:00:00.000'',''2009-10-16 00:00:00.000'',''2009-10-17 00:00:00.000'',''2009-10-18 00:00:00.000'',''2009-10-19 00:00:00.000'',''2009-10-20 00:00:00.000'',''2009-10-21 00:00:00.000'',''2009-10-22 00:00:00.000'',''2009-10-23 00:00:00.000'',''2009-10-24 00:00:00.000'',''2009-10-25 00:00:00.000'',''2009-10-26 00:00:00.000'',''2009-10-27 00:00:00.000'',''2009-10-28 00:00:00.000'',''2009-10-29 00:00:00.000'',''2009-10-30 00:00:00.000'',''2009-10-31 00:00:00.000'',''2009-11-01 00:00:00.000'',''2009-11-02 00:00:00.000'',''2009-11-03 00:00:00.000'',''2009-11-04 00:00:00.000'',''2009-11-05 00:00:00.000'',''2009-11-06 00:00:00.000'',''2009-11-07 00:00:00.000'',''2009-11-08 00:00:00.000'',''2009-11-09 00:00:00.000'',''2009-11-10 00:00:00.000'',''2009-11-11 00:00:00.000'',''2009-11-12 00:00:00.000'',''2009-11-13 00:00:00.000'',''2009-11-14 00:00:00.000'',''2009-11-15 00:00:00.000'',''2009-11-16 00:00:00.000'',''2009-11-17 00:00:00.000'',''2009-11-18 00:00:00.000'',''2009-11-19 00:00:00.000'',''2009-11-20 00:00:00.000'',''2009-11-21 00:00:00.000'',''2009-11-22 00:00:00.000'',''2009-11-23 00:00:00.000'',''2009-11-24 00:00:00.000'',''2009-11-25 00:00:00.000'',''2009-11-26 00:00:00.000'',''2009-11-27 00:00:00.000'',''2009-11-28 00:00:00.000'',''2009-11-29 00:00:00.000'',''2009-11-30 00:00:00.000'',''2009-12-01 00:00:00.000'',''2009-12-02 00:00:00.000'',''2009-12-03 00:00:00.000'',''2009-12-04 00:00:00.000'',''2009-12-05 00:00:00.000'',''2009-12-06 00:00:00.000'',''2009-12-07 00:00:00.000'',''2009-12-08 00:00:00.000'',''2009-12-09 00:00:00.000'',''2009-12-10 00:00:00.000'',''2009-12-11 00:00:00.000'',''2009-12-12 00:00:00.000'',''2009-12-13 00:00:00.000'',''2009-12-14 00:00:00.000'',''2009-12-15 00:00:00.000'',''2009-12-16 00:00:00.000'',''2009-12-17 00:00:00.000'',''2009-12-18 00:00:00.000'',''2009-12-19 00:00:00.000'',''2009-12-20 00:00:00.000'',''2009-12-21 00:00:00.000'',''2009-12-22 00:00:00.000'',''2009-12-23 00:00:00.000'',''2009-12-24 00:00:00.000'',''2009-12-25 00:00:00.000'',''2009-12-26 00:00:00.000'',''2009-12-27 00:00:00.000'',''2009-12-28 00:00:00.000'',''2009-12-29 00:00:00.000'',''2009-12-30 00:00:00.000'')">
                                            <Intrinsic FunctionName="RangePartitionNew">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Table="#statistics" Alias="[stcc]" Column="range_key" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="(1)" />
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="''2007-06-30 00:00:00.000''" />
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </StartRange>
                                      <EndRange ScanType="LE">
                                        <RangeColumns>
                                          <ColumnReference Column="PtnId1000" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="RangePartitionNew([@parm2],(1),''2007-06-30 00:00:00.000'',''2007-01-03 00:00:00.000'',''2007-01-04 00:00:00.000'',''2007-01-05 00:00:00.000'',''2007-01-06 00:00:00.000'',''2007-01-07 00:00:00.000'',''2007-01-08 00:00:00.000'',''2007-01-09 00:00:00.000'',''2007-01-10 00:00:00.000'',''2007-01-11 00:00:00.000'',''2007-01-12 00:00:00.000'',''2007-01-13 00:00:00.000'',''2007-01-14 00:00:00.000'',''2007-01-15 00:00:00.000'',''2007-01-16 00:00:00.000'',''2007-01-17 00:00:00.000'',''2007-01-18 00:00:00.000'',''2007-01-19 00:00:00.000'',''2007-01-20 00:00:00.000'',''2007-01-21 00:00:00.000'',''2007-01-22 00:00:00.000'',''2007-01-23 00:00:00.000'',''2007-01-24 00:00:00.000'',''2007-01-25 00:00:00.000'',''2007-01-26 00:00:00.000'',''2007-01-27 00:00:00.000'',''2007-01-28 00:00:00.000'',''2007-01-29 00:00:00.000'',''2007-01-30 00:00:00.000'',''2007-01-31 00:00:00.000'',''2007-02-01 00:00:00.000'',''2007-02-02 00:00:00.000'',''2007-02-03 00:00:00.000'',''2007-02-04 00:00:00.000'',''2007-02-05 00:00:00.000'',''2007-02-06 00:00:00.000'',''2007-02-07 00:00:00.000'',''2007-02-08 00:00:00.000'',''2007-02-09 00:00:00.000'',''2007-02-10 00:00:00.000'',''2007-02-11 00:00:00.000'',''2007-02-12 00:00:00.000'',''2007-02-13 00:00:00.000'',''2007-02-14 00:00:00.000'',''2007-02-15 00:00:00.000'',''2007-02-16 00:00:00.000'',''2007-02-17 00:00:00.000'',''2007-02-18 00:00:00.000'',''2007-02-19 00:00:00.000'',''2007-02-20 00:00:00.000'',''2007-02-21 00:00:00.000'',''2007-02-22 00:00:00.000'',''2007-02-23 00:00:00.000'',''2007-02-24 00:00:00.000'',''2007-02-25 00:00:00.000'',''2007-02-26 00:00:00.000'',''2007-02-27 00:00:00.000'',''2007-02-28 00:00:00.000'',''2007-03-01 00:00:00.000'',''2007-03-02 00:00:00.000'',''2007-03-03 00:00:00.000'',''2007-03-04 00:00:00.000'',''2007-03-05 00:00:00.000'',''2007-03-06 00:00:00.000'',''2007-03-07 00:00:00.000'',''2007-03-08 00:00:00.000'',''2007-03-09 00:00:00.000'',''2007-03-10 00:00:00.000'',''2007-03-11 00:00:00.000'',''2007-03-12 00:00:00.000'',''2007-03-13 00:00:00.000'',''2007-03-14 00:00:00.000'',''2007-03-15 00:00:00.000'',''2007-03-16 00:00:00.000'',''2007-03-17 00:00:00.000'',''2007-03-18 00:00:00.000'',''2007-03-19 00:00:00.000'',''2007-03-20 00:00:00.000'',''2007-03-21 00:00:00.000'',''2007-03-22 00:00:00.000'',''2007-03-23 00:00:00.000'',''2007-03-24 00:00:00.000'',''2007-03-25 00:00:00.000'',''2007-03-26 00:00:00.000'',''2007-03-27 00:00:00.000'',''2007-03-28 00:00:00.000'',''2007-03-29 00:00:00.000'',''2007-03-30 00:00:00.000'',''2007-03-31 00:00:00.000'',''2007-04-01 00:00:00.000'',''2007-04-02 00:00:00.000'',''2007-04-03 00:00:00.000'',''2007-04-04 00:00:00.000'',''2007-04-05 00:00:00.000'',''2007-04-06 00:00:00.000'',''2007-04-07 00:00:00.000'',''2007-04-08 00:00:00.000'',''2007-04-09 00:00:00.000'',''2007-04-10 00:00:00.000'',''2007-04-11 00:00:00.000'',''2007-04-12 00:00:00.000'',''2007-04-13 00:00:00.000'',''2007-04-14 00:00:00.000'',''2007-04-15 00:00:00.000'',''2007-04-16 00:00:00.000'',''2007-04-17 00:00:00.000'',''2007-04-18 00:00:00.000'',''2007-04-19 00:00:00.000'',''2007-04-20 00:00:00.000'',''2007-04-21 00:00:00.000'',''2007-04-22 00:00:00.000'',''2007-04-23 00:00:00.000'',''2007-04-24 00:00:00.000'',''2007-04-25 00:00:00.000'',''2007-04-26 00:00:00.000'',''2007-04-27 00:00:00.000'',''2007-04-28 00:00:00.000'',''2007-04-29 00:00:00.000'',''2007-04-30 00:00:00.000'',''2007-05-01 00:00:00.000'',''2007-05-02 00:00:00.000'',''2007-05-03 00:00:00.000'',''2007-05-04 00:00:00.000'',''2007-05-05 00:00:00.000'',''2007-05-06 00:00:00.000'',''2007-05-07 00:00:00.000'',''2007-05-08 00:00:00.000'',''2007-05-09 00:00:00.000'',''2007-05-10 00:00:00.000'',''2007-05-11 00:00:00.000'',''2007-05-12 00:00:00.000'',''2007-05-13 00:00:00.000'',''2007-05-14 00:00:00.000'',''2007-05-15 00:00:00.000'',''2007-05-16 00:00:00.000'',''2007-05-17 00:00:00.000'',''2007-05-18 00:00:00.000'',''2007-05-19 00:00:00.000'',''2007-05-20 00:00:00.000'',''2007-05-21 00:00:00.000'',''2007-05-22 00:00:00.000'',''2007-05-23 00:00:00.000'',''2007-05-24 00:00:00.000'',''2007-05-25 00:00:00.000'',''2007-05-26 00:00:00.000'',''2007-05-27 00:00:00.000'',''2007-05-28 00:00:00.000'',''2007-05-29 00:00:00.000'',''2007-05-30 00:00:00.000'',''2007-05-31 00:00:00.000'',''2007-06-01 00:00:00.000'',''2007-06-02 00:00:00.000'',''2007-06-03 00:00:00.000'',''2007-06-04 00:00:00.000'',''2007-06-05 00:00:00.000'',''2007-06-06 00:00:00.000'',''2007-06-07 00:00:00.000'',''2007-06-08 00:00:00.000'',''2007-06-09 00:00:00.000'',''2007-06-10 00:00:00.000'',''2007-06-11 00:00:00.000'',''2007-06-12 00:00:00.000'',''2007-06-13 00:00:00.000'',''2007-06-14 00:00:00.000'',''2007-06-15 00:00:00.000'',''2007-06-16 00:00:00.000'',''2007-06-17 00:00:00.000'',''2007-06-18 00:00:00.000'',''2007-06-19 00:00:00.000'',''2007-06-20 00:00:00.000'',''2007-06-21 00:00:00.000'',''2007-06-22 00:00:00.000'',''2007-06-23 00:00:00.000'',''2007-06-24 00:00:00.000'',''2007-06-25 00:00:00.000'',''2007-06-26 00:00:00.000'',''2007-06-27 00:00:00.000'',''2007-06-28 00:00:00.000'',''2007-06-29 00:00:00.000'',''2007-06-30 00:00:00.000'',''2007-07-01 00:00:00.000'',''2007-07-02 00:00:00.000'',''2007-07-03 00:00:00.000'',''2007-07-04 00:00:00.000'',''2007-07-05 00:00:00.000'',''2007-07-06 00:00:00.000'',''2007-07-07 00:00:00.000'',''2007-07-08 00:00:00.000'',''2007-07-09 00:00:00.000'',''2007-07-10 00:00:00.000'',''2007-07-11 00:00:00.000'',''2007-07-12 00:00:00.000'',''2007-07-13 00:00:00.000'',''2007-07-14 00:00:00.000'',''2007-07-15 00:00:00.000'',''2007-07-16 00:00:00.000'',''2007-07-17 00:00:00.000'',''2007-07-18 00:00:00.000'',''2007-07-19 00:00:00.000'',''2007-07-20 00:00:00.000'',''2007-07-21 00:00:00.000'',''2007-07-22 00:00:00.000'',''2007-07-23 00:00:00.000'',''2007-07-24 00:00:00.000'',''2007-07-25 00:00:00.000'',''2007-07-26 00:00:00.000'',''2007-07-27 00:00:00.000'',''2007-07-28 00:00:00.000'',''2007-07-29 00:00:00.000'',''2007-07-30 00:00:00.000'',''2007-07-31 00:00:00.000'',''2007-08-01 00:00:00.000'',''2007-08-02 00:00:00.000'',''2007-08-03 00:00:00.000'',''2007-08-04 00:00:00.000'',''2007-08-05 00:00:00.000'',''2007-08-06 00:00:00.000'',''2007-08-07 00:00:00.000'',''2007-08-08 00:00:00.000'',''2007-08-09 00:00:00.000'',''2007-08-10 00:00:00.000'',''2007-08-11 00:00:00.000'',''2007-08-12 00:00:00.000'',''2007-08-13 00:00:00.000'',''2007-08-14 00:00:00.000'',''2007-08-15 00:00:00.000'',''2007-08-16 00:00:00.000'',''2007-08-17 00:00:00.000'',''2007-08-18 00:00:00.000'',''2007-08-19 00:00:00.000'',''2007-08-20 00:00:00.000'',''2007-08-21 00:00:00.000'',''2007-08-22 00:00:00.000'',''2007-08-23 00:00:00.000'',''2007-08-24 00:00:00.000'',''2007-08-25 00:00:00.000'',''2007-08-26 00:00:00.000'',''2007-08-27 00:00:00.000'',''2007-08-28 00:00:00.000'',''2007-08-29 00:00:00.000'',''2007-08-30 00:00:00.000'',''2007-08-31 00:00:00.000'',''2007-09-01 00:00:00.000'',''2007-09-02 00:00:00.000'',''2007-09-03 00:00:00.000'',''2007-09-04 00:00:00.000'',''2007-09-05 00:00:00.000'',''2007-09-06 00:00:00.000'',''2007-09-07 00:00:00.000'',''2007-09-08 00:00:00.000'',''2007-09-09 00:00:00.000'',''2007-09-10 00:00:00.000'',''2007-09-11 00:00:00.000'',''2007-09-12 00:00:00.000'',''2007-09-13 00:00:00.000'',''2007-09-14 00:00:00.000'',''2007-09-15 00:00:00.000'',''2007-09-16 00:00:00.000'',''2007-09-17 00:00:00.000'',''2007-09-18 00:00:00.000'',''2007-09-19 00:00:00.000'',''2007-09-20 00:00:00.000'',''2007-09-21 00:00:00.000'',''2007-09-22 00:00:00.000'',''2007-09-23 00:00:00.000'',''2007-09-24 00:00:00.000'',''2007-09-25 00:00:00.000'',''2007-09-26 00:00:00.000'',''2007-09-27 00:00:00.000'',''2007-09-28 00:00:00.000'',''2007-09-29 00:00:00.000'',''2007-09-30 00:00:00.000'',''2007-10-01 00:00:00.000'',''2007-10-02 00:00:00.000'',''2007-10-03 00:00:00.000'',''2007-10-04 00:00:00.000'',''2007-10-05 00:00:00.000'',''2007-10-06 00:00:00.000'',''2007-10-07 00:00:00.000'',''2007-10-08 00:00:00.000'',''2007-10-09 00:00:00.000'',''2007-10-10 00:00:00.000'',''2007-10-11 00:00:00.000'',''2007-10-12 00:00:00.000'',''2007-10-13 00:00:00.000'',''2007-10-14 00:00:00.000'',''2007-10-15 00:00:00.000'',''2007-10-16 00:00:00.000'',''2007-10-17 00:00:00.000'',''2007-10-18 00:00:00.000'',''2007-10-19 00:00:00.000'',''2007-10-20 00:00:00.000'',''2007-10-21 00:00:00.000'',''2007-10-22 00:00:00.000'',''2007-10-23 00:00:00.000'',''2007-10-24 00:00:00.000'',''2007-10-25 00:00:00.000'',''2007-10-26 00:00:00.000'',''2007-10-27 00:00:00.000'',''2007-10-28 00:00:00.000'',''2007-10-29 00:00:00.000'',''2007-10-30 00:00:00.000'',''2007-10-31 00:00:00.000'',''2007-11-01 00:00:00.000'',''2007-11-02 00:00:00.000'',''2007-11-03 00:00:00.000'',''2007-11-04 00:00:00.000'',''2007-11-05 00:00:00.000'',''2007-11-06 00:00:00.000'',''2007-11-07 00:00:00.000'',''2007-11-08 00:00:00.000'',''2007-11-09 00:00:00.000'',''2007-11-10 00:00:00.000'',''2007-11-11 00:00:00.000'',''2007-11-12 00:00:00.000'',''2007-11-13 00:00:00.000'',''2007-11-14 00:00:00.000'',''2007-11-15 00:00:00.000'',''2007-11-16 00:00:00.000'',''2007-11-17 00:00:00.000'',''2007-11-18 00:00:00.000'',''2007-11-19 00:00:00.000'',''2007-11-20 00:00:00.000'',''2007-11-21 00:00:00.000'',''2007-11-22 00:00:00.000'',''2007-11-23 00:00:00.000'',''2007-11-24 00:00:00.000'',''2007-11-25 00:00:00.000'',''2007-11-26 00:00:00.000'',''2007-11-27 00:00:00.000'',''2007-11-28 00:00:00.000'',''2007-11-29 00:00:00.000'',''2007-11-30 00:00:00.000'',''2007-12-01 00:00:00.000'',''2008-11-02 00:00:00.000'',''2008-11-03 00:00:00.000'',''2008-11-04 00:00:00.000'',''2008-11-05 00:00:00.000'',''2008-11-06 00:00:00.000'',''2008-11-07 00:00:00.000'',''2008-11-08 00:00:00.000'',''2008-11-09 00:00:00.000'',''2008-11-10 00:00:00.000'',''2008-11-11 00:00:00.000'',''2008-11-12 00:00:00.000'',''2008-11-13 00:00:00.000'',''2008-11-14 00:00:00.000'',''2008-11-15 00:00:00.000'',''2008-11-16 00:00:00.000'',''2008-11-17 00:00:00.000'',''2008-11-18 00:00:00.000'',''2008-11-19 00:00:00.000'',''2008-11-20 00:00:00.000'',''2008-11-21 00:00:00.000'',''2008-11-22 00:00:00.000'',''2008-11-23 00:00:00.000'',''2008-11-24 00:00:00.000'',''2008-11-25 00:00:00.000'',''2008-11-26 00:00:00.000'',''2008-11-27 00:00:00.000'',''2008-11-28 00:00:00.000'',''2008-11-29 00:00:00.000'',''2008-11-30 00:00:00.000'',''2008-12-01 00:00:00.000'',''2008-12-02 00:00:00.000'',''2008-12-03 00:00:00.000'',''2008-12-04 00:00:00.000'',''2008-12-05 00:00:00.000'',''2008-12-06 00:00:00.000'',''2008-12-07 00:00:00.000'',''2008-12-08 00:00:00.000'',''2008-12-09 00:00:00.000'',''2008-12-10 00:00:00.000'',''2008-12-11 00:00:00.000'',''2008-12-12 00:00:00.000'',''2008-12-13 00:00:00.000'',''2008-12-14 00:00:00.000'',''2008-12-15 00:00:00.000'',''2008-12-16 00:00:00.000'',''2008-12-17 00:00:00.000'',''2008-12-18 00:00:00.000'',''2008-12-19 00:00:00.000'',''2008-12-20 00:00:00.000'',''2008-12-21 00:00:00.000'',''2008-12-22 00:00:00.000'',''2008-12-23 00:00:00.000'',''2008-12-24 00:00:00.000'',''2008-12-25 00:00:00.000'',''2008-12-26 00:00:00.000'',''2008-12-27 00:00:00.000'',''2008-12-28 00:00:00.000'',''2008-12-29 00:00:00.000'',''2008-12-30 00:00:00.000'',''2008-12-31 00:00:00.000'',''2009-01-01 00:00:00.000'',''2009-01-02 00:00:00.000'',''2009-01-03 00:00:00.000'',''2009-01-04 00:00:00.000'',''2009-01-05 00:00:00.000'',''2009-01-06 00:00:00.000'',''2009-01-07 00:00:00.000'',''2009-01-08 00:00:00.000'',''2009-01-09 00:00:00.000'',''2009-01-10 00:00:00.000'',''2009-01-11 00:00:00.000'',''2009-01-12 00:00:00.000'',''2009-01-13 00:00:00.000'',''2009-01-14 00:00:00.000'',''2009-01-15 00:00:00.000'',''2009-01-16 00:00:00.000'',''2009-01-17 00:00:00.000'',''2009-01-18 00:00:00.000'',''2009-01-19 00:00:00.000'',''2009-01-20 00:00:00.000'',''2009-01-21 00:00:00.000'',''2009-01-22 00:00:00.000'',''2009-01-23 00:00:00.000'',''2009-01-24 00:00:00.000'',''2009-01-25 00:00:00.000'',''2009-01-26 00:00:00.000'',''2009-01-27 00:00:00.000'',''2009-01-28 00:00:00.000'',''2009-01-29 00:00:00.000'',''2009-01-30 00:00:00.000'',''2009-01-31 00:00:00.000'',''2009-02-01 00:00:00.000'',''2009-02-02 00:00:00.000'',''2009-02-03 00:00:00.000'',''2009-02-04 00:00:00.000'',''2009-02-05 00:00:00.000'',''2009-02-06 00:00:00.000'',''2009-02-07 00:00:00.000'',''2009-02-08 00:00:00.000'',''2009-02-09 00:00:00.000'',''2009-02-10 00:00:00.000'',''2009-02-11 00:00:00.000'',''2009-02-12 00:00:00.000'',''2009-02-13 00:00:00.000'',''2009-02-14 00:00:00.000'',''2009-02-15 00:00:00.000'',''2009-02-16 00:00:00.000'',''2009-02-17 00:00:00.000'',''2009-02-18 00:00:00.000'',''2009-02-19 00:00:00.000'',''2009-02-20 00:00:00.000'',''2009-02-21 00:00:00.000'',''2009-02-22 00:00:00.000'',''2009-02-23 00:00:00.000'',''2009-02-24 00:00:00.000'',''2009-02-25 00:00:00.000'',''2009-02-26 00:00:00.000'',''2009-02-27 00:00:00.000'',''2009-02-28 00:00:00.000'',''2009-03-01 00:00:00.000'',''2009-03-02 00:00:00.000'',''2009-03-03 00:00:00.000'',''2009-03-04 00:00:00.000'',''2009-03-05 00:00:00.000'',''2009-03-06 00:00:00.000'',''2009-03-07 00:00:00.000'',''2009-03-08 00:00:00.000'',''2009-03-09 00:00:00.000'',''2009-03-10 00:00:00.000'',''2009-03-11 00:00:00.000'',''2009-03-12 00:00:00.000'',''2009-03-13 00:00:00.000'',''2009-03-14 00:00:00.000'',''2009-03-15 00:00:00.000'',''2009-03-16 00:00:00.000'',''2009-03-17 00:00:00.000'',''2009-03-18 00:00:00.000'',''2009-03-19 00:00:00.000'',''2009-03-20 00:00:00.000'',''2009-03-21 00:00:00.000'',''2009-03-22 00:00:00.000'',''2009-03-23 00:00:00.000'',''2009-03-24 00:00:00.000'',''2009-03-25 00:00:00.000'',''2009-03-26 00:00:00.000'',''2009-03-27 00:00:00.000'',''2009-03-28 00:00:00.000'',''2009-03-29 00:00:00.000'',''2009-03-30 00:00:00.000'',''2009-03-31 00:00:00.000'',''2009-04-01 00:00:00.000'',''2009-04-02 00:00:00.000'',''2009-04-03 00:00:00.000'',''2009-04-04 00:00:00.000'',''2009-04-05 00:00:00.000'',''2009-04-06 00:00:00.000'',''2009-04-07 00:00:00.000'',''2009-04-08 00:00:00.000'',''2009-04-09 00:00:00.000'',''2009-04-10 00:00:00.000'',''2009-04-11 00:00:00.000'',''2009-04-12 00:00:00.000'',''2009-04-13 00:00:00.000'',''2009-04-14 00:00:00.000'',''2009-04-15 00:00:00.000'',''2009-04-16 00:00:00.000'',''2009-04-17 00:00:00.000'',''2009-04-18 00:00:00.000'',''2009-04-19 00:00:00.000'',''2009-04-20 00:00:00.000'',''2009-04-21 00:00:00.000'',''2009-04-22 00:00:00.000'',''2009-04-23 00:00:00.000'',''2009-04-24 00:00:00.000'',''2009-04-25 00:00:00.000'',''2009-04-26 00:00:00.000'',''2009-04-27 00:00:00.000'',''2009-04-28 00:00:00.000'',''2009-04-29 00:00:00.000'',''2009-04-30 00:00:00.000'',''2009-05-01 00:00:00.000'',''2009-05-02 00:00:00.000'',''2009-05-03 00:00:00.000'',''2009-05-04 00:00:00.000'',''2009-05-05 00:00:00.000'',''2009-05-06 00:00:00.000'',''2009-05-07 00:00:00.000'',''2009-05-08 00:00:00.000'',''2009-05-09 00:00:00.000'',''2009-05-10 00:00:00.000'',''2009-05-11 00:00:00.000'',''2009-05-12 00:00:00.000'',''2009-05-13 00:00:00.000'',''2009-05-14 00:00:00.000'',''2009-05-15 00:00:00.000'',''2009-05-16 00:00:00.000'',''2009-05-17 00:00:00.000'',''2009-05-18 00:00:00.000'',''2009-05-19 00:00:00.000'',''2009-05-20 00:00:00.000'',''2009-05-21 00:00:00.000'',''2009-05-22 00:00:00.000'',''2009-05-23 00:00:00.000'',''2009-05-24 00:00:00.000'',''2009-05-25 00:00:00.000'',''2009-05-26 00:00:00.000'',''2009-05-27 00:00:00.000'',''2009-05-28 00:00:00.000'',''2009-05-29 00:00:00.000'',''2009-05-30 00:00:00.000'',''2009-05-31 00:00:00.000'',''2009-06-01 00:00:00.000'',''2009-06-02 00:00:00.000'',''2009-06-03 00:00:00.000'',''2009-06-04 00:00:00.000'',''2009-06-05 00:00:00.000'',''2009-06-06 00:00:00.000'',''2009-06-07 00:00:00.000'',''2009-06-08 00:00:00.000'',''2009-06-09 00:00:00.000'',''2009-06-10 00:00:00.000'',''2009-06-11 00:00:00.000'',''2009-06-12 00:00:00.000'',''2009-06-13 00:00:00.000'',''2009-06-14 00:00:00.000'',''2009-06-15 00:00:00.000'',''2009-06-16 00:00:00.000'',''2009-06-17 00:00:00.000'',''2009-06-18 00:00:00.000'',''2009-06-19 00:00:00.000'',''2009-06-20 00:00:00.000'',''2009-06-21 00:00:00.000'',''2009-06-22 00:00:00.000'',''2009-06-23 00:00:00.000'',''2009-06-24 00:00:00.000'',''2009-06-25 00:00:00.000'',''2009-06-26 00:00:00.000'',''2009-06-27 00:00:00.000'',''2009-06-28 00:00:00.000'',''2009-06-29 00:00:00.000'',''2009-06-30 00:00:00.000'',''2009-07-01 00:00:00.000'',''2009-07-02 00:00:00.000'',''2009-07-03 00:00:00.000'',''2009-07-04 00:00:00.000'',''2009-07-05 00:00:00.000'',''2009-07-06 00:00:00.000'',''2009-07-07 00:00:00.000'',''2009-07-08 00:00:00.000'',''2009-07-09 00:00:00.000'',''2009-07-10 00:00:00.000'',''2009-07-11 00:00:00.000'',''2009-07-12 00:00:00.000'',''2009-07-13 00:00:00.000'',''2009-07-14 00:00:00.000'',''2009-07-15 00:00:00.000'',''2009-07-16 00:00:00.000'',''2009-07-17 00:00:00.000'',''2009-07-18 00:00:00.000'',''2009-07-19 00:00:00.000'',''2009-07-20 00:00:00.000'',''2009-07-21 00:00:00.000'',''2009-07-22 00:00:00.000'',''2009-07-23 00:00:00.000'',''2009-07-24 00:00:00.000'',''2009-07-25 00:00:00.000'',''2009-07-26 00:00:00.000'',''2009-07-27 00:00:00.000'',''2009-07-28 00:00:00.000'',''2009-07-29 00:00:00.000'',''2009-07-30 00:00:00.000'',''2009-07-31 00:00:00.000'',''2009-08-01 00:00:00.000'',''2009-08-02 00:00:00.000'',''2009-08-03 00:00:00.000'',''2009-08-04 00:00:00.000'',''2009-08-05 00:00:00.000'',''2009-08-06 00:00:00.000'',''2009-08-07 00:00:00.000'',''2009-08-08 00:00:00.000'',''2009-08-09 00:00:00.000'',''2009-08-10 00:00:00.000'',''2009-08-11 00:00:00.000'',''2009-08-12 00:00:00.000'',''2009-08-13 00:00:00.000'',''2009-08-14 00:00:00.000'',''2009-08-15 00:00:00.000'',''2009-08-16 00:00:00.000'',''2009-08-17 00:00:00.000'',''2009-08-18 00:00:00.000'',''2009-08-19 00:00:00.000'',''2009-08-20 00:00:00.000'',''2009-08-21 00:00:00.000'',''2009-08-22 00:00:00.000'',''2009-08-23 00:00:00.000'',''2009-08-24 00:00:00.000'',''2009-08-25 00:00:00.000'',''2009-08-26 00:00:00.000'',''2009-08-27 00:00:00.000'',''2009-08-28 00:00:00.000'',''2009-08-29 00:00:00.000'',''2009-08-30 00:00:00.000'',''2009-08-31 00:00:00.000'',''2009-09-01 00:00:00.000'',''2009-09-02 00:00:00.000'',''2009-09-03 00:00:00.000'',''2009-09-04 00:00:00.000'',''2009-09-05 00:00:00.000'',''2009-09-06 00:00:00.000'',''2009-09-07 00:00:00.000'',''2009-09-08 00:00:00.000'',''2009-09-09 00:00:00.000'',''2009-09-10 00:00:00.000'',''2009-09-11 00:00:00.000'',''2009-09-12 00:00:00.000'',''2009-09-13 00:00:00.000'',''2009-09-14 00:00:00.000'',''2009-09-15 00:00:00.000'',''2009-09-16 00:00:00.000'',''2009-09-17 00:00:00.000'',''2009-09-18 00:00:00.000'',''2009-09-19 00:00:00.000'',''2009-09-20 00:00:00.000'',''2009-09-21 00:00:00.000'',''2009-09-22 00:00:00.000'',''2009-09-23 00:00:00.000'',''2009-09-24 00:00:00.000'',''2009-09-25 00:00:00.000'',''2009-09-26 00:00:00.000'',''2009-09-27 00:00:00.000'',''2009-09-28 00:00:00.000'',''2009-09-29 00:00:00.000'',''2009-09-30 00:00:00.000'',''2009-10-01 00:00:00.000'',''2009-10-02 00:00:00.000'',''2009-10-03 00:00:00.000'',''2009-10-04 00:00:00.000'',''2009-10-05 00:00:00.000'',''2009-10-06 00:00:00.000'',''2009-10-07 00:00:00.000'',''2009-10-08 00:00:00.000'',''2009-10-09 00:00:00.000'',''2009-10-10 00:00:00.000'',''2009-10-11 00:00:00.000'',''2009-10-12 00:00:00.000'',''2009-10-13 00:00:00.000'',''2009-10-14 00:00:00.000'',''2009-10-15 00:00:00.000'',''2009-10-16 00:00:00.000'',''2009-10-17 00:00:00.000'',''2009-10-18 00:00:00.000'',''2009-10-19 00:00:00.000'',''2009-10-20 00:00:00.000'',''2009-10-21 00:00:00.000'',''2009-10-22 00:00:00.000'',''2009-10-23 00:00:00.000'',''2009-10-24 00:00:00.000'',''2009-10-25 00:00:00.000'',''2009-10-26 00:00:00.000'',''2009-10-27 00:00:00.000'',''2009-10-28 00:00:00.000'',''2009-10-29 00:00:00.000'',''2009-10-30 00:00:00.000'',''2009-10-31 00:00:00.000'',''2009-11-01 00:00:00.000'',''2009-11-02 00:00:00.000'',''2009-11-03 00:00:00.000'',''2009-11-04 00:00:00.000'',''2009-11-05 00:00:00.000'',''2009-11-06 00:00:00.000'',''2009-11-07 00:00:00.000'',''2009-11-08 00:00:00.000'',''2009-11-09 00:00:00.000'',''2009-11-10 00:00:00.000'',''2009-11-11 00:00:00.000'',''2009-11-12 00:00:00.000'',''2009-11-13 00:00:00.000'',''2009-11-14 00:00:00.000'',''2009-11-15 00:00:00.000'',''2009-11-16 00:00:00.000'',''2009-11-17 00:00:00.000'',''2009-11-18 00:00:00.000'',''2009-11-19 00:00:00.000'',''2009-11-20 00:00:00.000'',''2009-11-21 00:00:00.000'',''2009-11-22 00:00:00.000'',''2009-11-23 00:00:00.000'',''2009-11-24 00:00:00.000'',''2009-11-25 00:00:00.000'',''2009-11-26 00:00:00.000'',''2009-11-27 00:00:00.000'',''2009-11-28 00:00:00.000'',''2009-11-29 00:00:00.000'',''2009-11-30 00:00:00.000'',''2009-12-01 00:00:00.000'',''2009-12-02 00:00:00.000'',''2009-12-03 00:00:00.000'',''2009-12-04 00:00:00.000'',''2009-12-05 00:00:00.000'',''2009-12-06 00:00:00.000'',''2009-12-07 00:00:00.000'',''2009-12-08 00:00:00.000'',''2009-12-09 00:00:00.000'',''2009-12-10 00:00:00.000'',''2009-12-11 00:00:00.000'',''2009-12-12 00:00:00.000'',''2009-12-13 00:00:00.000'',''2009-12-14 00:00:00.000'',''2009-12-15 00:00:00.000'',''2009-12-16 00:00:00.000'',''2009-12-17 00:00:00.000'',''2009-12-18 00:00:00.000'',''2009-12-19 00:00:00.000'',''2009-12-20 00:00:00.000'',''2009-12-21 00:00:00.000'',''2009-12-22 00:00:00.000'',''2009-12-23 00:00:00.000'',''2009-12-24 00:00:00.000'',''2009-12-25 00:00:00.000'',''2009-12-26 00:00:00.000'',''2009-12-27 00:00:00.000'',''2009-12-28 00:00:00.000'',''2009-12-29 00:00:00.000'',''2009-12-30 00:00:00.000'')">
                                            <Intrinsic FunctionName="RangePartitionNew">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="@parm2" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="(1)" />
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="''2007-06-30 00:00:00.000''" />
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </EndRange>
                                    </SeekKeys>
                                    <SeekKeys>
                                      <StartRange ScanType="GE">
                                        <RangeColumns>
                                          <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Alias="[fcto]" Column="DateKey" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="#statistics.[range_key] as [stcc].[range_key]">
                                            <Identifier>
                                              <ColumnReference Table="#statistics" Alias="[stcc]" Column="range_key" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </StartRange>
                                      <EndRange ScanType="LE">
                                        <RangeColumns>
                                          <ColumnReference Database="[Contoso]" Schema="[dbo]" Table="[FactOnlineSalesPartitioning]" Alias="[fcto]" Column="DateKey" />
                                        </RangeColumns>
                                        <RangeExpressions>
                                          <ScalarOperator ScalarString="[@parm2]">
                                            <Identifier>
                                              <ColumnReference Column="@parm2" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </RangeExpressions>
                                      </EndRange>
                                    </SeekKeys>
                                  </SeekPredicateNew>
                                </SeekPredicates>      
                              </IndexScan>
                            </RelOp>
                          </NestedLoops>
                        </RelOp>
                      </StreamAggregate>
                    </RelOp>
                  </ComputeScalar>
                </RelOp>
              </ComputeScalar>
            </RelOp>
            <ParameterList>
              <ColumnReference Column="@cot3" ParameterDataType="bigint" ParameterRuntimeValue="(12702)" />
              <ColumnReference Column="@parm2" ParameterDataType="datetime" ParameterRuntimeValue="''2009-11-23 00:00:00.000''" />
              <ColumnReference Column="@last" ParameterDataType="datetime" ParameterRuntimeValue="''2009-11-24 00:00:00.000''" />
            </ParameterList>
          </QueryPlan> 
        </StmtSimple>
      </Statements>
    </Batch>
  </BatchSequence>
</ShowPlanXML>'

EXEC ActualPlan @plan
