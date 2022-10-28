show databases;
use classicmodels;
show tables;
select * from employees;
select * from orderdetails;
select * from orders;
select * from payments;
select * from customers;
select customernumber, customername, checknumber, paymentdate, amount
from payments inner join customers using (customernumber); 

select c.customernumber, c.customername, sum(amount) as total, o.ordernumber, o.status
from payments as p right join customers as c on c.customernumber = p.customernumber left join orders 
as o on o.customernumber = c.customernumber group by customername;

select c.customernumber, c.customername, sum(amount) as total 
from payments as p right join customers as c on c.customernumber = p.customernumber group by customername;

delimiter &&
create procedure top_customer()
begin
select c.customernumber, c.customername, sum(amount) as total 
from payments as p right join customers as c 
on c.customernumber = p.customernumber group by customername;
end &&
delimiter ;

call top_customer();

delimiter //
create procedure top_cus(IN var int)
Begin
select c.customernumber, c.customername, sum(amount) as total 
from payments as p right join customers as c 
on c.customernumber = p.customernumber group by customername limit var;
end //
delimiter ;

call top_cus(5);

delimiter //
create procedure update_data(IN name varchar(20), IN cus_num int)
begin
update customers set
customername = name where customernumber = cus_num;
end //
delimiter ;

call update_table("Muwafaq Ayoade", 497);
select * from customers;

delimiter //
create procedure update_table(IN name varchar(20), IN cus_num int)
begin
update customers set
customerName = name where customerNumber = cus_num;
end //
delimiter ;

delimiter //
create procedure update_table(IN name varchar(20), IN cus_num int)
begin
update customers set
customerName = name where customerNumber = cus_num;
end //
delimiter ;

create table student_records (post varchar(10), full_name 
varchar(20), gender char, exam_score int);

delimiter //
create trigger exam_score_update
before insert on student_records
for each row
if new.exam_score < 0 then set new.exam_score=50;
end if //
delimiter ;

insert into student_records values
("Senior Man", "Muwafaq Ayoade", "M", 97),
("Senior Man", "Muwafaq Ayoade", "M", 97),