.echo on
.header on

--Name: myfamily.sql
--Author: Nia Rosa
--Date: February 22, 2018

drop table if exist family;

create table family (
  id integer,
  name text,
  sex integer,
  role text,
  age integer
);

sqlite> insert into family values (1,'Eddie',1,'parent',61);
sqlite> insert into family values (2,'Nia',2,'parent',58);
sqlite> insert into family values (3,'EJ',1,'child',34);
sqlite> insert into family values (4,'Gretchen','child',33);
sqlite> insert into family values (5,'Sadie','pet',8);
sqlite> insert into family values (6,'Dexter','pet',8);
sqlite> insert into family values (7,'Chance','pet',2);

*schema family

select * from family;
select * from family where sex = 1;
select * from family where role like 'parent';
select * from family where role like 'pet';
select name from family;
select avg(age) from family;
select sum(age) from family;
