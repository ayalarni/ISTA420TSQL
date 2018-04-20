#TSQLChapter8bPages266-287

##Norma I. Ayala-Rosa

1. The sales tax rate for a state just changed. How would you update the sales tax table to reflect the changes? Assume that this table has an ID column, a RATE column, a STATE column.
update salestaxtable set rate = 0.05332 where id = 'GA';

2. The Revenue division has that you provide a report on what the actual sales taxes would have been for all orders in the past year, assuming the retroactivity of the new sales tax rate, how would you calculate this?
select salesamount salesid
  ,3.5 as newrate
  , (salesamount * newrate) as newtax
  , sum(salesamount * newrate) as newtotaltax
from salesforlastyear
  where year = 2017
  group by salesid;

3. Explain how the proprietary assignment update command works?
Update data on a table and assigns value.

4. What is one very important purpose of the merge SQL statement? What is ETL? (not in the book)
There is no need to provide the name of the target table because it is defined in the MERGE INTO clause.
ETL is short for extract, transform, load, three database functions that are combined into one tool to pull data out of one database and place it into another database. Extract is the process of reading data from a database. ... Transformation occurs by using rules or lookup tables or by combining the data with other data.

5. What are the semantics of merge?
It is mandatory to terminate the MERGE statement with a semicolon, whereas in most other statements is optional.
It adds nonesistent customers and update existing ones.
MERGE INTO table AS TGT
USING table AS SRC
 ON TGT = SRC
WHEN MATCHED THEN
 UPDATE SET

6. Write a typical INSERT OUTPUT statement. 
INSERT INTO table
 OUTPUT inserted.keycol, inserted .datacol
  SELECT
  FROM
WHERE

7. Write a typical UPDATE OUTPUT statement.
UPDATE table
  SET discount += 0.05
OUTPUT
WHERE

8. Write a typical DELETE OUTPUT statement.
DELETE FROM table
  OUTPUT
 WHERE

9. Write a typical MERGE OUTPUT statement. 
page 284

10. What is a nested DML? To directly insert into the final target table only the subset of rows you need from the full set
of modified rows.

