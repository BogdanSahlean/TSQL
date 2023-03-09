# XdlAnalysis

Reading all deadlocks graph events from following sources:    
- [x] Extended events files (including system health)
- [x] Extended events ring buffer
- [x] Trace file
- [x] Trace table
- [x] Event Notifications
	
# Parameters	

`@SrceDesc VARCHAR(MAX) = NULL --ID of deadlock from @ListAllDeads = 1 or Xdl Deadlock graph`,Optional

`@SrceDB TINYINT = NULL, --0 Db From Deadlock Graph, 1 Current Database`,Optional

`@ListAllDeads TINYINT = 0, -- 0/1`,Optional

`@Action TINYINT = NULL --0 Null, 1 Extract Execution Plans, 1 Analyze Plans`,Optional

# Behaviour
            
Reading and analyzing deadlocks xml graph events.

# Execution

Reading all deadlocks graph events.    

Call: 

`EXECUTE XdlAnalysis --col ID contains the unique indentifier of every deadlock)`      

Analysis of a single deadlock graph event        
                                                         
Call:      

`EXECUTE XdlAnalysis 33				--Analysis of ID 33, simplified analysis`

`EXECUTE XdlAnalysis 33, @Action=0/*NULL*/	--Analysis of ID 33, simplified analysis`

`--or`

`EXECUTE XdlAnalysis '<deadlock victim="process2706ded9c28">...'`

Show only the full list with deadlocks
  
Call:

`EXECUTE XdlAnalysis @ListAllDeads = 1`
        
Extended analysis of single deadlock graph event

Call

`EXECUTE XdlAnalysis 33, @Action=1`    

Extended analysis: extract execution plans from sqlhandle and/or name of stored procedure (format DB.Schema.Procedure)

In case of using the name of stored procedure to extract de execution plan, following options could be used: 
- [x] @SrceDB NULL/0 Db From Deadlock Graph, 
- [x] @SrceDB 1 Current Database   

Call

`EXECUTE XdlAnalysis 33, @Action=2`    
