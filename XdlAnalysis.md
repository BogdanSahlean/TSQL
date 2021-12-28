	Reading all deadlocks graph events from following sources: 
		Extended events files (including system health)
		Extended events ring buffer
		Trace file
		Trace table
		Event Notifications
	
		Call: 
		EXECUTE XdlAnalysis --col ID contains the unique indentifier of every deadlock)

	Analysis of a single deadlock graph event
		Call:
		EXECUTE XdlAnalysis 33				--Analysis of ID 33, simplified analysis
		EXECUTE XdlAnalysis 33, @Action=0/*NULL*/	--Analysis of ID 33, simplified analysis
		--or
		EXECUTE XdlAnalysis '<deadlock victim="process2706ded9c28">...'
	
		Sample output:
		![image](https://user-images.githubusercontent.com/62909052/147550807-ed16d0d9-5708-4d6e-b1fc-81cf83ac71ed.png)

	Show only the full list with deadlocks
		Call:
		EXECUTE XdlAnalysis @ListAllDeads = 1
        
	Extended analysis of single deadlock graph event
		Call
		EXECUTE XdlAnalysis 33, @Action=1 
		Extended analysis: extract execution plans from sqlhandle and/or name of stored procedure (format DB.Schema.Procedure)
		In case of using the name of stored procedure to extract de execution plan, following options could be used: @SrceDB NULL/0 Db From Deadlock Graph, 1 Current Database 

		Call
		EXECUTE XdlAnalysis 33, @Action=2    
		Extended analysis: extract query execution plans      


               
