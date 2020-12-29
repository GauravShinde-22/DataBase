use myuser;
create table Publishers(
pubID int(3) primary key,
pname varchar(30),
email varchar(50) unique,
phone varchar(30)
);
desc Publishers;

create table Subjects(
subID varchar(5)primary key,
sName varchar(30)
);
desc Subjects;

create table Authors(
audID int(5) primary key,
aName varchar(30),
email varchar(50) unique,
phone varchar(30)
);
desc Authors;

create table Titles(
titleID int(5) primary key,
title varchar(30),
pubID int(3),
subID varchar(5),
pubDate date,
cover char(1) check(cover in('P', 'H', 'h', 'p')),
price numeric(4),
Constraint fk_Titles foreign key(pubID) references Publishers(pubID),
constraint fk_Subjects foreign key(subID) references Subjects(subID)
);
desc Titles;

create table TitleAuthors(
titleID int(5),
audID int(5),
importance numeric(2),
#primary key(titleID,audID)
constraint fk_Titles1 foreign key(titleID) references Titles(titleID),
constraint fk_Authors1 foreign key(audID) references Authors(audID)
);
desc TitleAuthors;
drop table TitleAuthors;

create table Subjects_Backup as select * from Subjects;
desc Subjects_Backup;
alter table Subjects_Backup add primary key(subID);
insert into Subjects values
('ORA', 'ORACLE DATABASE 10g'),
('JAVA', 'JAVA LANGUAGE'),
('JEE', 'JAVA ENTERPRISE EDITION'),
('VB', 'VISUAL BASIC.NET'),
('ASP','ASP.NET');
select * from Subjects;
insert into Publishers values
(1,'WILLEY','WDT@VSNL.NET','91-11-23260877'),
(2,'WROX','INFO@WROX.COM',null),
(3,'TATA MCGRAW-HILL','FEEDBACK@TATAMCGRAWHILL.COM','91-11-33333322'),
(4,'ECHMEDIA','BOOKS@TECHMEDIA.COM','91-11-33333322');
select * from Publishers;
insert into Authors values
(101,'HERBERT SCHILD',"HERBERT@YAHOO.COM",null),
(102,'JAMES GOODWILL','GOODWILL@HOTMAIL.COM',null),
(103,'DAVAID HUNTER',"HUNTER@HOTMAIL.COM",null),
(104,'STEPHEN WALTHER','WALTHER@GMAIL.COM',null),
(105,'KEVIN LONEY','LONEY@ORACLE.COM',null),
(106,'ED.ROMANS','ROMANS@THESERVERSIDE.COM',null);
select * from Authors;

insert into Titles values(1001,'ASP.NET UNLEASHED',4,'ASP','2002-04-12','P',540),
(1002,'ORACLE10G COMP. REF.',3,'ORA','2005-05-01','P',575),
(1003,'MASTERING EJB',1,'JEE','2005-02-03','P',475),
(1004,'JAVA COMP. REF',3,'JAVA','2005-04-03','P',499),
(1005,'PRO. VB.NET',2,'VB','2005-06-15','P',450);
select * from Titles;
select * from TitleAuthors;
insert into TitleAuthors values
(1001,104,1),
(1002,105,1),
(1003,106,1),
(1004,101,1),
(1005,103,1),
(1005,102,2);
select * from Authors
order by aname;
select * from Publishers
order by pname desc;

select sName from Subjects where sName like 'Oracle%';
select sName from Subjects where sName like 'j%';
select sName from Subjects where sName like '%.net';
select aName from Authors where aName like '%er';
select pName from Publishers where pName like '%hill%';

select title from Titles where price<500;
#select title from Titles where pubDate < '2005-04-03';
select sName from Subjects where subID = 'Java' or subID ='jee';
select aName from Authors where audID > 103;
select * from Titles where price > 500 or titleID = 1001;

select * from Publishers where pName in ('ECHMEDIA', 'WROX');
#select sum(titleID+audID) from TitleAuthors;

select max(price) from Titles;
select avg(importance) from TitleAuthors;
#select sum(price),avg(price) from Titles;
select count(*) from Authors;
select sum(price) from Titles;

select title from Titles where extract(month from pubDate)=04;
select title from Titles where month(pubDate)=04;

create table employee2(
emp_id numeric(5),
emp_name char(50));
insert into employee2 values(1,'Gaurav'),(2,'Pavan');
alter table employee2 add(dept_id int(3));
alter table employee2 modify emp_name varchar(50);
rename table employee2 to Scott;
truncate table Scott;
select * from employee2;

