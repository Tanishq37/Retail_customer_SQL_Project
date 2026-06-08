/* ============================================================
   PHASE 6: ADVANCED SQL ANALYSIS
   PROJECT: RETAIL CUSTOMER INSIGHTS
   ============================================================ */


/* ------------------------------------------------------------
   Question 1:
   Rank product categories based on total revenue.
   ------------------------------------------------------------ */

SELECT
    Category,
    SUM(Purchase_Amount_USD) AS Revenue,

    RANK() OVER(
        ORDER BY SUM(Purchase_Amount_USD) DESC
    ) AS Revenue_Rank

FROM retail_customer_insights
GROUP BY Category;


/* ------------------------------------------------------------
   Question 2:
   Assign a dense rank to categories by revenue.
   ------------------------------------------------------------ */

SELECT
    Category,
    SUM(Purchase_Amount_USD) AS Revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(Purchase_Amount_USD) DESC
    ) AS Revenue_Rank

FROM retail_customer_insights
GROUP BY Category;


/* ------------------------------------------------------------
   Question 3:
   Identify the top-spending customer in each location.
   ------------------------------------------------------------ */

WITH CustomerSpend AS
(
    SELECT
        Location,
        Customer_ID,
        SUM(Purchase_Amount_USD) AS Total_Spend,

        ROW_NUMBER() OVER(
            PARTITION BY Location
            ORDER BY SUM(Purchase_Amount_USD) DESC
        ) AS rn

    FROM retail_customer_insights
    GROUP BY Location, Customer_ID
)

SELECT *
FROM CustomerSpend
WHERE rn = 1;


/* ------------------------------------------------------------
   Question 4:
   Calculate running revenue across customers.
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    Purchase_Amount_USD,

    SUM(Purchase_Amount_USD)
    OVER(
        ORDER BY Customer_ID
    ) AS Running_Revenue

FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 5:
   Compare each customer's spending with the average spending.
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    Purchase_Amount_USD,

    AVG(Purchase_Amount_USD)
    OVER() AS Overall_Average

FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 6:
   Find customers spending above the overall average.
   ------------------------------------------------------------ */

WITH AvgSpend AS
(
    SELECT AVG(Purchase_Amount_USD) AS Avg_Purchase
    FROM retail_customer_insights
)

SELECT *
FROM retail_customer_insights
WHERE Purchase_Amount_USD >
(
    SELECT Avg_Purchase
    FROM AvgSpend
);


/* ------------------------------------------------------------
   Question 7:
   Categorize customers based on spending level.
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    Purchase_Amount_USD,

    CASE
        WHEN Purchase_Amount_USD >= 80 THEN 'High Value'
        WHEN Purchase_Amount_USD >= 50 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment

FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 8:
   Rank customers within each gender by spending.
   ------------------------------------------------------------ */

SELECT
    Customer_ID,
    Gender,
    Purchase_Amount_USD,

    ROW_NUMBER() OVER(
        PARTITION BY Gender
        ORDER BY Purchase_Amount_USD DESC
    ) AS Gender_Rank

FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 9:
   Find the highest revenue-generating category in each season.
   ------------------------------------------------------------ */

WITH SeasonalRevenue AS
(
    SELECT
        Season,
        Category,
        SUM(Purchase_Amount_USD) AS Revenue,

        ROW_NUMBER() OVER(
            PARTITION BY Season
            ORDER BY SUM(Purchase_Amount_USD) DESC
        ) AS rn

    FROM retail_customer_insights
    GROUP BY Season, Category
)

SELECT *
FROM SeasonalRevenue
WHERE rn = 1;


/* ------------------------------------------------------------
   Question 10:
   Calculate percentage contribution of each category
   to total revenue.
   ------------------------------------------------------------ */

SELECT
    Category,

    SUM(Purchase_Amount_USD) AS Revenue,

    ROUND(
        SUM(Purchase_Amount_USD) * 100.0 /
        SUM(SUM(Purchase_Amount_USD)) OVER(),
        2
    ) AS Revenue_Percentage

FROM retail_customer_insights
GROUP BY Category;

/* ============================================================

Advanced SQL Analysis

- Applied CTEs and window functions to solve business problems.
- Ranked product categories and customers by revenue.
- Identified top customers within each location.
- Calculated running revenue and category contribution percentages.
- Built customer segmentation using CASE statements.
- Performed advanced revenue and spending analysis using analytical functions.

   ============================================================ */