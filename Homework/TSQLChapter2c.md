# TSQLChapter2cPages 73-93

## Norma I. Ayala-Rosa


1. What is a data type? Data type specifies the form of data being input and it designates the amount of memory it will require. 
Why do we have data types? The purpose is to designate what operations can be performed on or with those data types.

2. What is a collation? It refers to a set of rules that dictate how information is sorted and stored. A collation is a property of character data.
Name four elements of a collation. These are language support, sort order, case sensitivity, and accent sensitivity.

3. How would you strip whitespace from a string? Suppose you have "...Dave...", but only want "Dave".
One can use either RTRIM of LTRIM depending on where the white space is located.

4. Suppose you wanted to make a list of every college and university that was called an Institute from a college table.
Write the query. Select * from college where name like (%institute%);

5. How would you find out the index of the first space in a string? For example, the index of the first space of "Barck Hussain
Obama" would be 7. Select charindex (' ' ,'Barack Hussein Obama');

6.  How would you select just the first name in the list of the presidents. First name can be of arbitrary lenght from "Cal" to
"Benjamin". Substring (president's name, 1, Charindex(' ', presidents name))

7. Payments are due exactly 30 days from the last function. Write a select query that calculates the date of the next payment. 
Pretend we want to update a column in a database that contains the date of the next payment. We will do this when we write update queries.
Select DateAdd (day, 30, lastpaymentdate); 

8. Suppose your son or daughter want to run a query everyday that tells them the number of day until their 16th birthday. 
Write a select query that does this. SELECT DATEDIFF (day, 20180301, 20180325)

9. What function returns the current date?  This is very useful in a table that maintains a log of events, such as users logins.
GETDATE10. 