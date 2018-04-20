.echo on
.headers on

--Name: TSQLEx8a
--Author: Nia Rosa
--Date: 28 March 2018

create table pres (
    firstname text,
	middlename text,
	lastname text,
	born text,
	died text,
	startdate text,
	enddate text,
	party text,
	homestate text);
	
.schema

.mode csv pres
.import pres .csv pres

select * from pres

delete from pres where firstname like firstname

create table presidents(
    id integer primary key autoincrement,
	firstname text,
	middlename text,
	lastname text,
	born text,
	died text,
	startdate text,
	enddate text,
	party text,
	homestate text);
	
alter table pres add column idinteger;
update pres set id = rowid;

