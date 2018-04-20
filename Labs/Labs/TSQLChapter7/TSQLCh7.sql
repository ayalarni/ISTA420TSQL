USE TSQLV4;

SELECT empid, ordermonth, val,
  SUM(val) OVER(PARTITION BY empid
                ORDER BY ordermonth
                ROWS BETWEEN UNBOUNDED PRECEDING
                         AND CURRENT ROW) AS runval
FROM Sales.EmpOrders;

---------------------------------------------------------------------
-- Ranking Window Functions
---------------------------------------------------------------------

SELECT orderid, custid, val,
  ROW_NUMBER() OVER(ORDER BY val) AS rownum,
  RANK()       OVER(ORDER BY val) AS rank,
  DENSE_RANK() OVER(ORDER BY val) AS dense_rank,
  NTILE(10)    OVER(ORDER BY val) AS ntile
FROM Sales.OrderValues
ORDER BY val;

SELECT orderid, custid, val,
  ROW_NUMBER() OVER(PARTITION BY custid
                    ORDER BY val) AS rownum
FROM Sales.OrderValues
ORDER BY custid, val;

SELECT DISTINCT val, ROW_NUMBER() OVER(ORDER BY val) AS rownum
FROM Sales.OrderValues;

SELECT val, ROW_NUMBER() OVER(ORDER BY val) AS rownum
FROM Sales.OrderValues
GROUP BY val;

---------------------------------------------------------------------
-- Offset Window Functions
---------------------------------------------------------------------

-- LAG and LEAD
SELECT custid, orderid, val,
  LAG(val)  OVER(PARTITION BY custid
                 ORDER BY orderdate, orderid) AS prevval,
  LEAD(val) OVER(PARTITION BY custid
                 ORDER BY orderdate, orderid) AS nextval
FROM Sales.OrderValues
ORDER BY custid, orderdate, orderid;

-- FIRST_VALUE and LAST_VALUE
SELECT custid, orderid, val,
  FIRST_VALUE(val) OVER(PARTITION BY custid
                        ORDER BY orderdate, orderid
                        ROWS BETWEEN UNBOUNDED PRECEDING
                                 AND CURRENT ROW) AS firstval,
  LAST_VALUE(val)  OVER(PARTITION BY custid
                        ORDER BY orderdate, orderid
                        ROWS BETWEEN CURRENT ROW
                                 AND UNBOUNDED FOLLOWING) AS lastval
FROM Sales.OrderValues
ORDER BY custid, orderdate, orderid;

---------------------------------------------------------------------
-- Aggregate Window Functions
---------------------------------------------------------------------

SELECT orderid, custid, val,
  SUM(val) OVER() AS totalvalue,
  SUM(val) OVER(PARTITION BY custid) AS custtotalvalue
FROM Sales.OrderValues;

SELECT orderid, custid, val,
  100. * val / SUM(val) OVER() AS pctall,
  100. * val / SUM(val) OVER(PARTITION BY custid) AS pctcust
FROM Sales.OrderValues;

SELECT empid, ordermonth, val,
  SUM(val) OVER(PARTITION BY empid
                ORDER BY ordermonth
                ROWS BETWEEN UNBOUNDED PRECEDING
                         AND CURRENT ROW) AS runval
FROM Sales.EmpOrders;

---------------------------------------------------------------------
-- Pivoting Data
---------------------------------------------------------------------

-- Listing 1: Code to Create and Populate the Orders Table
USE TSQLV4;

DROP TABLE IF EXISTS dbo.Orders;
GO

CREATE TABLE dbo.Orders
(
  orderid   INT        NOT NULL,
  orderdate DATE       NOT NULL,
  empid     INT        NOT NULL,
  custid    VARCHAR(5) NOT NULL,
  qty       INT        NOT NULL,
  CONSTRAINT PK_Orders PRIMARY KEY(orderid)
);

INSERT INTO dbo.Orders(orderid, orderdate, empid, custid, qty)
VALUES
  (30001, '20140802', 3, 'A', 10),
  (10001, '20141224', 2, 'A', 12),
  (10005, '20141224', 1, 'B', 20),
  (40001, '20150109', 2, 'A', 40),
  (10006, '20150118', 1, 'C', 14),
  (20001, '20150212', 2, 'B', 12),
  (40005, '20160212', 3, 'A', 10),
  (20002, '20160216', 1, 'C', 20),
  (30003, '20160418', 2, 'B', 15),
  (30004, '20140418', 3, 'C', 22),
  (30007, '20160907', 3, 'D', 30);

SELECT * FROM dbo.Orders;

-- Query against Orders, grouping by employee and customer
SELECT empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY empid, custid;

---------------------------------------------------------------------
-- Pivoting with a Grouped Query
---------------------------------------------------------------------

-- Query against Orders, grouping by employee, pivoting customers,
-- aggregating sum of quantity
SELECT empid,
  SUM(CASE WHEN custid = 'A' THEN qty END) AS A,
  SUM(CASE WHEN custid = 'B' THEN qty END) AS B,
  SUM(CASE WHEN custid = 'C' THEN qty END) AS C,
  SUM(CASE WHEN custid = 'D' THEN qty END) AS D  
FROM dbo.Orders
GROUP BY empid;

---------------------------------------------------------------------
-- Pivoting with the PIVOT Operator
---------------------------------------------------------------------

-- Logical equivalent of previous query using the native PIVOT operator
SELECT empid, A, B, C, D
FROM (SELECT empid, custid, qty
      FROM dbo.Orders) AS D
  PIVOT(SUM(qty) FOR custid IN(A, B, C, D)) AS P;

-- Query demonstrating the problem with implicit grouping
SELECT empid, A, B, C, D
FROM dbo.Orders
  PIVOT(SUM(qty) FOR custid IN(A, B, C, D)) AS P;

-- Logical equivalent of previous query
SELECT empid,
  SUM(CASE WHEN custid = 'A' THEN qty END) AS A,
  SUM(CASE WHEN custid = 'B' THEN qty END) AS B,
  SUM(CASE WHEN custid = 'C' THEN qty END) AS C,
  SUM(CASE WHEN custid = 'D' THEN qty END) AS D  
FROM dbo.Orders
GROUP BY orderid, orderdate, empid;

-- Query against Orders, grouping by customer, pivoting employees,
-- aggregating sum of quantity
SELECT custid, [1], [2], [3]
FROM (SELECT empid, custid, qty
      FROM dbo.Orders) AS D
  PIVOT(SUM(qty) FOR empid IN([1], [2], [3])) AS P;

---------------------------------------------------------------------
-- Unpivoting Data
---------------------------------------------------------------------

-- Code to create and populate the EmpCustOrders table
USE TSQLV4;

DROP TABLE IF EXISTS dbo.EmpCustOrders;

CREATE TABLE dbo.EmpCustOrders
(
  empid INT NOT NULL
    CONSTRAINT PK_EmpCustOrders PRIMARY KEY,
  A VARCHAR(5) NULL,
  B VARCHAR(5) NULL,
  C VARCHAR(5) NULL,
  D VARCHAR(5) NULL
);

INSERT INTO dbo.EmpCustOrders(empid, A, B, C, D)
  SELECT empid, A, B, C, D
  FROM (SELECT empid, custid, qty
        FROM dbo.Orders) AS D
    PIVOT(SUM(qty) FOR custid IN(A, B, C, D)) AS P;

SELECT * FROM dbo.EmpCustOrders;

---------------------------------------------------------------------
-- Unpivoting with the APPLY Operator
---------------------------------------------------------------------

-- Unpivot Step 1: generate copies
SELECT *
FROM dbo.EmpCustOrders
  CROSS JOIN (VALUES('A'),('B'),('C'),('D')) AS C(custid);

-- Unpivot Step 2: extract elements
/*
SELECT empid, custid, qty
FROM dbo.EmpCustOrders
  CROSS JOIN (VALUES('A', A),('B', B),('C', C),('D', D)) AS C(custid, qty);
*/

SELECT empid, custid, qty
FROM dbo.EmpCustOrders
  CROSS APPLY (VALUES('A', A),('B', B),('C', C),('D', D)) AS C(custid, qty);

-- Unpivot Step 3: eliminate NULLs
SELECT empid, custid, qty
FROM dbo.EmpCustOrders
  CROSS APPLY (VALUES('A', A),('B', B),('C', C),('D', D)) AS C(custid, qty)
WHERE qty IS NOT NULL;

---------------------------------------------------------------------
-- Unpivoting with the UNPIVOT Operator
---------------------------------------------------------------------

-- Query using the native UNPIVOT operator
SELECT empid, custid, qty
FROM dbo.EmpCustOrders
  UNPIVOT(qty FOR custid IN(A, B, C, D)) AS U;
  
---------------------------------------------------------------------
-- Grouping Sets
---------------------------------------------------------------------

-- Four queries, each with a different grouping set
SELECT empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY empid, custid;

SELECT empid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY empid;

SELECT custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY custid;

SELECT SUM(qty) AS sumqty
FROM dbo.Orders;

-- Unifying result sets of four queries
SELECT empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY empid, custid

UNION ALL

SELECT empid, NULL, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY empid

UNION ALL

SELECT NULL, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY custid

UNION ALL

SELECT NULL, NULL, SUM(qty) AS sumqty
FROM dbo.Orders;

---------------------------------------------------------------------
-- GROUPING SETS Subclause
---------------------------------------------------------------------

-- Using the GROUPING SETS subclause
SELECT empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY
  GROUPING SETS
  (
    (empid, custid),
    (empid),
    (custid),
    ()
  );

---------------------------------------------------------------------
-- CUBE Subclause
---------------------------------------------------------------------

-- Using the CUBE subclause
SELECT empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY CUBE(empid, custid);

---------------------------------------------------------------------
-- ROLLUP Subclause
---------------------------------------------------------------------

-- Using the ROLLUP subclause
SELECT 
  YEAR(orderdate) AS orderyear,
  MONTH(orderdate) AS ordermonth,
  DAY(orderdate) AS orderday,
  SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY ROLLUP(YEAR(orderdate), MONTH(orderdate), DAY(orderdate));

---------------------------------------------------------------------
-- GROUPING and GROUPING_ID Function
---------------------------------------------------------------------

SELECT empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY CUBE(empid, custid);

SELECT
  GROUPING(empid) AS grpemp,
  GROUPING(custid) AS grpcust,
  empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY CUBE(empid, custid);

SELECT
  GROUPING_ID(empid, custid) AS groupingset,
  empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY CUBE(empid, custid);