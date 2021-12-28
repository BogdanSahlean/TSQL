# ActualPlan

Stored procedure used to analyze execution plans by extracting every single query text and associated query plans and to generate a new table having this info.. In some special cases, execution plans contains many single query plans. Because of that, analysis could be not only time consuming, but also extremely costly. Having a table with every query text and execution plan plus their properties allow us to inspect quickly.

# Parameters

`@plan XML` Execution plan to be analyzed.

# Behaviour

Results:
- [x] Query text extraction, meaning extracting query text from execution plan,
- [x] Extracting the query plan just for current query,
- [x] Query Cost,
- [x] Dop,
- [x] Cardinality estimator used by Query Optimizer and
- [x] Id Query, a number representing an identifier for every query from execution plan.

Example:
![image](https://user-images.githubusercontent.com/62909052/137581040-4b659ae9-4d4e-4038-80b1-008670200dc0.png)
   
# Execution
   
`EXECUTE Analysis @plan`   
