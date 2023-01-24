use olist;
select * from order_items;

#1. From the order_items table, find the price of the highest priced order and lowest price order.
select max(price), min(price) from order_items;

#2. From the order_items table, what is range of the shipping_limit_date of the orders?

SELECT max(shipping_limit_date), min(shipping_limit_date) FROM order_items;

#3. From the customers table, find the states with the greatest number of customers.
select * from customers;

select customer_state, count(customer_unique_id) as customers_per_state from customers
group by customer_state order by customers_per_state desc;

#4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
select customer_state, customer_city, count(customer_city) as customers_per_city from customers
wHERE customer_state = "SP" 
group by customer_city order by customers_per_city desc;

#5. From the closed_deals table, how many distinct business segments are there (not including null)?
select * from closed_deals;

select count(distinct business_segment) as num_of_business_segments from closed_deals
WHERE business_segment IS NOT NULL;

#6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
select count(declared_monthly_revenue) as monthly_revenue_total, business_segment from closed_deals
WHERE declared_monthly_revenue IS NOT NULL
group by business_segment order by monthly_revenue_total asc
limit 3; 


#7. From the order_reviews table, find the total number of distinct review score values.
select * from order_reviews;

select COUNT(DISTINCT review_score) FROM order_reviews;

SELECT DISTINCT review_score
FROM olist.order_reviews;


#8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
SELECT * from order_reviews;

SELECT
review_score,
CASE 
	WHEN review_score = 1 THEN 'poor'
    WHEN review_score = 2 THEN 'poor+'
    WHEN review_score = 3 THEN 'average'
    WHEN review_score = 4 THEN 'good'
    ELSE 'very good'
END as description,
COUNT(review_id)
FROM order_reviews
GROUP BY 
review_score,
description
ORDER BY COUNT(review_id) DESC;


#9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.
SELECT review_score, COUNT(DISTINCT review_id) FROM order_reviews
GROUP BY review_score
ORDER BY COUNT(DISTINCT review_id) desc;