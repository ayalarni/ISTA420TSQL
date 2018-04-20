.echo on
.headers on

--Name: chapter6.sql
--Author: Nia Rosa
--Date: March 21, 2018

--1. Create a list of every country where we have either a customer or a supplier.
select distinct country from customers
union
select distinct country from suppliers;

--2. Create a list of every city and country
--where we have either a customer or a supplier.
select city, country from customers
union


--3. Create a list of every country
--where we have both a customer and a supplier.
select city, country from customers
intersect
select city, country from suppliers
order by country, city;

--4. Create a list of every city and country 
--where we have both a customer and a supplier.
select city, country from customers
intersect
select city, country from suppliers
order by country, city;

--5. Create a list of every country 
--where we have customers but no suppliers.
select country from customers
except
select country from suppliers 
order by country;

--6. Create a list of every country 
--where we have suppliers but no customers.
select country from suppliers
except
select country from customers
order by country;

C:\Users\Eddie\Desktop\Embry-Riddle\MSSA\playpen>sqlite3.exe "nw-150810(1).db"
SQLite version 3.22.0 2018-01-22 18:45:57
Enter ".help" for usage hints.
sqlite> select distinct country from customers
   ...> union
   ...> select distinct country from suppliers;
Argentina
Australia
Austria
Belgium
Brazil
Canada
Country
Denmark
Finland
France
Germany
Ireland
Italy
Japan
Mexico
Netherlands
Norway
Poland
Portugal
Singapore
Spain
Sweden
Switzerland
UK
USA
Venezuela
sqlite> select city, country from suppliers;
London|UK
New Orleans|USA
Ann Arbor|USA
Tokyo|Japan
Oviedo|Spain
Osaka|Japan
Melbourne|Australia
Manchester|UK
Göteborg|Sweden
Sao Paulo|Brazil
Berlin|Germany
Frankfurt|Germany
Cuxhaven|Germany
Ravenna|Italy
Sandvika|Norway
Bend|USA
Stockholm|Sweden
Paris|France
Boston|USA
Singapore|Singapore
Lyngby|Denmark
Zaandam|Netherlands
Lappeenranta|Finland
Sydney|Australia
Montréal|Canada
Salerno|Italy
Montceau|France
Annecy|France
Ste-Hyacinthe|Canada
sqlite> --order by country, city;
sqlite> --3. Create a list of every country
sqlite> --where we have both a customer and a supplier.
sqlite> select city, country from customers
   ...> intersect
   ...> select city, country from suppliers
   ...> order by country, city;
Sao Paulo|Brazil
Montréal|Canada
Paris|France
Berlin|Germany
London|UK
sqlite> --5. Create a list of every country
sqlite> --where we have customers but no suppliers.
sqlite> select country from customers
   ...> except
   ...> select country from suppliers
   ...> order by country;
Argentina
Austria
Belgium
Country
Ireland
Mexico
Poland
Portugal
Switzerland
Venezuela
sqlite>
sqlite> --6. Create a list of every country
sqlite> --where we have suppliers but no customers.
sqlite> select country from suppliers
   ...> except
   ...> select country from customers
   ...> order by country;
Australia
Japan
Netherlands
Singapore
sqlite>

