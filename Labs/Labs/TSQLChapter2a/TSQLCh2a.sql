C:\Users\Eddie>cd desktop

C:\Users\Eddie\Desktop>cd playpen

C:\Users\Eddie\Desktop>cd playpen>sqlite3 nw-150810.db
SQlite version 3.22.0 2018-01-22
Enter ".help" for usage hints.
sqlite> .tables


sqlite> .schema region
CREATE TABLE region (
   RegionID integer,
   RegionDescription text NOT NULL,
   PRIMARY KEY (RegionID)
);
sqlite> select * from region;
sqlite> select regiondescription from region;
sqlite> .schema territories
CREATE TABLE territories (
   TerritoryID text,
   TerritoryDescription text NOT NULL,
   RegionID integer,
   PRIMARY KEY (TerritoryID),
   FOREIGN KEY (RegionID) REFERENCES region (RegionID)
);
sqlite>
sqlite> select * from territories;

sqlite> select TerritoryDescription from territories; 

sqlite> select thomas.territorydescription, thomas.regionid from territories.thomas;
sqlite> select contactname, city, phone, country from customers where country like 'USA';
sqlite> select productid, productname, unitsinstock from products;
sqlite> select count(*) from products; 
sqlite> select count(*) from customers;






