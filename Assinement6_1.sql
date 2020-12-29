create database assignment_6;
use assignment_6;
delimiter $$
create function my_fun_1(a int(10)) returns int(10)
begin
declare factorial int(10) default 1; 
test_loop:repeat 
set factorial=factorial * a;
set a= a-1;
until a=1
end repeat;
return factorial;
end $$

select my_fun_1(5);
drop function my_fun_2;
delimiter $$
create function my_fun_2(n int(5)) returns varchar(25)
begin
declare flag int(2) default 1;
declare  i int(2) default 2;
while i<n
do
	if n % i = 0 then
		set flag = 0;
	end if;
    set i=i+1;
    end while;
if flag =1 then 
return "prime number";
else
return "not a prime number";
end if;
end $$
select my_fun_2(4);

delimiter $$
create function my_fun(inches int(10) ) returns varchar(50)
begin
declare  yard int(10);
declare  foot int(10);
set yard = inches / 36;
set inches = inches % 36;
set foot = inches / 12;
set inches = inches % 12; 
return concat(yard,'yards',foot,'foot',inches,'inches');
end $$
 #drop function my_fun4;
select my_fun(124);
 
 create table emp(empno numeric(4) not null, ename varchar(30) not null, Job varchar(10), mgr numeric(4), hiredate date,
sal numeric(7,2), deptno numeric(2) );

insert into emp(empno,ename,job,mgr,hiredate,sal,deptno) values (1000,'Manish','Salesman',1003,'2020-02-18',600,30);
empinsert into emp(empno,ename,job,mgr,hiredate,sal,deptno) values (1001,'Manoj','Salesman','1003','2018-02-18',600,30);
insert into emp(empno,ename,job,mgr,hiredate,sal,deptno) values (1002,'Ashish','Salesman','1003','2013-02-18',750,30);
insert into emp(empno,ename,job,mgr,hiredate,sal,deptno) values (1003,'Rekha','Analyst','1006','2001-02-18',3000,10);
update emp set empno=1004 where ename='Rekha';
insert into emp(empno,ename,job,mgr,hiredate,sal,deptno) values (1005,'Sachin','Analyst','1006','2019-02-18',3000,10);
insert into emp(empno,ename,job,mgr,hiredate,sal,deptno) values (1006,'Pooja','Manager',null,'2000-02-18',6000,10);
select  * from emp;
create table dept(dno numeric(4) not null, dname varchar(10) not null, area varchar(30));
insert into dept (dno,dname,area) values (10,'Store','Mumbai');
insert into dept (dno,dname,area) values (20,'Purchase','Mumbai');
insert into dept (dno,dname,area) values (30,'Store','Delhi');
insert into dept (dno,dname,area) values (40,'Marketing','Pune');
insert into dept (dno,dname,area) values (50,'Finance','Delhi');
insert into dept (dno,dname,area) values (60,'Accounts','Mumbai');
select * from dept;
select * from assignment_5.emp;
drop function my_fun4;
delimiter $$
create function my_fun4(dept_no int(5)) returns int(5)
begin
update emp set sal = sal+(sal * 0.1) where deptno = dept_no;
return 1;
end $$

select my_fun4(10);
drop function user_annual_comp;

select * from emp;
delimiter $$

create function user_annual_comp(p_eno int , p_comp int) returns int

begin
declare  annual_comp int ;
declare sal1 int;
set sal1=(select sal  from emp where empno=p_eno);
set annual_comp = (sal1+p_comp)*12;
return annual_comp;
end $$

select * from emp;
select user_annual_comp(1000,100);
drop procedure USER_QUERY_EMP;
delimiter $$
create procedure USER_QUERY_EMP(in p_myeno int, out p_myjob varchar(20), out p_mysal int)
begin
declare var int;
set var = (select empno from emp where empno=p_myeno) ;
if p_myeno=var then
select sal,job into p_mysal,p_myjob from emp where empno = p_myeno;
else
select "Empid does not exist";
end if;
end $$

call USER_QUERY_EMP(1,@x,@y);
select @x,@y;