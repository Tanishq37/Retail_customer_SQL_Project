/* ============================================================
   PHASE 2: DATA UNDERSTANDING & VALIDATION
   PROJECT: RETAIL CUSTOMER INSIGHTS
   ============================================================ */

/* ------------------------------------------------------------
   Question 1:
   How many records were successfully loaded into the dataset?
   ------------------------------------------------------------ */

SELECT COUNT(*) AS Total_Records
FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 2:
   Are there any missing values in critical columns?
   ------------------------------------------------------------ */

SELECT *
FROM retail_customer_insights
WHERE Customer_ID IS NULL
   OR Age IS NULL
   OR Gender IS NULL
   OR Category IS NULL
   OR Purchase_Amount_USD IS NULL;


/* ------------------------------------------------------------
   Question 3:
   Are there any duplicate customer records?
   ------------------------------------------------------------ */

SELECT Customer_ID,
       COUNT(*) AS Record_Count
FROM retail_customer_insights
GROUP BY Customer_ID
HAVING COUNT(*) > 1;


/* ------------------------------------------------------------
   Question 4:
   What is the minimum and maximum age of customers?
   ------------------------------------------------------------ */

SELECT MIN(Age) AS Min_Age,
       MAX(Age) AS Max_Age
FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 5:
   What is the minimum and maximum purchase amount?
   ------------------------------------------------------------ */

SELECT MIN(Purchase_Amount_USD) AS Min_Purchase,
       MAX(Purchase_Amount_USD) AS Max_Purchase
FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 6:
   What product categories are available in the dataset?
   ------------------------------------------------------------ */

SELECT DISTINCT Category
FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 7:
   What gender values exist in the dataset?
   ------------------------------------------------------------ */

SELECT DISTINCT Gender
FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 8:
   What seasons are represented in the dataset?
   ------------------------------------------------------------ */

SELECT DISTINCT Season
FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 9:
   What payment methods are used by customers?
   ------------------------------------------------------------ */

SELECT DISTINCT Payment_Method
FROM retail_customer_insights;


/* ------------------------------------------------------------
   Question 10:
   What is the range of customer review ratings?
   ------------------------------------------------------------ */

SELECT MIN(Review_Rating) AS Lowest_Rating,
       MAX(Review_Rating) AS Highest_Rating
FROM retail_customer_insights;


/* ============================================================
 ## Data Understanding Summary

Before starting the analysis, the dataset was checked for data quality and consistency.

* Total records analyzed: **3,900**
* No missing values found in critical columns.
* No duplicate records identified.
* Customer age ranges from **18 to 70**, indicating valid age values.
* Product categories include **Accessories, Footwear, Clothing, and Outerwear**.
* Gender values are consistent with **Male** and **Female** categories.
* Sales data is available across all four seasons: **Spring, Summer, Fall, and Winter**.
* Multiple payment methods are represented, including Credit Card, Debit Card, PayPal, Bank Transfer, Cash, and Venmo.
* Review ratings range from **2.5 to 5.0**, which falls within the expected scale.

   Result:
   Dataset is ready for Exploratory Data Analysis (EDA).
   ============================================================ */