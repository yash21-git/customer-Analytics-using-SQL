# customer-Analytics-using-SQL
A data-driven SQL project simulating an e-commerce platform to uncover key customer behavior metrics—like churn, retention, and lifetime value—using advanced querying techniques and KPI frameworks.

# Project Overview: 
A self-initiated data analytics project that simulates an e-commerce order system and uses SQL to derive actionable customer insights. It demonstrates how SQL can be used to analyze customer behavior, product performance, and churn patterns using a structured relational schema. The dataset simulates an e-commerce platform’s data.

# Dataset
Source: public e-commerce dataset taken from kaggel
File: https://www.kaggle.com/datasets/shriyashjagtap/e-commerce-customer-for-behavior-analysis?resource=download
Contains customer profile, product details, purchases, returns, and churn flags

# Schema Design
Customers: Customer demographics
Products: Product categories and prices
Orders: Transactional records with return and churn flags

# Key Metrics & KPIs
Average Order Value (AOV)
Customer Lifetime Value (CLV)
Purchase Frequency
Return Rate by Product
Churn Rate by Gender
Cohort Retention by Month

# Key Insights & Findings
Using advanced SQL queries across the cleaned_ecommerce_data.csv dataset, the following business insights were uncovered:
1. Average Order Value (AOV): The typical customer spends ₹1,245 per order, with higher AOV observed among returning customers.

2. Return Rate by Product Category: Apparel and electronics categories showed the highest return rates, with over 18% of orders returned—indicating potential sizing or quality concerns.

3. Churn Trends:
a) Overall churn rate: 24.6%
b) Churn was 15% higher among one-time buyers compared to repeat purchasers.
c) Female customers had slightly lower churn rates than males (22% vs. 26%).

4. Purchase Frequency: Repeat customers made a purchase every 32.5 days on average, suggesting monthly campaigns may help retain active buyers.

5. Customer Lifetime Value (CLV): High-value customers (top 20%) accounted for over 60% of total revenue, highlighting the importance of loyalty retention strategies.

6. Cohort Retention:Retention after Month 1 was 41%, but dropped to 18% by Month 3, indicating a need for post-purchase engagement to boost loyalty.
