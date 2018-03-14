# TSQLChapter4Pages 133 - 149

## Norma I. Ayala-Rosa


1. What is a subquery?
A query inside an outer query. It can return a scaler (one-number) or single-value i.e. average, count, sum.  
A multivalued such as like; it can return a table, a common is a syntax expression.

2. What is a self-contained subquery?
You can take it out and run it. They are independent of the tables in the outer query, and are convenient to debug.

3. What is correlated subquery?
It is dependent of the outer query, if take it out it does not run.

4. Give an example of of a subquery that returns a single value.  When would you use this kind of subquery?
Examples are average, sum, or count.

5. Give an example of of a subquery that returns a multiple values. When would you use this kind of subquery?
It is a query that returns a list.

6. Give an example of a subquery that returns a table values. When would you use this kind of subquery?
i. e. Select all from products where a color equals color blue.    

7. What does the exists predict do? Give an example.
It accepts a subquery as input and returns True if the subquery returns any rows and False otherwise.

8. What happens if we use the not operator before a predicate? Give an example.

9. When you use exists or no exists with respect to a row in a database, does it return two or three values? Explain.
It returns two values or three values.

10.
Skipped!