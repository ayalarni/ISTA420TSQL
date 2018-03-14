# TSQLChapter2a

## Norma I. Ayala-Rosa

1. What is a primary key constraint?  What two other constraints is equivalent to?
It enforces the uniqueness of rows and disallows NULLS in the constraint attributes. 
Is equivalent to non nullable.

2. What is a nullability constraint?  What does it prevent?
It tells a database to contain a value. 

3. What is a unique constraint?  What does it prevent?
One cannot have the same values in a row.  It is not restricted to columns defines as NOT NULL.

4. What is a foreign key constraint?  What does it allow?
It enforces referential integrity.  It controls a value that can be put in a column .

5. What is a check constraint?  What does it allow?
Use it to define a predicate (true or false) that a row must meet to be entered into the table or to be modified.

6. What is a default constraint? What does it allow?
It is associated with a particular attribute.  A default value, it can be override. 

7. What is domain integrity?  It is not on our textbook.
A column is a domain.  All columns in a db must be declared, specify integer, no character can be there.

8. What is the difference between where and the having clauses?  How are they alike?
In the where clause, one specify a predicate or logical expression to filter he rows returned by the FROM phase.  It has significance when it comes to query performance.  

9. What is SQL operator at the highest precedence?  What is SQL operator at the lowest precedence?
Highest precedence is
Lowest precedence is

10. Yes or no: In the SQL standard, is NULL equal to NULL? Why or why not?
No means NULL.  Two NULLS in different databases are different.  NULL equals to NULL should return to False.
