/* ============================================================
   PHASE 5: CUSTOMER ANALYSIS
   PROJECT: RETAIL CUSTOMER INSIGHTS
   ============================================================ */


/* ------------------------------------------------------------
   Question 1:
   Who are the top 10 highest-spending customers?
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    SUM(Purchase_Amount_USD) AS Total_Spend
FROM retail_customer_insights
GROUP BY Customer_ID
ORDER BY Total_Spend DESC
LIMIT 10;


/* ------------------------------------------------------------
   Question 2:
   Which customers have made the most previous purchases?
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    SUM(Previous_Purchases) AS Total_Previous_Purchases
FROM retail_customer_insights
GROUP BY Customer_ID
ORDER BY Total_Previous_Purchases DESC
LIMIT 10;


/* ------------------------------------------------------------
   Question 3:
   What is the average spending by subscription status?
   ------------------------------------------------------------ */

SELECT
    Subscription_Status,
    ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Spend
FROM retail_customer_insights
GROUP BY Subscription_Status;


/* ------------------------------------------------------------
   Question 4:
   Which age group spends the most money?
   ------------------------------------------------------------ */

SELECT
    Age,
    SUM(Purchase_Amount_USD) AS Total_Spend
FROM retail_customer_insights
GROUP BY Age
ORDER BY Total_Spend DESC;


/* ------------------------------------------------------------
   Question 5:
   Which gender spends more on average?
   ------------------------------------------------------------ */

SELECT
    Gender,
    ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Spend
FROM retail_customer_insights
GROUP BY Gender
ORDER BY Avg_Spend DESC;


/* ------------------------------------------------------------
   Question 6:
   Which customers have the highest average review ratings?
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    ROUND(AVG(Review_Rating),2) AS Avg_Rating
FROM retail_customer_insights
GROUP BY Customer_ID
ORDER BY Avg_Rating DESC
LIMIT 10;


/* ------------------------------------------------------------
   Question 7:
   What is the relationship between discounts and spending?
   ------------------------------------------------------------ */

SELECT
    Discount_Applied,
    ROUND(AVG(Purchase_Amount_USD),2) AS Avg_Spend
FROM retail_customer_insights
GROUP BY Discount_Applied;


/* ------------------------------------------------------------
   Question 8:
   Which payment method is preferred by customers?
   ------------------------------------------------------------ */

SELECT
    Payment_Method,
    COUNT(*) AS Total_Transactions
FROM retail_customer_insights
GROUP BY Payment_Method
ORDER BY Total_Transactions DESC;


/* ------------------------------------------------------------
   Question 9:
   Which frequency group generates the most revenue?
   ------------------------------------------------------------ */

SELECT
    Frequency_of_Purchases,
    SUM(Purchase_Amount_USD) AS Revenue
FROM retail_customer_insights
GROUP BY Frequency_of_Purchases
ORDER BY Revenue DESC;


/* ------------------------------------------------------------
   Question 10:
   Which customers can be considered high-value customers?
   (Based on spending and previous purchases)
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    SUM(Purchase_Amount_USD) AS Total_Spend,
    SUM(Previous_Purchases) AS Total_Purchases,
    SUM(Purchase_Amount_USD) * SUM(Previous_Purchases) AS Customer_Value_Score
FROM retail_customer_insights
GROUP BY Customer_ID
ORDER BY Customer_Value_Score DESC
LIMIT 20;

/* ============================================================

Customer Analysis Summary
* Several customers reached the maximum purchase amount of $100, making them the highest spenders in the dataset.
* The most loyal customers recorded 50 previous purchases.
* Average spending was almost the same for subscribers and non-subscribers, indicating little impact of subscriptions on spending behavior.
* Customers aged 49 years contributed the highest total revenue among all age groups.
* Female customers had a slightly higher average spend per purchase than male customers.
* Multiple customers achieved a perfect 5.0 review rating, reflecting high customer satisfaction.
* Customers purchasing without discounts spent slightly more on average than those using discounts.
* PayPal was the most preferred payment method.
* Customers shopping every 3 months generated the highest revenue.
* A group of high-value customers was identified based on both spending and purchase frequency.

Key Insight: The business has a strong base of loyal and high-value customers, making customer retention and loyalty programs important opportunities for future growth.

   ============================================================ */