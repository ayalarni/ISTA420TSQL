# TSQLChapter1

## Norma I. Ayala-Rosa

1. Give an informal definition of database as used in the expression “relational database management system”.
A piece of software system, a server. 

2. Give an informal definition of database as used in the expression “Human resources database”.
It is all collection of data used in the HR department.

3. Give an informal definition of entity integrity.
Entity integrity is a basic constraint of database relational model (abbreviated RM).
Relations or sets in a mathematical sense.  Every record is unique, no duplicates.  It is a collection of unique objects.

4. Give an informal definition of referential integrity.
Referential integrity constraint to ensure that data in one table points to data in another table—and doesn't point to data that doesn't exist. SQL Server uses constraints, triggers, rules, and defaults to enforce referential integrity.  Every child (foreign key) has a parent (primary key).

5. What is a “relation” as defined in the textbook.
Is a representation of a table.

6. Is this table in first normal form (1NF)? Why or why not? If it not, how would you change it?

  create table faculty (
  facID int primary key,
  facName text,
  facCreds text;)

No, the columns do not contain atomic (individual/not divisible) values.

7. Is this table in second normal form (2NF)? Why or why not? If it not, how would you change it?

  Create table pets (
     ownerID int primary key,
     petID int primary key,
     ownerFirstName text,
     ownerLastName text,
     petName text,
     petType text;
No, the original relation is not split into two relations.

8. Is this table in third normal form? Why or why not? If it not, how would you change it?
It is not!  City and State depend on zip code.  
 
9. What is an online transactional processing (OLTP) database? What operations it is optimized for?
OLTP is for data entry and not reporting.  It is optimized for inserts and deletes. 

10. What is a star schema? What operations it is optimized for?
Each dimension is implemented as a single table with redundant data.