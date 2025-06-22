# Snowflake_practice

## 🧱 What This Does
This script will:
1. Create a warehouse (if needed)
2. Create a new database and schema
3. Create practice tables with appropriate data types

4. create or replace warehouse dummywh  
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
