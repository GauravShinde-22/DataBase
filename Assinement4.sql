use myuser;
show tables;
select dept_name, emp_name from Department1, Employee1 where Department1.dept_id = Employee1.dept_id;
select * from employee1;
select * from department1;
select * from employee1, department1 where department1.dept_id = employee1.dept_id;
select dept_id,sum(salary) from employee1 group by (dept_id);
select dept_name, emp_name from department1 right outer join employee1 on department1.dept_id = employee1.dept_id;
select * from department1 right outer join employee1 on department1.dept_id = employee1.dept_id;
select * from employee1 right outer join department1 on employee1.dept_id = department1.dept_id;
select dept_name, emp_name from employee1 right outer join department1 on employee1.dept_id = department1.dept_id;
select dept_name, emp_name from department1 left outer join employee1 on department1.dept_id = employee1.dept_id;
select * from department1 left outer join employee1 on department1.dept_id = employee1.dept_id;
select dept_name, emp_name from department1 left outer join employee1 on department1.dept_id = employee1.dept_id;
select * from employee1 left outer join department1 on department1.dept_id = employee1.dept_id;
select e.emp_name 'Employee Name', m.emp_name 'Manager Name' from employee1 e
join employee1 m on e.manager = m.empid;
select emp_name, dept_name from employee1 join department1 on employee1.dept_id = department1.dept_id;
select emp_name, salary from employee1
where salary = (select salary from employee1 where emp_name = 'Arun');
select emp_name, dept_id from employee1
where dept_id = (select dept_id from employee1 where emp_name = 'Jack');
select emp_name, salary from employee1
where salary = (select min(salary) from employee1);
update employee1
set salary = 15000
where dept_id = (select dept_id from (select dept_id from employee1 where emp_name = 'Max') as a);

update employee1
set salary=5000
where dept_id in ( select dept_id from employee1 where emp_name='Max');