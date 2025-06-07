CREATE DATABASE retail_db;
USE retail_db;

-- Determine the total number of records in the dataset.
SELECT COUNT(*) FROM retail_sales;

-- Determine the total number of records in the dataset.
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Identify all unique product categories in the dataset.
SELECT COUNT(DISTINCT category) FROM retail_sales;

-- Check for any null values in the dataset and delete records with missing data.
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
    
-- Data Analysis & Business Key Problems & Answers

-- Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
select * from retail_sales
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select transactions_id from retail_sales
where category = 'Clothing' and DATE_FORMAT(sale_date, '%Y-%m') = '2022-11' and quantity >=4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category, SUM(total_sale) as net_sale, COUNT(*) as total_orders from retail_sales
GROUP BY 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age),2) as avg_age from retail_sales
where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales 
where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select  category, gender, COUNT(*) as total_trans from retail_sales
GROUP BY category, gender
ORDER BY 1;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select year, month, avg_sale
from (
    select
        EXTRACT(YEAR from  sale_date) AS year,
        EXTRACT(MONTH from  sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (PARTITION BY EXTRACT(YEAR from  sale_date) 
                     ORDER BY AVG(total_sale) DESC) AS sale_rank
    from retail_sales
    group by year, month
) AS ranked_sales
where sale_rank = 1;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select
    customer_id,
    SUM(total_sale) as total_sales
from retail_sales
group by 1
order by 2 DESC
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
from retail_sales
group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift

-- End of project