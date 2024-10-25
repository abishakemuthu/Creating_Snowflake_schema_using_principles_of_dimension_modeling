create database ER_Modelling;
use er_modelling;

create database dimension;
use dimension;

create table brand_dim
select * from er_modelling.brands;

alter table brand_dim modify brand_id int primary key;

create table category_dim(category_id int primary key, category_name text)
select * from er_modelling.categories;

create table product_dim
(product_id int primary key,
product_name text,
brand_id int,
category_id int,
model_year int,
foreign key (brand_id) references brand_dim(brand_id),
foreign key (category_id) references category_dim(category_id));

insert into product_dim
select p.product_id, p.product_name, b.brand_id, c.category_id, p.model_year
from er_modelling.products p join er_modelling.brands b on p.brand_id=b.brand_id
join er_modelling.categories c on p.category_id=c.category_id;

create table orders_dim(
order_id int primary key,
order_status int,
order_date text,
required_date text,
shipped_date text)
select order_id, order_status, order_date, required_date, shipped_date from er_modelling.orders;

create table customers_dim
select * from er_modelling.customers;

alter table customers_dim modify customer_id int primary key;

create table order_items_fact(
order_id int,
product_id int,
customer_id int,
quantity int,
list_price double,
discount double,
foreign key (customer_id) references customers_dim(customer_id),
foreign key (product_id) references product_dim(product_id),
foreign key (order_id) references orders_dim(order_id));

insert into order_items_fact
select oi.order_id, p.product_id, c.customer_id, oi.quantity, oi.list_price, oi.discount
from er_modelling.order_items oi join er_modelling.orders o on oi.order_id=o.order_id
join er_modelling.customers c on c.customer_id=o.customer_id
join er_modelling.products p on p.product_id=oi.product_id;

-- Outcome: Snowflake Diagram