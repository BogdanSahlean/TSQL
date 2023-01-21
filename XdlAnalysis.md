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

![image](https://user-images.githubusercontent.com/62909052/148302678-547296a5-0818-478e-967a-45cbb1ae94ea.png)
                   
There are 3 categories of info which are returned by this stored procedure:    
- [x] Category 1: Properties of every session
- [x] Category 2: Queries executed by every session and                                                                        
- [x] Category 3: Locks    
      
Every session is identified by SPID and ExecutionContext and ID (the name of the process). In this case, session 169.7.process77f265868 means (1) SPID 169 having the (2) ECID execution context 7 (thread 7) and (3) ID process77f265868. In the case of a query using paralelism we could see an ECID different than 0. More, in case of a query using paralelism we could see 2 or more sessions having the same SPID but with different ECIDs (threads), meaning we have intra-query parallelism deadlocks.

The order of session cols is descending order calculated with waittime property. This could be interpreted as follow: first session (having maximum waittime from all deadlock) is most probably the root cause of deadlock and we should analyse the locks geneated.


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
