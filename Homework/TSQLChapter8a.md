#TSQLChapter8a,Pages249-266

##Norma I. Ayala-Rosa

1. When using INSERT, is the list of columns necessary? Why or why not?  No, a column is optional. Ensure there is a primary key.

2. When using INSERT SELECT, do you use a subquery?Yes, the INSERT SELECT statement is performed as a transaction, so if any row fails to enter the target table, none of the rows enters the table.
Under what circumstances you don't use a subquery?  It always requires a syntax expression and a subquery.

3. What is the operand for the INSERT EXEC statement? The + operator takes two operands, it is a stored procedure.
Syntax is CREATE PROC (name)

4. How would you use the INSERT INTO statement? It generates a new table from the results of a query.

5. What are the parameters to the BULK INSERT statement? When you take a data file and turn it into a database.  Every data base language has a BULK INSERT. It separates the columns, first is DATAFILE.

6. Does IDENTITY guarantee uniqueness? Every row is unique, every row has a primary key.
If not, how do you guarantee uniqueness? It resets under most circumstances.

7. How do you create a SEQUENCE object? It creates an object.

8. How do you use a SEQUENCE object? First create a SEQUENCE.

9. How do you alter a SEQUENCE object? Use alter command.

10. What is the difference between DELETE and TRUNCATE? The TRUNCATE statement deletes all rows from a table.  Unlike the DELETE statement, TRUNCATE has no filter, deletes the data (colun remains). The TRUNCATE is fast, the DELETE statement can take minutes.

11. What is the difference between DELETE and DROP TABLE? DELETE is a query, it deletes the values specified.

