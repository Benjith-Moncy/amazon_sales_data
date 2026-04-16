
--Data Validation & Quality Checks
SELECT order_id, COUNT(*)
FROM data_amazon
GROUP BY order_id
HAVING COUNT(*) >1;

--Revenue Validation
SELECT *
FROM data_amazon
WHERE ABS(total_revenue - discounted_price * quantity_sold) > 0.01;

--Overall Performance Overview
SELECT COUNT(DISTINCT order_id) AS Total_orders,
       SUM(total_revenue) AS Total_revenue,
	   SUM(quantity_sold) AS total_units_sold,
	   ROUND(AVG(total_revenue), 2) AS avg_order_value
FROM data_amazon;

--Profit & Margin Analysis
SELECT product_category,
 SUM(total_revenue) AS revenue,
 SUM(cost_price * quantity_sold) AS cost,
 SUM(total_revenue) - SUM(cost_price * quantity_sold) AS profit,
 ROUND(100.0 * SUM(total_revenue - cost_price * quantity_sold)/
 NULLIF(SUM(total_revenue), 0), 2) AS profit_margin
 FROM data_amazon
 GROUP BY product_category
 ORDER BY profit DESC;

--Product Category Contribution
SELECT product_category,
 SUM(total_revenue) AS revenue,
 ROUND(100.0 * SUM(total_revenue) / SUM(SUM(total_revenue)) OVER(), 2) AS contribution_pct
FROM data_amazon
GROUP BY product_category
ORDER BY contribution_pct;

--Top Products (Revenue Concentration)
SELECT product_id,
 SUM(total_revenue) AS revenue,
 RANK() OVER(
ORDER BY SUM(total_revenue) DESC) AS rank
FROM data_amazon
GROUP BY product_id;

--Regional Analysis
SELECT customer_region,
 COUNT(DISTINCT order_id) AS total_orders,
 SUM(total_revenue) AS revenue,
 ROUND(AVG(total_revenue), 2) AS avg_order_value
FROM data_amazon
GROUP BY customer_region
ORDER BY revenue DESC;

--Discount Effectiveness
SELECT discount_percent, 
 SUM(quantity_sold) AS total_units, 
 SUM(total_revenue) AS revenue, 
 SUM(total_revenue - cost_price * quantity_sold) AS profit
FROM data_amazon
GROUP BY discount_percent 
ORDER BY discount_percent DESC;
   
--Time-Series Growth Analysis
WITH monthly_sales AS (
  SELECT DATE_TRUNC('month', order_date) AS month,
         SUM(total_revenue) AS revenue
  FROM data_amazon
  GROUP BY 1
),
growth AS (
  SELECT *,
         LAG(revenue) OVER (ORDER BY month) AS prev_month
  FROM monthly_sales
)
SELECT *,
       ROUND((revenue - prev_month) * 100.0 / prev_month, 2) AS growth_pct
FROM growth;

--Rating Impact
 SELECT 
  CASE
  WHEN rating >= 4 THEN 'High Rating' 
  WHEN rating >= 3 THEN 'Medium Rating' 
  ELSE 'Low Rating' 
  END AS rating_segment, 
  COUNT(*) AS orders, 
  SUM(total_revenue) AS revenue 
 FROM data_amazon
 GROUP BY rating_segment;

 --payment method behaviour
 SELECT payment_method, 
  COUNT(*) AS orders, 
  SUM(total_revenue) AS revenue, 
  AVG(total_revenue) AS avg_order_value 
 FROM data_amazon
 GROUP BY payment_method;

--Revenue efficiency
SELECT product_category, 
 SUM(total_revenue) / SUM(quantity_sold) AS revenue_per_unit 
FROM data_amazon
GROUP BY product_category 
ORDER BY revenue_per_unit DESC;