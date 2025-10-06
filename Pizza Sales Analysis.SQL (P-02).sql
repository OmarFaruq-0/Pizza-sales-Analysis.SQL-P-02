USE pizza_sales;
SELECT * FROM pizza_sales;
  
  
                                                            -- KPI--
-- Total Revenue
-- Avarage order values
-- Total Pizza Sold
-- Total orders
-- Avarage Pizzas per order
-- The Daily sales trand
-- The hourly sales trand
                                                           
                                                           -- Total Revenue--
SELECT SUM(total_price) AS Total_Revenue FROM  pizza_sales;                                                       
                                                            
                                                            -- Avarage order Values--
SELECT  SUM(total_price)  / sum(distinct order_id) AS Avarage_order_values  FROM pizza_sales;
                                                            
														    -- Total Pizza Sold--
SElect sum(quantity) AS Total_Pizza_Sold from pizza_sales;                                                            

															-- Avarage Pizzas per order--
SElect SUM(quantity) / sum(DISTINCT order_id) as avarage_pizza_per_order from pizza_sales;

															-- The Daily sales trend--
DESCRIBE pizza_sales;
 
 -- Disabled SAFE UPDATES MOD
 set SQL_SAFE_UPDATES = 0;
  
-- Change data type 
Update pizza_sales
set order_date = String_to_date( order_date, '%d-%M-%Y')
where order_date is not null;

-- Enabled the Safe Update Mood
SET SQL_SAFE_UPDATES = 1;

-- The Daily Sales Trend
SELECT DAYNAME(order_date), COUNT(DISTINCT order_id) FROM pizza_sales
GROUP BY dayname(order_date) 
order by dayname(order_date);

                                                                -- The Hours sales trend--
SELECT Hour(order_time) as Hours , count(DISTINCT order_id) AS Total_orders FROM pizza_sales 
 group by HOUR(order_time)
 order by Hour(order_time);                                                                
                                       
                                       
																-- The end of porject--