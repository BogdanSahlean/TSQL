# ActualPlan

Stored procedure used to analyze execution plans by extracting every single query text and associated query plans and to generate a new table having this info.. In some special cases, execution plans contains many single query plans. Because of that, analysis could be not only time consuming, but also extremely costly. Having a table with every query text and execution plan plus their properties allow us to inspect quickly.

# Parameters

`@plan XML` Execution plan to be analyzed.

# Behaviour

Behaviour

# Execution

`EXECUTE Analysis @plan`
