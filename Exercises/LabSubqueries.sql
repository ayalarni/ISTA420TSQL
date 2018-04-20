﻿.echo on
.headers on

-- Name: LabSubqueries.sql
-- Author: Nia Rosa
-- Date: March 8, 2018

-- 1
Select o.orderid, o.employeeid from orders o where o.employeeid = (
 select e.employeeid from employees e where e.firstname like 'Janet');
 10251|3
10253|3
10256|3
10266|3
10273|3
10283|3
10309|3
10321|3
10330|3
10332|3
10346|3
10352|3
10362|3
10365|3
10375|3
10381|3
10384|3
10391|3
10409|3
10410|3
10413|3
10415|3
10420|3
10429|3
10432|3
10433|3
10434|3
10436|3
10438|3
10441|3
10442|3
10444|3
10445|3
10449|3
10468|3
10479|3
10484|3
10492|3
10495|3
10505|3
10514|3
10517|3
10530|3
10536|3
10540|3
10547|3
10548|3
10568|3
10570|3
10572|3
10576|3
10581|3
10582|3
10592|3
10594|3
10619|3
10625|3
10638|3
10644|3
10662|3
10681|3
10682|3
10684|3
10693|3
10697|3
10699|3
10700|3
10712|3
10715|3
10723|3
10732|3
10739|3
10742|3
10748|3
10751|3
10753|3
10758|3
10759|3
10762|3
10763|3
10765|3
10768|3
10769|3
10772|3
10778|3
10779|3
10793|3
10796|3
10806|3
10814|3
10817|3
10820|3
10831|3
10838|3
10839|3
10854|3
10855|3
10856|3
10860|3
10879|3
10895|3
10897|3
10903|3
10904|3
10911|3
10918|3
10924|3
10925|3
10934|3
10936|3
10938|3
10947|3
10948|3
10960|3
10964|3
10974|3
10988|3
11003|3
11004|3
11006|3
11011|3
11021|3
11041|3
11049|3
11052|3
11057|3
11063|3
-- 2
Select p.productname from products p where p.categoryid in (
 select c.categoryid from categories c where c.categoryname like 'Seafood');
 Ikura
Konbu
Carnarvon Tigers
Nord-Ost Matjeshering
Inlagd Sill
Gravad lax
Boston Crab Meat
Jack's New England Clam Chowder
Rogede sild
Spegesild
Escargots de Bourgogne
Röd Kaviar

 -- 3
Select o.orderid, o.employeeid from orders o where o.employeeid in (
 select e.employeeid from employees e where e.lastname like 'D%');
 10255|9
10258|1
10263|9
10270|1
10275|1
10285|1
10292|1
10293|1
10304|1
10306|1
10311|1
10314|1
10316|1
10324|9
10325|1
10331|9
10340|1
10351|1
10357|1
10361|1
10364|1
10371|1
10374|1
10376|1
10377|1
10385|1
10386|9
10387|1
10393|1
10394|1
10396|1
10400|1
10401|1
10405|1
10411|9
10453|1
10461|1
10465|1
10469|1
10473|1
10475|9
10482|1
10486|1
10501|9
10506|9
10508|1
10524|1
10525|1
10537|1
10538|9
10542|1
10546|1
10557|9
10558|1
10562|1
10566|9
10567|1
10577|9
10579|1
10586|9
10587|1
10591|1
10598|1
10604|1
10605|1
10612|1
10616|1
10618|1
10626|1
10630|1
10646|9
10653|1
10655|1
10664|1
10665|1
10668|1
10671|1
10672|9
10677|1
10680|1
10687|9
10689|1
10690|1
10705|9
10709|1
10710|1
10713|1
10717|1
10718|1
10733|1
10736|9
10743|1
10745|9
10746|1
10750|9
10771|9
10773|1
10776|1
10782|9
10785|1
10788|1
10789|1
10792|1
10799|9
10800|1
10813|1
10821|1
10825|1
10827|1
10828|9
10829|9
10834|1
10835|1
10837|9
10842|1
10849|9
10850|1
10853|9
10859|1
10871|9
10877|1
10886|1
10888|1
10889|9
10893|9
10894|1
10900|1
10902|1
10905|9
10909|1
10910|1
10916|1
10921|1
10928|1
10942|9
10946|1
10950|1
10951|9
10952|1
10953|9
10963|9
10968|1
10969|1
10970|9
10975|1
10976|1
10978|9
10981|1
10984|1
10991|1
10992|1
10995|1
11012|1
11016|9
11017|9
11022|9
11023|1
11027|1
11038|1
11039|1
11058|9
11064|1
11067|1
11069|1
11071|1
11077|1

-- 4
Select p.productname, p.supplierid from products p where p.supplierid in (
   ...>  select s.supplierid from suppliers s where s.companyname in ('Exotic Liquids', "Grandma Kelly's Homestead", 'Tokyo Traders'));
Chai|1
Chang|1
Aniseed Syrup|1
Grandma's Boysenberry Spread|3
Uncle Bob's Organic Dried Pears|3
Northwoods Cranberry Sauce|3
Mishi Kobe Niku|4
Ikura|4
Longlife Tofu|4

-- 5
Select p.productid, p.productname from products p where p.supplierid in (
   ...>  select s.supplierid from suppliers s where s.country in ('Australia', 'Singapore', 'Japan'));

9|Mishi Kobe Niku
10|Ikura
13|Konbu
14|Tofu
15|Genen Shouyu
16|Pavlova
17|Alice Mutton
18|Carnarvon Tigers
42|Singaporean Hokkien Fried Mee
43|Ipoh Coffee
44|Gula Malacca
51|Manjimup Dried Apples
52|Filo Mix
53|Perth Pasties
63|Vegie-spread
70|Outback Lager
74|Longlife Tofu

-- 7

Select distinct o.orderdate, o.employeeid from orders o where o.orderdate = (
 select max(o1.orderdate) from orders o1 where o1.employeeid = o.employeeid)
 order by o.employeeid;
 selectelect distinct o.orderdate, o.employeeid from orders o where o.orderdate = (
 select max(o1.orderdate) from orders o1 where o1.employeeid = o.employeeid)
 order by o.employeeid;
1998-05-06|1
1998-05-05|2
1998-04-30|3
1998-05-06|4
1998-04-22|5
1998-04-23|6
1998-05-06|7
1998-05-06|8
1998-04-29|9
