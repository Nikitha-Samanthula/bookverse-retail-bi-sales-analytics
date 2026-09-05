## Project Overview

The BookVerse Retail Business Intelligence & Sales Analytics System is a MySQL-based database and analytics project developed to manage and analyse bookstore retail operations data.

The project was created to understand how a relational database can be used to organize information about books, genres, customers, orders, sales, and inventory. Using SQL queries, the data was analysed to identify meaningful patterns related to sales performance, customer purchasing behaviour, product demand, revenue trends, and inventory availability.

The main focus of this project was not only to store and manage the data, but also to transform transactional data into meaningful business insights that can support better decision-making. The analysis helps BookVerse Retail understand which books and genres perform best, identify customer purchasing patterns, evaluate sales trends, monitor product demand, and improve inventory planning.

Overall, this project demonstrates an end-to-end approach to relational database design, SQL-based data analysis, and business intelligence, with the goal of helping BookVerse Retail make data-driven decisions and improve overall business performance.

## Project Objectives
**The main objectives of this project were:**

To design and implement a structured relational database using MySQL.
To create relationships between the three core BookVerse retail tables.
To maintain data consistency using primary keys and foreign keys.
To analyse sales performance and revenue trends.
To understand customer purchasing behaviour.
To identify best-selling books and popular genres.
To analyse product demand and sales patterns.
To evaluate inventory availability and identify potential stock issues.
To analyse order quantities, sales volume, and total revenue.
To identify business challenges such as low-selling products and limited stock availability.
To use SQL queries to transform raw retail data into meaningful business insights.
To generate actionable insights that support sales, customer, and inventory-related decisions.


## Database Structure

**The database consists of three main tables:**

Books – Contains Book ID, Title, Author, Genre, Published Year, Price, and Stock.

Customers – Contains Customer ID, Name, Email, Phone, City, and Country.

Sales – Contains Order ID, Customer ID, Book ID, Order Date, Quantity, and Total Amount.

These tables are connected through primary and foreign key relationships, allowing information to be analysed across different areas of the BookVerse retail business. The relationships enable analysis of customer purchases, book sales, order quantities, revenue, product demand, and inventory availability.

# 📚 Analysis Performed

## Sales Performance Analysis

We analyzed BookVerse sales performance to understand overall revenue generation, order activity, and product demand.

The analysis was performed based on:

* Book
* Author
* Genre
* Order quantity
* Total order amount
* Order date
* Monthly sales
* Yearly sales

This helped identify which books, authors, and genres contribute the most to BookVerse revenue and sales volume.

Key areas analyzed included:

* Total number of orders
* Total quantity of books sold
* Total revenue generated
* Sales performance by book
* Sales performance by author
* Revenue by genre
* Monthly and yearly sales trends
* High-value and high-volume books

## Customer Behavior Analysis

We examined customer purchasing behavior to understand customer activity and identify valuable and repeat customers.

The analysis focused on:

* Number of orders per customer
* Total purchase amount
* Average customer spending
* Repeat customers
* Customer activity by country
* Purchasing behavior across different locations
* Customers purchasing books from multiple genres
* Customer purchasing patterns over time

This helped identify highly active customers, high-value customers, repeat purchasers, and differences in purchasing behavior across geographic locations.

## Product and Genre Performance Analysis

BookVerse products were analyzed to understand how individual books, authors, and genres perform in the marketplace.

The analysis included:

* Books with the highest quantity sold
* Books generating the highest revenue
* Genre-wise sales
* Genre-wise revenue
* Author-wise performance
* High-priced books
* Books with low sales
* Books that have never been ordered
* Relationship between book price and sales

These analyses helped identify popular products, high-performing genres, underperforming books, and products that may require additional promotional attention.

## Inventory Analysis

We analyzed the current inventory position to identify books that may require attention before the next procurement cycle.

The analysis was performed using:

* Current stock levels
* Stock by genre
* Inventory value by genre
* Inventory value by author
* High-value inventory
* Low-stock books
* Books with high stock but low sales
* Books with low stock and high sales
* Books that have never been ordered

This helped identify potential **stock-out risks**, excess inventory, and books that may require replenishment or promotional activities.

## Sales and Inventory Opportunity Analysis

One important part of the project was identifying business opportunities by combining sales, customer, product, and inventory information.

We analyzed:

* High-selling books with low stock
* High-stock books with low sales
* Popular genres with limited inventory
* High-value customers
* Books with strong demand
* Books that have never been ordered
* Customers purchasing across multiple genres
* Products that may require promotional attention
* Products that may require replenishment

This analysis helped identify opportunities to improve inventory planning, increase sales, target valuable customers, and optimize product promotions.

## Database and Data Analysis

The BookVerse project involved building and analyzing a relational MySQL database consisting of three major areas:

* **Books**
* **Customers**
* **Orders**

The database was designed using primary keys, foreign keys, and relationships between the tables. The `Orders` table connects customers and books through `Customer_ID` and `Book_ID`.

Before performing business analysis, the imported data was validated by checking:

* Number of records
* Column data types
* Missing values
* Duplicate records
* Primary key uniqueness
* Foreign key consistency
* Dataset consistency

## SQL Concepts Used

During the BookVerse project, we worked with several SQL concepts, including:

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Data types
* Constraints
* `SELECT`
* `WHERE`
* `JOIN`
* `GROUP BY`
* `ORDER BY`
* `COUNT()`
* `SUM()`
* `AVG()`
* Aggregate functions
* Filtering and sorting
* Date-based analysis
* Multi-table relational analysis

These SQL concepts were used to explore the database, answer business questions, identify trends, and generate actionable insights.

## Business Insights and Recommendations

The final stage of the analysis focused on converting SQL results into meaningful business insights.

The analysis supported recommendations related to:

* Inventory replenishment
* Products requiring promotional attention
* High-demand books
* Low-performing products
* Valuable customers
* Popular genres
* Stock optimization
* Sales opportunities

The project ultimately connects **data exploration, SQL analysis, business insights, and Power BI dashboard development** to support better decision-making at BookVerse.

