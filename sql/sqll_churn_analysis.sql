CREATE DATABASE bank_churn;
use bank_churn;
select database();
show tables;
USE bank_churn;

SHOW TABLES;
USE bank_churn;

SELECT COUNT(*) FROM bank_customers;
SELECT Exited, COUNT(*) AS Total_Customers
FROM bank_customers
GROUP BY Exited;
SELECT
    ROUND(
        SUM(Exited) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM bank_customers;

SELECT
    Geography,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM bank_customers
GROUP BY Geography
ORDER BY Churn_Rate DESC;

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY Gender
ORDER BY Churn_Rate DESC;


SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Above 50'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY Age_Group
ORDER BY Churn_Rate DESC;


SELECT
    IsActiveMember,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY IsActiveMember;

SELECT
    NumOfProducts,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

SELECT
    CASE
        WHEN CreditScore < 500 THEN 'Poor'
        WHEN CreditScore BETWEEN 500 AND 649 THEN 'Fair'
        WHEN CreditScore BETWEEN 650 AND 749 THEN 'Good'
        ELSE 'Excellent'
    END AS Credit_Category,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY Credit_Category
ORDER BY Churn_Rate DESC;



SELECT
    CASE
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance < 50000 THEN 'Below 50K'
        WHEN Balance < 100000 THEN '50K-100K'
        ELSE 'Above 100K'
    END AS Balance_Group,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY Balance_Group
ORDER BY Churn_Rate DESC;

SELECT
    HasCrCard,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM bank_customers
GROUP BY HasCrCard;

SELECT
    CASE
        WHEN EstimatedSalary < 50000 THEN 'Below 50K'
        WHEN EstimatedSalary < 100000 THEN '50K-100K'
        WHEN EstimatedSalary < 150000 THEN '100K-150K'
        ELSE 'Above 150K'
    END AS Salary_Group,
    COUNT(*) AS Customers,
    SUM(Exited) AS Churned,
    ROUND(SUM(Exited)*100.0/COUNT(*),2) AS Churn_Rate
FROM bank_customers
GROUP BY Salary_Group
ORDER BY Churn_Rate DESC;

SELECT
    Geography,
    COUNT(*) AS Total_Customers
FROM bank_customers
GROUP BY Geography
ORDER BY Total_Customers DESC;

SELECT
    Exited,
    ROUND(AVG(Age),2) AS Average_Age
FROM bank_customers
GROUP BY Exited;

SELECT
    Exited,
    ROUND(AVG(Balance),2) AS Average_Balance
FROM bank_customers
GROUP BY Exited;


SELECT
    
CustomerId,
    Surname,
    Geography,
    Balance
FROM bank_customers
ORDER BY Balance DESC
LIMIT 10;

SELECT
    CustomerId,
    Surname,
    CreditScore
FROM bank_customers
ORDER BY CreditScore DESC
LIMIT 10;

SELECT
    Age,
    COUNT(*) AS Customers
FROM bank_customers
GROUP BY Age
ORDER BY Customers DESC;

SELECT
    CustomerId,
    Surname,
    Geography,
    Balance,
    RANK() OVER(ORDER BY Balance DESC) AS Balance_Rank
FROM bank_customers;

SELECT
    CustomerId,
    Surname,
    Balance
FROM bank_customers
WHERE Balance >
(
    SELECT AVG(Balance)
    FROM bank_customers
);

SELECT
    CustomerId,
    Geography,
    Balance,
    ROUND(
        AVG(Balance) OVER(PARTITION BY Geography),
        2
    ) AS Avg_Balance_Country
FROM bank_customers;


SELECT
    Tenure,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned,
    ROUND(SUM(Exited)*100.0/COUNT(*),2) AS Churn_Rate
FROM bank_customers
GROUP BY Tenure
ORDER BY Tenure;

SELECT
    CustomerId,
    Surname,
    Geography,
    EstimatedSalary
FROM bank_customers
ORDER BY EstimatedSalary DESC
LIMIT 10;

SELECT
    CustomerId,
    Surname,
    Geography,
    Age,
    Balance
FROM bank_customers
WHERE Exited=1
ORDER BY Balance DESC
LIMIT 20;

SELECT CustomerId,Surname,Geography,Balance,Tenure FROM bank_customers WHERE Exited=0 AND IsActiveMember=1
ORDER BY Balance DESC LIMIT 20;

SELECT COUNT(*) AS Total_Customers,
SUM(Exited) AS Churned_Customers,ROUND(SUM(Exited)*100/COUNT(*),2) AS Churn_Rate,
ROUND(AVG(Balance),2) AS Avg_Balance,
ROUND(AVG(CreditScore),2) AS Avg_CreditScore,
ROUND(AVG(EstimatedSalary),2) AS Avg_Salary
FROM bank_customers;