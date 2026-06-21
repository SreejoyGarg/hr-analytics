-- ================================================
-- FILE: 02_data_validation.sql
-- PURPOSE: Verify data imported correctly & explore
-- ================================================

USE hr_db;

-- Check total row count (should be 1470)
SELECT COUNT(*) AS Total_Rows FROM hr_data;

-- Preview first 5 rows
SELECT * FROM hr_data LIMIT 5;

-- Check for NULL values in key columns
SELECT
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Null_Attrition,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS Null_Income,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Null_Department,
    SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS Null_JobRole,
    SUM(CASE WHEN OverTime IS NULL THEN 1 ELSE 0 END) AS Null_OverTime
FROM hr_data;

-- Check for duplicate employee records
SELECT EmployeeNumber, COUNT(*) AS Cnt
FROM hr_data
GROUP BY EmployeeNumber
HAVING Cnt > 1;

-- Check distinct values in key categorical columns
SELECT DISTINCT Department FROM hr_data;
SELECT DISTINCT JobRole FROM hr_data;
SELECT DISTINCT Attrition FROM hr_data;
SELECT DISTINCT OverTime FROM hr_data;
SELECT DISTINCT MaritalStatus FROM hr_data;
SELECT DISTINCT EducationField FROM hr_data;

-- Basic statistics on numeric columns
SELECT
    ROUND(MIN(Age), 0) AS Min_Age,
    ROUND(MAX(Age), 0) AS Max_Age,
    ROUND(AVG(Age), 1) AS Avg_Age,
    ROUND(MIN(MonthlyIncome), 0) AS Min_Income,
    ROUND(MAX(MonthlyIncome), 0) AS Max_Income,
    ROUND(AVG(MonthlyIncome), 0) AS Avg_Income,
    ROUND(MIN(YearsAtCompany), 0) AS Min_Years,
    ROUND(MAX(YearsAtCompany), 0) AS Max_Years
FROM hr_data;