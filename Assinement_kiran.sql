#Assinement by kiran mam challange;
use myuser;
create table SUPERHERO(
id int(10) primary key,
s_names varchar(20),
Latitude numeric(10,2),
Longitude numeric(10,2));
#drop table SUPERHERO;
desc SUPERHERO1;
insert into SUPERHERO(id,s_names,Latitude,Longitude) values
(1,'Batman',50.0,85.0),
(2,'Spiderman',65.0,65.0),
(3,'Thor',45.0, 30.0),
(4,'Deadpool',25.0,69.0),
(5,'Hulk',30.0,20.0),
(6,'Captain America',70.0,75.0),
(7,'Superman',85.0,45.0);

select * from SUPERHERO;

select s_names from SUPERHERO where char_length(s_names)<7; 

create table SUPERHERO1(
id int(10) primary key,
s_names varchar(20),
Latitude numeric(10,2),
Longitude numeric(10,2));
#drop table SUPERHERO;
desc SUPERHERO1;
insert into SUPERHERO1(id,s_names,Latitude,Longitude) values
(1,'Batman',50.0,85.0),
(2,'Spiderman',65.0,65.0),
(3,'Thor',45.0, 30.0),
(4,'Iron Man',85.34,80.98),
(5,'Deadpool',25.0,69.0),
(6, 'Hulk',30.0,20.0),
(7,'Doctor Strange',40.45,40.56),
(8,'Captain America',70.00,75.32),
(9,'Avengers',81.32,90.84),
(10,'Superman',85.32,45.78);

select * from SUPERHERO1;
select id from SUPERHERO1 where (Latitude<=50.00 and Longitude<=50.00);
-----------------------------------------------------------------------------
#using procedure
delimiter $$
create procedure call1()
begin
select id from SUPERHERO1 where (Latitude<=50.00 and Longitude<=50.00);
select s_names from SUPERHERO where char_length(s_names)<7;  
end $$

call call1();

