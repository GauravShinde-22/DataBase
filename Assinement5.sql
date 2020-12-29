use myuser;
create table Emp(
empno numeric(4) not null,
ename varchar(30) not null,
job varchar(10),
MGR numeric(4),
Hiredate date,
Sal numeric(7,2),
Deptno numeric(2));
desc Emp;
Insert into Emp(empno,ename,job,MGR,Hiredate,Sal,Deptno) values
(1000,'Manish','Salesman',1003,'2020-02-18',600,30),
(1001,'Manoj','Salesman',1003,'2018-02-18',600,30),
(1002,'Ashish','Salesman',1003,'2013-02-18',750,30),
(1004,'Rekha','Analyst',1006,'2001-02-18',3000,10),
(1005,'Sachin','Analyst',1006,'2019-02-18',3000,10),
(1006,'Pooja','Manager',null,'2000-02-18',6000,10);
select * from Emp;
create table dept(
dno numeric(4) not null,
dname varchar(10) not null,
area varchar(30));

Insert into dept(dno,dname,area) values(10,'Store','Mumbai'),
(20,'Purchase','Mumbai'),
(30,'Store', 'Delhi'),
(40,'Marketing','Pune'),
(50,'Finance','Delhi'),
(60,'Accounts','Mumbai');

select * from dept;

delimiter $$
create procedure que1(in x int,in y int)
begin
select x+y as addition, x-y as substrction, x*y as multiplication, x/y as divide;
end $$

call que1(8,2);

delimiter $$
 create procedure que2(inout str varchar(10))
 begin
 set str=(select reverse(str));
 end $$
 set @str='database';
 select @str;
 call que2(@str);
 select @str as rev;
 
 
 DELIMITER $$
CREATE PROCEDURE que6(IN VAR INT)
BEGIN
SET @NUM =VAR;
SELECT @NUM, POWER(@NUM,2) AS SQUARE, POWER (@NUM,3) AS CUBIC;
END $$
CALL que6(5);

delimiter $$
CREATE PROCEDURE que7(OUT ANS INT)
BEGIN
DECLARE NUM int;
SET NUM=2;
SELECT NUM  INTO ANS ;
END $$

CALL que7(@ANS);
SELECT @ANS;


