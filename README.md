# Amazon Sales Analytics (SQL Project)

# Project Overview
This project analyzes an Amazon-style e-commerce dataset using SQL to uncover insights related to sales performance, profitability, customer behavior, discount impact, and regional trends.

The goal is to transform raw transactional data into meaningful business insights that support decision-making.

# Dataset Description
The dataset contains order-level sales data including:

- order_id: Unique order identifier  
- product_id: Product identifier  
- product_category: Category of product  
- order_date: Purchase date  
- quantity_sold: Units sold  
- discounted_price: Selling price after discount  
- cost_price: Product cost per unit  
- total_revenue: Total order revenue  
- customer_region: Customer location  
- payment_method: Payment type  
- rating: Customer rating (1–5)

# Tools Used
- SQL (PostgreSQL / MySQL compatible)
- Analytical functions (Window functions, Aggregations, CTEs)

## 1. Data Quality Checks
- Duplicate order detection
- Revenue consistency validation

## 2. Business Performance Analysis
- Total revenue
- Total orders
- Average order value
- Units sold

## 3. Profitability Analysis
- Profit by product category
- Profit margin comparison across categories

## 4. Product Analysis
- Top-performing products
- Revenue contribution by category
- Revenue per unit analysis

## 5. Customer & Region Analysis
- Revenue by region
- Order distribution across regions

## 6. Discount Analysis
- Impact of discount on revenue and profit
- Effectiveness of discount strategy

## 7. Time-Series Analysis
- Monthly revenue trend
- Growth rate calculation using window functions

## 8. Customer Behavior
- Rating segmentation impact on revenue
- Payment method behavior analysis

# Key Insights

- Max revenue is concentrated from beauty product categories (Pareto effect)
- Certain regions contribute higher revenue and order volume
- Discounts increase sales volume but can reduce profitability
- High-rated products tend to generate higher revenue
- Monthly trends show clear fluctuations in revenue growth

##  How to Use
## 🚀 How to Run This Project

1. Import the dataset into a PostgreSQL database using SQL commands or a data import tool (e.g., COPY or pgAdmin import feature).
2. Verify the data load by checking row counts and schema structure.
3. Execute the SQL queries available in `queries.sql` using PostgreSQL.


# Conclusion
This project demonstrates how SQL can be used for end-to-end business analysis, turning raw data into actionable insights for decision-making.
