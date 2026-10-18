# 🍕 Pizza Sales SQL Analysis

## 📌 Project Overview

The **Pizza Sales SQL Analysis** project focuses on analyzing pizza sales data using **MySQL** to identify sales trends, customer ordering patterns, popular pizza types, and revenue performance.

The project uses SQL queries to extract meaningful business insights from pizza sales data. It covers basic, intermediate, and advanced SQL concepts, including aggregate functions, joins, subqueries, grouping, sorting, and date-time analysis.

## 🎯 Project Objectives

- Calculate the total number of orders placed.
- Analyze total revenue generated from pizza sales.
- Identify the highest-priced pizza.
- Find the most commonly ordered pizza size.
- Identify the top 5 best-selling pizza types.
- Analyze the quantity of pizzas ordered by category.
- Understand order distribution by hour of the day.
- Calculate the percentage contribution of each pizza category to total revenue.
- Identify the top-selling pizza types based on revenue.
- Explore sales performance using SQL queries.

## 🛠️ Tools and Technologies

- **Database:** MySQL
- **SQL Editor:** MySQL Workbench
- **Language:** SQL
- **Dataset:** Pizza Sales CSV dataset
- **Version Control:** GitHub

## 📂 Dataset Description

The project uses four tables:

| Table Name | Description |
|---|---|
| `orders` | Contains order IDs, order dates, and order times |
| `order_details` | Contains order details, pizza IDs, and quantities |
| `pizzas` | Contains pizza IDs, pizza types, sizes, and prices |
| `pizza_types` | Contains pizza names, categories, and ingredients |

These tables are connected using common identifiers to analyze sales data across different dimensions.

## 🧠 SQL Concepts Used

- `SELECT` and `WHERE`
- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`, `MAX()`
- `GROUP BY` and `ORDER BY`
- `INNER JOIN`
- Subqueries
- Common Table Expressions (CTEs)
- Date and time functions
- Percentage calculations
- Ranking and sorting
- Revenue and quantity analysis

## 📊 Business Questions Solved

### Basic Analysis
1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.

### Intermediate Analysis
6. Find the total quantity of each pizza category ordered.
7. Determine the distribution of orders by hour of the day.
8. Find the category-wise distribution of pizzas.
9. Calculate the average number of pizzas ordered per day.
10. Calculate the percentage contribution of each pizza category to total revenue.

### Advanced Analysis
11. Analyze the cumulative revenue generated over time.
12. Determine the top 3 most ordered pizza types in each category.
13. Identify the top-selling pizzas based on revenue.

## 🔍 Example SQL Query

The following query calculates total revenue from pizza sales:

```sql
SELECT
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details AS od
JOIN pizzas AS p
    ON od.pizza_id = p.pizza_id;
```

**Explanation:** The query joins `order_details` with `pizzas`, multiplies the quantity of each pizza by its price, and calculates the total revenue.

*Note: This query assumes that `order_details.pizza_id` references `pizzas.pizza_id`. Verify your actual table structure before running it.*

## 📈 Key Insights

The analysis is designed to help answer questions such as:

- Which pizza types generate the highest revenue?
- Which pizza sizes are ordered most frequently?
- Which categories contribute most to total sales?
- During which hours are the most orders placed?
- Which pizzas are the most popular among customers?

Actual findings should be added here after running the SQL queries against the dataset.

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Download the pizza sales dataset in CSV format.
3. Create a database in MySQL.
4. Import the CSV files into the corresponding tables.
5. Verify the table names, column names, and relationships.
6. Open the SQL script in MySQL Workbench.
7. Execute the queries individually or in sequence.
8. Review the results and document the key business insights.

## 📁 Project Structure

```text
Pizza-Sales-SQL-Analysis/
│
├── README.md
├── pizza_sales_analysis.sql
└── dataset/
    ├── orders.csv
    ├── order_details.csv
    ├── pizzas.csv
    └── pizza_types.csv
```

*The folder structure above is a
