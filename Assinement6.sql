use myuser;
#factorin of n number;
delimiter $$
create function my_fun1(a int(5)) returns int(5)
begin
declare fact int(5) default 1;
factorial_loop:repeat
set fact=fact*a;
set a=a-1;
until a=1
end repeat;
return fact;
end $$

select my_fun1(5) as factorial;

--------------------------------------------------------------------
#number is prime or not 
delimiter $$
create function my_fun2(a int(5)) returns varchar(50)
begin
declare flag int(2) default 1;
declare i int(2) default 2;
while i<a
do
  if a%i=0 then
   set flag = 0;
  end if;
  set i=i+1;
end while;
if flag=1 then
return "Prime number";
else
return " Not Prime number";
end if;   
end $$

select my_fun2(25) as prime;

------------------------------------------------------------
#wirte a function to conver inches into yard,foot,inches format;

delimiter $$
create function my_fun(inches int(10) ) returns varchar(50)
begin
declare  yard int(10);
declare  foot int(10);
set yard = inches / 36;
set inches = inches % 36;
set foot = inches / 12;
set inches = inches % 12; 
return concat(yard,' yards ',foot,' foot ',inches,' inches ');
end $$
 #drop function my_fun;
 
select my_fun(124)as yard_foot_inches;

---------------------------------------------------------------------
#write function increment salary by 10%
delimiter $$
create function my_fun4(dept_no int(5)) returns int(5)
begin
update employee1 set sal = sal+(sal * 0.1) where deptno = dept_no;
return 1;
end $$

select my_fun4(10);
-------------------------------------------------------------------
delimiter $$
create function my_fun5(dept_no int(5)) returns int(5)
begin
update emp set Sal = Sal+(Sal * 0.1) where Deptno = dept_no;
return 1;
end $$
#drop function my_fun5;
select my_fun5(10);
select * from emp;
set  SQL_SAFE_UPDATES = 0;