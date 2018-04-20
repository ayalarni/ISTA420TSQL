#TSQLChapter7,Pages213-230

##Norma I. Ayala-Rosa

1. What is a window function? It is a function that for each 
row, computes a scalar result value based on a calculation against a subset of the rows from the underlying query.
It is an analytical query!

2. What does partition do? PARTITION BY restricts the window to the subset of rows that have the same values in the partition columns as in the current row.

3. What does order by do? ORDER BY defines ordering, but don't confuse this with presentation ordering.

4. What does rows between do? A top delimeter, filters a frame, or a subset of rows from the window partition between the two specified delimiters.

5. What is ranking window function? Why would you use it? Give an example. Use it to rank each row with respect to others in the window. TSQL supports four ranking functions: ROW_NUMBER, RANK, DENSE-RANK, and NTILE.  Prioritizing!

6. What is an offset window function? Why would you use it? Give an example.  Use it to return an element from a row that is at a certain offset from the current row or at the beginning or end of a window frame. TSQL supports two pairs of offset functions: LAG and LEAD, and FIRST_VALUE and LAST_VALUE.

7. What do lead and lag do? They support window partitions and window order clauses.

8. What do first value and last value do? To return an element from the first and last rows in the window frame.

9. What is an aggregate window function? Why would you use it? Give an example. To aggregate the rows in the defined window.  They support window-partition, window-order, and window-frame clauses.  SUM, COUNT, AVG, ...

10. What is a pivot table and what does it do?  It involves rotating data from a state of rows to a state of columns, possibly aggregating values along the way.  Match up data in certain points and categories.