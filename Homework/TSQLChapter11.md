# TSQL# Chapter 11, Pages 361-413

## Norma I. Ayala-Rosa

1. Why do we use variables in T-SQL? To temporarily store data values for later use in the same batch in which they were declared.  It allows you to create dynamic queries.
How do you declare and initialize T-SQL variables? Using a Declare statement to declare one or more variables, and use
a SET statement to assign a value to a single variable.
 DECLARE @i as INT = 10;

2. Describe what is meant by a batch file in T-SQL? A batch is one or more T-SQL statements sent by a client application to to SQL Server for execution as a single unit.  The batch undergoes parsing (syntax checking) and optimization as a unit.
What is the difference between batches and transactions? A transaction is an atomic unit of work.  A batch can have multiple transactions, and a transaction is canceled or rolled back, SQL Server undoes the partial activity that has taken place since the beginning of the transaction, regardless of where the batch began.

3. What is the scope of variables with respect to T-SQL batches? A variable is local to the batch in which it's defined.  If one refer to a variable that was defined in another batch, one gets an error saying that the variable was not defined.  

4. Write a T-SQL code snippet that returns a data element stating whether the current person can legally purchase alcohol, that is, has reached his 21st birthday.
If current date is less than his/her birthday.

5. (Not in book) Does T-SQL have a for loop construction? No, one must use a while loop.

6. What is a cursor? It is a nonrelational result with order guaranteed among rows.
What is the difference between a relation and a cursor? A relation is another name for a table.  A cursor retrieves results.

7. How do you declare a temporary table? When the user don't have permissions to create permanent tables in a user database.
Why would you declare a temporary table? Use a #.

8. What is the difference between a stored procedure, a user defined function, and a trigger?
stored procedure - an encasuplated block stored by name
a user defined function - a mathematical relation that produces outcome
a trigger - an event; cannot affect anything outside the function

9. Write a user defined function that returns a Boolean as to whether a customer may purchase alcohol as of the instant that the function runs.


10. Write a trigger that places a customer in the OFF LIMITS table if he attempt to purchase alcohol
when he is underage.

11. Write a stored procedure that deletes customers from the OFF LIMITS table when they have reached
their 21st birthday.
