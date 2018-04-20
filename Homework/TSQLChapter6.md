#TSQLChapter6, Pages193 - 204

##Set Operators

###Norma I. Ayala-Rosa

1. What does a set operator do? Set operators are operators that combine rows from two query result sets (or multisets).

2. What are the general requirements of a set operator? The two operants must have exactly the set number of columns and same domains.

3. What is a Venn diagram? Is not in the book. A diagram representing mathematical or logical sets pictorially as circles or closed curves within an enclosing rectangle (the universal set), common elements of the sets being represented by the areas of overlap among the circles.

4. Draw a Venn diagram of the UNION operator. What does it do? If the object is in set A or is in set B. 

5. Draw a Venn diagram of the UNION ALL operator. What does it do? in UNION ALL, duplicates cannot exist when unifying the inputs.

6. Draw a Venn diagram of the INTERSECT operator. What does it do? It includes set A and set B. i.e. A-1,2,3,4  B-4,5,6,7, the intercept is 4.

7. If SQL server supported the INTERSECT ALL operator, what would it do?

8. Draw a Venn diagram of the EXCEPT operator.  What does it do? Does not follow the associativity query. Set DIFFERENCE.

9. If SQL server supported the EXCEPT ALL operator, what would it do?  Similar to Except.

10. What is the precedence of the set operators? The INTERCEPT operator precedes UNION and EXCEPT, and UNION and Except are evaluated in order of appearance.  INTERCEPT has a higher precedence.
11. 