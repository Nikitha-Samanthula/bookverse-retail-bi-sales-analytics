create database book_verse_db;
use book_verse_db;
create table books
( Book_ID int primary key,
Title varchar(250) not null,
Author varchar(150) not null,
Genre varchar(80),
Published_year Year,
Price decimal(10,2),
Stock int);

select * from books;

create table Customers
( Customer_ID int primary key,
Name varchar(120),
Email varchar(150) unique,
Phone varchar(20),
City varchar(100),
Country varchar(100));

select * from customers;

create table Orders
( Order_ID int primary key,
Customer_ID int,
Book_ID INT,
Order_Date date,
Quantity int,
Total_Amount decimal(10,2),
 
 constraint FK_Order_Customer
 foreign key(Customer_ID)
 REFERENCES Customers(Customer_ID),
 
 constraint FK_Order_book
 foreign key(Book_ID)
 REFERENCES Books(Book_ID));
 
 select * from orders;
 
-- Basic Analysis / Data Exploration
-- ----------------------------------
-- What is the total number of books?
select count(book_id) from books;

-- What is the total number of customers?
select count(customer_id) from customers;

-- What is the total number of orders?
select count(order_id) from orders;

-- What are the different genres available?
select distinct genre from books;

-- What are the different countries represented in the customer data?
select distinct country from customers;

-- What is the total quantity of books sold?
select sum(quantity) from orders;

-- What is the total revenue generated?
select sum(total_amount) from orders;

-- What is the average order value?
select avg(total_amount) from orders;

## Understand Sales Performance

#1. Overall Order Volume
-- What is the average number of books per order?
select avg(quantity) from orders;

-- What is the minimum and maximum order value?
select min(total_amount) as minimum,max(total_amount) as maximum from orders;

-- Which orders have a total amount greater than the average order value?
select * from orders
where total_amount>(select avg(total_amount) from orders);

#2. Total Quantity Sold
-- What is the total quantity of books sold?
select sum(quantity) from orders;

-- What is the average quantity sold per order?
select avg(quantity) from orders;

-- Which books have sold more than 25 units?
select b.book_id,sum(o.quantity) as highest_sold_units from orders as o
join books as b
on o.book_id=b.book_id
group by b.book_id
having sum(o.quantity)>25;

-- Which orders contain the highest quantity of books?
select * from orders
where quantity=(select max(quantity) from orders);

#3. Total Revenue
-- What is the average revenue per order?
select avg(Total_Amount) from orders;

-- What are the highest-value orders?
select * from orders
where Total_Amount=(select max(total_amount) from orders);

-- Which customers have generated the highest revenue?
select c.name,sum(o.total_amount) as total_revenue from customers as c
join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.name
order by total_revenue desc
limit 1;

#4. Sales by Book
-- Which book generated the highest revenue?
select * from orders;
select b.book_id,b.title,sum(o.total_amount) as highest_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by highest_revenue desc
limit 1;

-- Which book sold the highest quantity?
select b.book_id,b.title,sum(quantity) as highest_quantity from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by highest_quantity desc
limit 1;

-- Which are the top 10 books by revenue?
select b.book_id,b.title,sum(o.total_amount) as highest_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by highest_revenue desc
limit 10;

-- Which books have sold the least quantity?
select b.book_id,b.title,sum(quantity) as highest_quantity from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by highest_quantity asc
limit 1;

#5. Sales by Author
-- Which author generated the highest revenue?
select b.author,sum(o.total_amount) as highest_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.author
order by highest_revenue desc
limit 1;

-- Which author has the highest number of books sold?
select b.author,sum(o.quantity) as highest_no_books from books as b
join orders as o
on b.book_id=o.book_id
group by b.author
order by highest_no_books desc
limit 1;

#6. Sales by Genre
-- Which genre generated the highest revenue?
select b.genre,sum(o.total_amount) as highest_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.genre
order by highest_revenue desc
limit 1;

-- Which genre has the highest quantity sold?
select b.genre,sum(o.quantity) as highest_quantity from books as b
join orders as o
on b.book_id=o.book_id
group by b.genre
order by highest_quantity desc
limit 1;

#7. Monthly Sales Trends
-- What is the total revenue generated each month?
select date_format(order_date,'%y-%m'),sum(total_amount) from orders
group by date_format(order_date,'%y-%m');
 
-- Which month had the highest revenue?
select date_format(order_date,'%y-%m'),sum(total_amount) as highest_revenue from orders
group by date_format(order_date,'%y-%m')
order by highest_revenue desc
limit 1;

-- Which month had the highest number of orders?
select date_format(order_date,'%y-%m'),count(order_id) as highest_orders from orders
group by date_format(order_date,'%y-%m')
order by highest_orders desc
limit 1;

-- Which month had the highest quantity sold?
select date_format(order_date,'%y-%m'),sum(quantity) as highest_quantity from orders
group by date_format(order_date,'%y-%m')
order by highest_quantity desc
limit 1;

#8. Yearly Sales Trends
-- What is the total revenue generated each year?
select date_format(order_date,'%y'),sum(total_amount) as highest_revenue from orders
group by date_format(order_date,'%y')
order by highest_revenue desc;

-- Which year had the highest revenue?
select date_format(order_date,'%y'),sum(total_amount) as highest_revenue from orders
group by date_format(order_date,'%y')
order by highest_revenue desc
limit 1;

-- Which year had the highest number of orders?
select date_format(order_date,'%y'),count(order_id) as highest_orders from orders
group by date_format(order_date,'%y')
order by highest_orders desc
limit 1;

#9. High-Value Books
-- Which books have a total revenue greater than ₹10,000?
select b.book_id,b.title,sum(o.total_amount) as total_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
having sum(o.total_amount)>10000;

-- What are the top 10 books by total revenue?
select b.book_id,b.title,sum(total_amount) as total_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by total_revenue desc
limit 10;

-- Which authors contribute the most to high-value book sales?
select b.author,sum(o.total_amount) as total_sales from books as b
join orders as o
on b.book_id=o.book_id
group by b.author
order by total_sales desc;

#10. High-Volume Books
-- Which books have sold the highest number of units?
select b.book_id,b.title,sum(quantity) as highest_units from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by highest_units desc;

-- What are the top 10 books by quantity sold?
select b.book_id,b.title,sum(quantity) as highest_quantity from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by highest_quantity desc
limit 10;

## Understand Customer Purchasing Behaviour

-- what is the total Number of orders per customer?
select c.customer_id,c.name,count(o.order_id) from customers as c
join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.name;

-- what is the Total purchase amount for each customer?
select c.customer_id,c.name,sum(o.total_amount) from customers as c
join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.name;

-- what is the Average customer spending?
select c.customer_id,c.name,avg(o.total_amount) from customers as c
join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.name;

-- Who are the repeat customers?
select c.customer_id,c.name,count(order_id) from customers as c
join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.name
having count(order_id)>1;

-- How does customer activity vary across different countries?
select c.country,sum(quantity) as total_quantity from customers as c
join orders as o
on c.customer_id=o.customer_id
group by c.country;

-- What business patterns can be identified across different geographic locations?
select c.city,c.country,sum(total_amount) as total_revenue from customers as c
join orders as o
on c.Customer_ID=o.customer_id
group by c.city,c.country;

-- Which customers purchase products from multiple genres?
select c.customer_id,c.name,count(distinct b.genre) as multiple_genres from customers as c
join orders as o
on c.customer_id=o.customer_id
join books as b
on b.book_id=o.book_id
group by c.customer_id,c.name
having count(distinct b.genre)>1;

select * from orders;
-- How does customer purchasing behaviour change over time?
select c.customer_id,c.name,date_format(o.order_date,'%y') as year,sum(o.quantity) as total_quantity from customers as c
join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,date_format(o.order_date,'%y')
order by c.customer_id,year;

## Understand Product and Genre Performance

-- Which books have the highest quantity of sales?
select b.book_id,b.title,sum(o.quantity) as highest_sales from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by highest_sales desc;

-- Which books generate the highest revenue?
select b.book_id,b.title,sum(o.Total_Amount) as highest_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by highest_revenue desc;

-- What are the total sales for each genre?
select b.genre,sum(o.quantity) as total_sales from books as b
join orders as o
on b.book_id=o.book_id
group by b.genre
order by total_sales desc;

-- Which genres generate the highest revenue?
select b.genre,sum(o.Total_Amount) as highest_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.genre
order by highest_revenue desc;

-- Which authors have the best overall sales and revenue performance?
select b.author,sum(o.quantity),sum(o.total_amount) as highest_sales_revenue from books as b
join orders as o
on b.book_id=o.book_id
group by b.author
order by highest_sales_revenue desc;

-- Which books are priced the highest?
select book_id,title,max(price) as highest_prices from books
group by book_id,title
order by highest_prices desc;

-- Which books have the lowest sales quantities?
select b.book_id,b.title,sum(o.quantity) as lowest_sales from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by lowest_sales asc;

-- Which books have never been ordered?
select b.book_id,b.title,sum(o.quantity) as total_quantity from books as b
left join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
having total_quantity=0;

-- What is the relationship between book price and sales quantity?
select b.price,o.quantity from books as b
join orders as o
on b.book_id=o.book_id
order by quantity desc;

-- Do higher-priced books tend to have lower sales?
select b.price,o.quantity from books as b
join orders as o
on b.book_id=o.book_id
order by b.price desc;
 # answer: no

## Understand Inventory Position

-- what are the Current stock levels of each book?
select book_id,title,sum(stock) as current_stock from books
group by book_id,title
order by current_stock desc;

-- what are the Low-stock books?
select book_id,title,sum(stock) as lowest_stock from books
group by book_id,title
order by lowest_stock asc;

-- what is the highest stock available by genre?
select genre,sum(stock) as total_stock from books
group by genre
order by total_stock desc
limit 1;

-- what is the total Inventory value by genre?
select genre,sum(price*stock) as total_inventory_value from books
group by genre
order by total_inventory_value desc;

-- what is the total Inventory value by author?
select author,sum(price*stock) as total_inventory_value from books
group by author
order by total_inventory_value desc;

-- which book has the High-value inventory?
select book_id,title,max(price*stock) as high_value_inventory from books
group by book_id,title
order by high_value_inventory desc
limit 1;

-- which Books are with high stock but low sales?
select b.book_id,b.title,b.stock as high_stock,sum(o.quantity) as low_sale from books as b
left join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by high_stock desc,low_sale asc
limit 1;

-- which Books are with low stock and high sales?
select b.book_id,b.title,b.stock as low_stock,sum(o.quantity) as high_sale from books as b
left join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by low_stock asc,high_sale desc
limit 1;

## Identify Sales and Inventory Opportunities

-- which books are the High-selling books with low stock?
select b.book_id,b.title,sum(o.quantity) as total_sale,b.stock as current_stock from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by total_sale desc,current_stock asc;

-- which books are the High-stock books with low sales?
select b.book_id,b.title,sum(o.quantity) as total_sale,b.stock as current_stock from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by total_sale asc,current_stock desc;

-- which Popular genre are with limited inventory?
select genre,sum(stock) as total_inventory from books
group by genre
order by total_inventory asc
limit 1;

-- who are the High-value customers?
select c.customer_id,c.name,sum(total_amount) as high_value from customers as c
join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.name
order by high_value desc;

-- which Books are with strong demand?
select b.book_id,b.title,sum(o.quantity) as more_sale,b.stock as less_stock from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by more_sale desc,less_stock asc;

-- what are the Books that have never been ordered?
select b.book_id,b.title from books as b
left join orders as o
on b.book_id=o.book_id
where o.order_id is null;

-- who are the Customers purchasing across multiple genres?
select c.customer_id,c.name,count(b.genre) as multiple_genre,count(o.order_id) as total_orders from customers as c
join orders as o
on c.customer_id=o.customer_id
join books as b
on b.book_id=o.book_id
group by c.customer_id,c.name
having count(distinct b.genre)>1;

-- what are the Products that may require promotional attention?
select b.genre,count(o.order_id) as total_orders from books as b
join orders as o
on b.book_id=o.book_id
group by b.genre
having total_orders <50;

-- what are the products that may require replenishment?
select b.book_id,b.title,b.stock,sum(o.quantity) as total_orders from books as b
join orders as o
on b.book_id=o.book_id
group by b.book_id,b.title
order by b.stock asc, total_orders desc;

