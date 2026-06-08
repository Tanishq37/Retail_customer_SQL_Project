/* ============================================================
   PHASE 7: RFM ANALYSIS
   PROJECT: RETAIL CUSTOMER INSIGHTS
   ============================================================ */


/* ------------------------------------------------------------
   Question 1:
   Calculate Frequency and Monetary metrics for each customer.
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    SUM(Previous_Purchases) AS Frequency,
    SUM(Purchase_Amount_USD) AS Monetary
FROM retail_customer_insights
GROUP BY Customer_ID;


/* ------------------------------------------------------------
   Question 2:
   Create Customer Value Score.
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    SUM(Previous_Purchases) AS Frequency,
    SUM(Purchase_Amount_USD) AS Monetary,

    SUM(Previous_Purchases) *
    SUM(Purchase_Amount_USD) AS Customer_Value_Score

FROM retail_customer_insights
GROUP BY Customer_ID
ORDER BY Customer_Value_Score DESC;


/* ------------------------------------------------------------
   Question 3:
   Rank customers based on spending.
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    SUM(Purchase_Amount_USD) AS Total_Spend,

    RANK() OVER(
        ORDER BY SUM(Purchase_Amount_USD) DESC
    ) AS Spend_Rank

FROM retail_customer_insights
GROUP BY Customer_ID;


/* ------------------------------------------------------------
   Question 4:
   Segment customers into High, Medium and Low Value.
   ------------------------------------------------------------ */

WITH CustomerMetrics AS
(
    SELECT
        Customer_ID,
        SUM(Purchase_Amount_USD) AS Total_Spend
    FROM retail_customer_insights
    GROUP BY Customer_ID
)

SELECT
    Customer_ID,
    Total_Spend,

    CASE
        WHEN Total_Spend >= 80 THEN 'High Value'
        WHEN Total_Spend >= 50 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment

FROM CustomerMetrics;


/* ------------------------------------------------------------
   Question 5:
   Count customers in each segment.
   ------------------------------------------------------------ */

WITH CustomerMetrics AS
(
    SELECT
        Customer_ID,
        SUM(Purchase_Amount_USD) AS Total_Spend
    FROM retail_customer_insights
    GROUP BY Customer_ID
)

SELECT
    CASE
        WHEN Total_Spend >= 80 THEN 'High Value'
        WHEN Total_Spend >= 50 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment,

    COUNT(*) AS Customer_Count

FROM CustomerMetrics
GROUP BY Customer_Segment;


/* ------------------------------------------------------------
   Question 6:
   Which customer segment generates the most revenue?
   ------------------------------------------------------------ */

WITH CustomerMetrics AS
(
    SELECT
        Customer_ID,
        SUM(Purchase_Amount_USD) AS Total_Spend
    FROM retail_customer_insights
    GROUP BY Customer_ID
)

SELECT
    CASE
        WHEN Total_Spend >= 80 THEN 'High Value'
        WHEN Total_Spend >= 50 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment,

    SUM(Total_Spend) AS Revenue

FROM CustomerMetrics
GROUP BY Customer_Segment
ORDER BY Revenue DESC;


/* ------------------------------------------------------------
   Question 7:
   Identify the Top 20 Most Valuable Customers.
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    SUM(Purchase_Amount_USD) AS Monetary,
    SUM(Previous_Purchases) AS Frequency,

    SUM(Purchase_Amount_USD) *
    SUM(Previous_Purchases) AS Customer_Value_Score

FROM retail_customer_insights
GROUP BY Customer_ID
ORDER BY Customer_Value_Score DESC
LIMIT 20;


/* ------------------------------------------------------------
   Question 8:
   Analyze purchase frequency groups.
   ------------------------------------------------------------ */

SELECT
    Frequency_of_Purchases,
    COUNT(*) AS Customer_Count,
    SUM(Purchase_Amount_USD) AS Revenue

FROM retail_customer_insights
GROUP BY Frequency_of_Purchases
ORDER BY Revenue DESC;


/* ============================================================

RFM Analysis

- Built customer value metrics using purchase frequency and monetary value.
- Identified high-value, medium-value, and low-value customer segments.
- Ranked customers by spending and loyalty.
- Measured revenue contribution by customer segment.
- Identified top 20 customers based on customer value score.
- Generated actionable customer segmentation insights for retention strategies.

   ============================================================ */