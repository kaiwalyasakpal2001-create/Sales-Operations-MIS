# Sales & Operations MIS Reporting Project

## Project Overview
This project uses MySQL to analyze sales and operations data for the period April 2025 to March 2026. The objective is to evaluate revenue, profitability, monthly performance, sales target achievement, and customer, product, and regional performance.

## Database Structure
The database is named `sales` and contains four tables:

- `customers` — 80 customer records
- `products` — 40 product records
- `orders` — 1,000 sales transaction records
- `target` — 12 monthly sales target records

## Tools Used
- MySQL
- MySQL Workbench
- GitHub

## Analysis Areas
- Database and table structure exploration
- Sales, cost, profit, and profit margin analysis
- Monthly sales and profit trends
- Monthly sales target achievement
- Region-wise and state-wise performance
- Customer performance
- Product, category, and subcategory analysis
- Table relationships using SQL JOINs

## Files in This Repository

**`sales_database.sql`**  
Database export containing the table structures and data needed to recreate the project database.

**`Sales_Operations_MIS.sql`**  
SQL script containing queries for data exploration and business analysis.

## How to Run the Project

1. Download both SQL files from this repository.
2. Open MySQL Workbench and connect to a MySQL Server.
3. Use **Server → Data Import** to restore `sales_database.sql`.
4. After restoring the database, open `Sales_Operations_MIS.sql` using **File → Open SQL Script**.
5. Execute the analysis queries and review the results.

## Project Purpose
This is a portfolio project demonstrating practical SQL skills for MIS Reporting and Junior Data Analyst roles.
