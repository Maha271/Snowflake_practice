create or replace warehouse my_window_wh
with WAREHOUSE_SIZE = 'SMALL'
AUTO_SUSPEND = 300
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE;


CREATE database mypracticedb;

create table employees(

   emp_id int,
   emp_name varchar(10),
   department varchar(2),
   salary int
);

insert into employees values (1,	'Alice','IT',90000);
insert into employees values(2,	'BOB','IT',85000);
insert into employees values(3,	'Carol','IT',83000);
insert into employees values(4,	'Dave','HR',70000);
insert into employees values(5,	'Eve','HR',68000);
insert into employees values(6,	'Frankie','HR',66000);
insert into employees values(6,	'Frankie','HR',66000);

insert into employees values(6,	'Frankie','HR',60000);
select* from employees;


//row_number()

 select emp_name, salary,
 row_number() over (order by salary desc) as row_number
 from employees;

 //rank() function 
 select emp_name,salary,
 row_number() over (order by salary desc) as row_number,
 rank() over (order by salary desc)as rank, //skip rank after ties  668
 DENSE_RANK() over (order by salary desc) as dense_rank, //Ties share rank, no skipping
 from employees;

 //avg
 select department,salary,
 avg(salary) over (partition by department) as avg_salary
 from employees;


 //lag
 select e.*,
 lag(salary) over (partition by department order by salary asc) as previous_salary
 from employees e ;

 //lead
 select e.*,
 lag(salary) over (partition by department order by salary asc) as previous_salary,
 lead(salary) over (partition by department order by salary asc )as next_salary
 from employees e;