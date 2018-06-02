# TSQL #Chapter 10, Pages319-360

## Norma I. Ayala-Rosa

1. What is the purpose of transactions? Is a unit of work that might include multiple activities that query and modify data and also change data definition.
Why do we use transactions in SQL scripts?  Because of by default, it commits the transaction at the end of each statement. 
 
2. Briefly describe each of the ACID properties.
A - Atomicity - either all changes in the transaction take place or none do.
C - Consistency - it refers to the state of the data that RDBMS give one access.
I - Isolation - it ensures the transaction access only consistent data.
D - Durability - Data changes are always written t the databses's transaction log on disk before they are written to the data portino of the database on disk.

3. What do we mean when we talk about the granularity of locks? Locks are controlled resources to guard data resources, preventing conflicting or incompatible access by other transactions.

4. What do we mean when we talk about the modes of locks? It defines what happens upon data modification.

5. In your ownh words, describe blocking, and give an example. When one transaction holds a lock on a data resource and another transaction requests an incompatible lock on the same resource, the request is blocked and the requester enters a wait state.

6. What are the properties of locks? That is, list the column name and column type of the fields in sys.dm tran locks.
Resource type, ID of database, resource and resource ID, lock mode, and whether the lock was granted or the session is waiting for it.

7. What are the properties of sessions? That is, list the column name and column type of the fields in sys.dm exec connections.
A connection to a database such as PID.

8. What are the requests of sessions? That is, list the column name and column type of the fields in sys.dm exec requests.


9. What is an isolation level? Give an example of the operation of an isolation level.
I defines the degree where data is mofified such as Read Uncommitted gives you dirty data. 

10. (Not in the book.) What do we mean when we say that an object is serializable?
Serialization isolation level behaves similarly to Repetable read.

11. What is an deadlock? Give an example of a deadlock.
A deadlock is a situation in which two or more sessions block each other.
