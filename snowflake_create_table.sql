create or replace warehouse dummywh  
with WAREHOUSE_SIZE  = 'SMALL'
AUTO_SUSPEND = 600
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = FALSE;

create or replace database mydb;

create schema my_schema;

CREATE table store
(
    product_id int primary key ,
    product_name varchar,
    product_price int,
    created_at TIMESTAMP
);

drop table store;
create table store 
(
  product_id int primary key,
  product_name varchar(100),
  product_price int,
  created_at timestamp
  
)

#insert sample data

insert into store (product_id,product_name,product_price,created_at)
values 
(1,'LAPTOP',1200,CURRENT_TIMESTAMP),
(2,'MOUSE',1400,CURRENT_TIMESTAMP),
(3,'KEYBOARD',700,CURRENT_TIMESTAMP);


select* from store;



INSERT INTO store (product_id, product_name, product_price, created_at)
VALUES
  (1, 'Bluetooth Speaker', 2999, CURRENT_TIMESTAMP),
  (2, 'Smart Watch', 4999, CURRENT_TIMESTAMP),
  (3, 'USB-C Charger', 999, CURRENT_TIMESTAMP);

select* from store;


truncate table store;
select * from store;

INSERT INTO store (product_id, product_name, product_price, created_at)
VALUES
  (1, 'Bluetooth Speaker', 2999, CURRENT_TIMESTAMP),
  (2, 'Smart Watch', 4999, CURRENT_TIMESTAMP),
  (3, 'USB-C Charger', 999, CURRENT_TIMESTAMP);


  update store
  set product_price = 1500
  where product_id = 1

 

  update store
  set product_name = 'Laptop'
  where product_id =2; 



  delete from store
  where product_id = 3;

select * from store
order by product_id desc;


select count(*) ali new_product_price from store;
select * from store;


INSERT INTO store (product_id, product_name, product_price, created_at)
VALUES
  (4, 'TV', 2999, CURRENT_TIMESTAMP),
  (5, 'Headphone', 4999, CURRENT_TIMESTAMP),
  (6, 'earphone', 999, CURRENT_TIMESTAMP);


  select count(product_price) 
  from store;

SELECT sum(product_price) AS Number_records
FROM store;

select * from store;

select * from store
where product_price between 100 and 1000;

select count(product_name) from store;

update store
set product_id = 3
where product_name ='TV';

update store
set product_id = 4
where product_name = 'Headphone'

update store
set product_id = 5
where product_name = 'earphone'


SELECT * FROM STORE
WHERE PRODUCT_NAME LIKE 'e%';


ALTER TABLE STORE
ADD COLUMN PDT_QTY INT ;

ALTER TABLE STORE
ADD COLUMN MANUFACTURER VARCHAR;

ALTER TABLE STORE
DROP COLUMN PDT_QTY;


CREATE OR REPLACE TABLE store_sales (
  sale_id INT,
  product_id INT,
  quantity_sold INT,
  sale_date DATE
);

select * from store_sales;


INSERT INTO store_sales (sale_id, product_id, quantity_sold, sale_date)
VALUES
  (101, 1, 10, '2024-05-01'),
  (102, 2, 5, '2024-05-03'),
  (103, 1, 15, '2024-06-01'),
  (104, 4, 8, '2024-06-05');  


  select* from store_sales;


SELECT
  s.product_name,
  ss.product_id,
  ss.quantity_sold,
  ss.sale_date
FROM store s
RIGHT JOIN store_sales ss
  ON s.product_id = ss.product_id;


select product_price,quantity_sold,sale_date,sale_id
from store
full join store_sales
ON store.product_id = store_sales.product_id;
