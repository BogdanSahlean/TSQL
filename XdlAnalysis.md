Reading all deadlocks graph events from following sources: 
- [x] Extended events files (including system health)
- [x] Extended events ring buffer
- [x] Trace file
- [x] Trace table
- [x] Event Notifications
	
Call: 

`EXECUTE XdlAnalysis --col ID contains the unique indentifier of every deadlock)`
		
Sample output:
![image](https://user-images.githubusercontent.com/62909052/147558845-92173972-e5be-47d4-8a78-b09a3348eb05.png)		

Analysis of a single deadlock graph event

Call:

`EXECUTE XdlAnalysis 33				--Analysis of ID 33, simplified analysis`

`EXECUTE XdlAnalysis 33, @Action=0/*NULL*/	--Analysis of ID 33, simplified analysis`

`--or`

`EXECUTE XdlAnalysis '<deadlock victim="process2706ded9c28">...'`
	
Sample output:
![image](https://user-images.githubusercontent.com/62909052/148180207-8157325a-e2cf-4851-845f-734a69470935.png)

Show only the full list with deadlocks

Call:
             
`EXECUTE XdlAnalysis @ListAllDeads = 1`     
        
Extended analysis of single deadlock graph event                  
   
Call

`EXECUTE XdlAnalysis 33, @Action=1`

Extended analysis: extract execution plans from sqlhandle and/or name of stored procedure (format DB.Schema.Procedure)
In case of using the name of stored procedure to extract de execution plan, following options could be used: @SrceDB NULL/0 Db From Deadlock Graph, 1 Current Database 
      
Call

`EXECUTE XdlAnalysis 33, @Action=2`

Extended analysis: extract query execution plans      
		
Sample output:
![image](https://user-images.githubusercontent.com/62909052/147571956-c929f37a-a090-4dd9-b258-600424deda9b.png)
