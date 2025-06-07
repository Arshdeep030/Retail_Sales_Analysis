
# Retail Sales Data Analysis with SQL

This project involves exploratory data analysis and business insights generation using SQL on a retail sales dataset. The dataset contains transaction-level data such as sales date, customer details, product category, quantity, and total sales.

---

##  Project Structure

- **Database:** `retail_db`
- **Table:** `retail_sales`
- **Language:** MySQL
- **Dataset Columns:**  
  `transactions_id`, `sale_date`, `sale_time`, `customer_id`, `gender`, `age`, `category`, `quantity`, `price_per_unit`, `cogs`, `total_sale`


## Key Business Questions Answered

### Data Cleaning
- Count total records, unique customers, and categories
- Handle and delete records with null values

### Business Queries

| No. | Query Description |
|-----|--------------------|
| Q1  | Sales on a specific date (`2022-11-05`) |
| Q2  | Clothing category sales with quantity ≥ 4 in Nov-2022 |
| Q3  | Total sales and order count per category |
| Q4  | Average age of customers who bought from the 'Beauty' category |
| Q5  | High-value transactions (`total_sale` > 1000) |
| Q6  | Transactions grouped by gender and category |
| Q7  | **Best-selling month** (by avg sale) in each year |
| Q8  | Top 5 customers by total sales |
| Q9  | Unique customers per product category |
| Q10 | Number of orders by **shifts** (Morning, Afternoon, Evening) based on `sale_time` |


## SQL Highlights

- `GROUP BY`, `ORDER BY`, `COUNT`, `AVG`, `SUM`
- `DATE_FORMAT()` and `EXTRACT()` for date/time manipulation
- `RANK()` and `PARTITION BY` for identifying top months
- `WITH` clause (Common Table Expression) for shift-wise grouping

## How to Use

1. Clone the repository
2. Import the dataset into your MySQL environment
3. Run the SQL queries in your SQL editor or MySQL Workbench


