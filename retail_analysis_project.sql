-- SQL Retail Sales Analysis - P1
USE retail_sales_p2; 
CREATE TABLE retail_sales
	(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,	
		sale_time TIME,	
		customer_id INT,
		gender VARCHAR(15),	
		age INT,
		category VARCHAR(15),	
		quantiy INT,	
		price_per_unit FLOAT,	
		cogs FLOAT,	
		total_sale FLOAT
	);
    
    
-- Data Cleaning 
SELECT 
	COUNT(*)
FROM retail_sales

SELECT *
FROM retail_sales
WHERE
	transactions_id IS NULL
    OR sale_date IS NULL
	OR sale_time IS NULL
	OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
	OR category IS NULL
    OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL;

DELETE FROM retail_sales
WHERE
	transactions_id IS NULL
    OR sale_date IS NULL
	OR sale_time IS NULL
	OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
	OR category IS NULL
    OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL;
    
SELECT
    transactions_id,
    DATE_FORMAT(STR_TO_DATE(sale_date, '%m/%d/%Y'), '%Y-%m-%d') AS formatted_sale_date
FROM retail_sales;

-- Data Exploration 
 
-- How many sales we do we have?
SELECT COUNT(*) as total_sale
FROM retail_sales;

-- How many unique customers we do we have?
SELECT COUNT(distinct customer_id) as customer_id
FROM retail_sales;

-- how many categories do we 
SELECT DISTINCT category as ategory
FROM retail_sales;


-- Business Analysis

-- retrieve all columns from sale date 2022-1105
SELECT *
FROM retail_sales
WHERE DATE_FORMAT(STR_TO_DATE(sale_date, '%m/%d/%Y'), '%Y-%m-%d') = '2022-11-05';

-- retrieve all transaction where catgory is clothing and quantity sold is >=5  

SELECT
	category,
    SUM(quantiy)
FROM retail_sales
WHERE
	category = 'Clothing'
    AND quantiy >=4;
    
    
-- Calculate total sales from each category 

SELECT
	category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Find the average age of customer who purchased from beauty 

SELECT
	ROUND(AVG(age), 2)
FROM retail_sales
WHERE category = 'Beauty';


-- Fine all transactions where total sales > 1000

SELECT * 
FROM retail_sales 
WHERE total_sale > 1000
ORDER BY total_sale DESC;

-- Find the totla number or transactions by each gender in each category 

SELECT
	category,
    gender, 
    COUNT(*) AS total_trans 
FROM retail_sales
GROUP BY
	category,
    gender
ORDER BY category;

-- Find the top 5 costomers based on total sales 

SELECT
	customer_id, 
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Find the number of unique customers who purchased from each category 
SELECT
	category, 
    COUNT(DISTINCT(customer_id)) AS unique_cust
FROM retail_sales
GROUP BY category
ORDER BY unique_cust DESC;


-- end of project
    
    
    
    
    
    
    
    