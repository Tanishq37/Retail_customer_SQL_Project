/* Question 1:
   What is the total revenue generated? */

SELECT
    SUM(Purchase_Amount_USD) AS Total_Revenue
FROM retail_customer_insights;


/* Question 2:
   What is the average purchase amount? */

SELECT
    AVG(Purchase_Amount_USD) AS Average_Purchase
FROM retail_customer_insights;


/* Question 3:
   What is the highest purchase amount? */

SELECT
    MAX(Purchase_Amount_USD) AS Highest_Purchase
FROM retail_customer_insights;


/* Question 4:
   What is the lowest purchase amount? */

SELECT
    MIN(Purchase_Amount_USD) AS Lowest_Purchase
FROM retail_customer_insights;


/* Question 5:
   How many customers belong to each gender? */

SELECT
    Gender,
    COUNT(*) AS Customer_Count
FROM retail_customer_insights
GROUP BY Gender;


/* Question 6:
   What is the average age of customers? */

SELECT
    AVG(Age) AS Average_Age
FROM retail_customer_insights;


/* Question 7:
   Which age has the highest number of customers? */

SELECT
    Age,
    COUNT(*) AS Customer_Count
FROM retail_customer_insights
GROUP BY Age
ORDER BY Customer_Count DESC;


/* Question 8:
   Which product categories are most popular? */

SELECT
    Category,
    COUNT(*) AS Total_Orders
FROM retail_customer_insights
GROUP BY Category
ORDER BY Total_Orders DESC;


/* Question 9:
   Which item is purchased the most? */

SELECT
    Item_Purchased,
    COUNT(*) AS Purchase_Count
FROM retail_customer_insights
GROUP BY Item_Purchased
ORDER BY Purchase_Count DESC;


/* Question 10:
   What is the average review rating? */

SELECT
    AVG(Review_Rating) AS Average_Rating
FROM retail_customer_insights;


/* Question 11:
   Which category receives the highest ratings? */

SELECT
    Category,
    ROUND(AVG(Review_Rating),2) AS Avg_Rating
FROM retail_customer_insights
GROUP BY Category
ORDER BY Avg_Rating DESC;


/* Question 12:
   How many customers have subscriptions? */

SELECT
    Subscription_Status,
    COUNT(*) AS Customer_Count
FROM retail_customer_insights
GROUP BY Subscription_Status;


/* Question 13:
   How many purchases used discounts? */

SELECT
    Discount_Applied,
    COUNT(*) AS Purchase_Count
FROM retail_customer_insights
GROUP BY Discount_Applied;


/* Question 14:
   Which payment method is used most frequently? */

SELECT
    Payment_Method,
    COUNT(*) AS Usage_Count
FROM retail_customer_insights
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;


/* Question 15:
   How frequently do customers shop? */

SELECT
    Frequency_of_Purchases,
    COUNT(*) AS Customer_Count
FROM retail_customer_insights
GROUP BY Frequency_of_Purchases
ORDER BY Customer_Count DESC;

/* ============================================================

## Exploratory Data Analysis (EDA) Summary
* Generated $233,081 in total revenue with an average purchase value of $59.76.
* Customer spending ranged between $20 and $100, indicating consistent purchase behavior.
* Male customers represented the majority of the customer base.
* Average customer age was 44 years.
* Clothing was the most popular product category.
* Jewelry was the most frequently purchased item.
* Customers gave an average review rating of 3.75/5.
* Most customers were non-subscribers.
* Purchases without discounts were more common than discounted purchases.
* PayPal was the most preferred payment method.
* Customer purchase frequency was fairly balanced across all shopping intervals.
* Results highlight opportunities to improve customer retention through subscription and loyalty programs.

   ============================================================ */