create database assignment_7;
use assignment_7;
create table ord_master(ord_no int, cust_cd varchar(5), status varchar(2));
insert into ord_master values(1,'C1','P');
select * from ord_master;
create table ord_dtl(ord_no int, prod_cd varchar(5),qty int);
insert into ord_dtl values(1,'P1',100);
insert into ord_dtl values(1,'P2',200);
select * from ord_dtl;
create table prod_master(prod_cd varchar(5),prod_name varchar(20),qty_in_stock int(10),booked_qty int(10));
insert into prod_master values ('P1','Floopies',10000,1000);
insert into prod_master values ('P2','Printers',5000,6000);
insert into prod_master values ('P3','Modems',3000,200);
select * from prod_master;
drop trigger my_trig_2;
delimiter $$
create trigger my_trig_1 before insert on ord_dtl for each row 
begin 
update prod_master set  booked_qty = booked_qty+ new.Qty where prod_cd = new.prod_cd ;
end $$

insert into ord_dtl values(1,'P1',100);

delimiter $$
create trigger my_trig_2 before delete on ord_dtl for each row 
begin
update prod_master set booked_qty = booked_qty - old.Qty where prod_cd = old.prod_cd; 
end $$
delete from ord_dtl where prod_cd='P2';
create table emp (empno int, empname varchar(20), dept_no int, sal int);
insert into emp values (1,'Viraj',1,10000);
insert into emp values (2,'Vikash',2,40000);
insert into emp values (3,'Gaurav',3,100000);
select * from emp;
select * from dept_sal;
Create table dept_sal (dept_no int, tota_salary int); 
insert into dept_sal values(1,50000);
insert into dept_sal values(2,100000);
insert into dept_sal values(3,40000);

drop trigger my_trig_3;
delimiter $$
create trigger my_trig_3 before insert on emp for each row
begin
update dept_sal set tota_salary = tota_salary + new.sal where dept_no = new.dept_no;
end $$
insert into emp values(4,'Ashwini',4,80000);
insert into emp values(5,'Heena',2,50000);
insert into emp values (6,'Baraskar',1,20000);

delimiter $$
create trigger my_trig_3a before delete on emp for each row
begin
update dept_sal set tota_salary = tota_salary - old.sal where dept_no = old.dept_no;
end $$
delete from emp where dept_no=3;
delete from emp where dept_no=1;