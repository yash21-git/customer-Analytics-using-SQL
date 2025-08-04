

-- STEP 1: Schema Simulation
-- Create normalized tables

CREATE TABLE Customers (
    customer_id TEXT PRIMARY KEY,
    customer_name TEXT,
    gender TEXT,
    age INTEGER
);

CREATE TABLE Products (
    product_category TEXT PRIMARY KEY,
    unit_price FLOAT
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id TEXT,
    product_category TEXT,
    purchase_date DATE,
    quantity INTEGER,
    total_amount FLOAT,
    payment_method TEXT,
    returned BOOLEAN,
    churned BOOLEAN,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_category) REFERENCES Products(product_category)
);

-- STEP 2: KPIs and Metrics

-- Average Order Value (AOV)
SELECT 
    customer_id,
    ROUND(SUM(total_amount)::NUMERIC / NULLIF(SUM(quantity), 0), 2) AS avg_order_value
FROM Orders
GROUP BY customer_id;

-- Customer Lifetime Value (CLV)
SELECT 
    customer_id,
    ROUND(SUM(total_amount)::NUMERIC, 2) AS clv
FROM Orders
GROUP BY customer_id;

-- Purchase Frequency
WITH purchase_counts AS (
    SELECT customer_id, COUNT(DISTINCT purchase_date) AS purchase_days
    FROM Orders
    GROUP BY customer_id
)
SELECT 
    c.customer_id, 
    ROUND(SUM(o.quantity)::NUMERIC / NULLIF(pc.purchase_days, 0), 2) AS purchase_frequency
FROM Orders o
JOIN purchase_counts pc ON o.customer_id = pc.customer_id
JOIN Customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_id, pc.purchase_days;

-- Return Rate by Product Category
SELECT 
    product_category,
    ROUND(AVG(CASE WHEN returned THEN 1 ELSE 0 END)::NUMERIC, 2) AS return_rate
FROM Orders
GROUP BY product_category;

-- Churn Rate by Gender
SELECT 
    gender,
    ROUND(AVG(CASE WHEN churned THEN 1 ELSE 0 END)::NUMERIC, 2) AS churn_rate
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY gender;

-- Cohort Retention (simplified: first purchase vs repeat)
WITH first_purchase AS (
    SELECT customer_id, MIN(purchase_date) AS cohort_date
    FROM Orders
    GROUP BY customer_id
),
cohort_data AS (
    SELECT o.customer_id, cohort_date, purchase_date,
           DATE_PART('month', AGE(purchase_date, cohort_date)) AS months_since_first
    FROM Orders o
    JOIN first_purchase f ON o.customer_id = f.customer_id
)
SELECT 
    months_since_first, COUNT(DISTINCT customer_id) AS active_customers
FROM cohort_data
GROUP BY months_since_first
ORDER BY months_since_first;
