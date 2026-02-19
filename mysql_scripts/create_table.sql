
-- Create database
CREATE DATABASE union_budget_db;
GO
USE union_budget_db;
GO

-- Create table
CREATE TABLE budget_data (
    id INT IDENTITY(1,1) PRIMARY KEY,
    category NVARCHAR(255),
    sl_no INT,
    ministry_department NVARCHAR(255),
    scheme NVARCHAR(MAX),
    actual_2021_2022_revenue FLOAT,
    actual_2021_2022_capital FLOAT,
    actual_2021_2022_total FLOAT,
    budget_2022_2023_total FLOAT,
    budget_2023_2024_total FLOAT
);
GO

-- Table structure
EXEC sp_help 'budget_data';
GO

-- Row count
SELECT COUNT(*) AS total_rows FROM budget_data;
GO

-- Total budget for 2023-2024
SELECT SUM(budget_2023_2024_total) AS total_budget_2023_2024
FROM budget_data;
GO

-- Top 10 schemes by 2023-2024 budget
SELECT TOP 10 scheme, budget_2023_2024_total
FROM budget_data
ORDER BY budget_2023_2024_total DESC;
GO

-- Ministry-wise total allocation
SELECT ministry_department,
       SUM(budget_2023_2024_total) AS total_allocation
FROM budget_data
GROUP BY ministry_department
ORDER BY total_allocation DESC;
GO

-- Scheme-wise growth
SELECT scheme,
       budget_2022_2023_total,
       budget_2023_2024_total,
       (budget_2023_2024_total - budget_2022_2023_total) AS growth
FROM budget_data;
GO
ORDER BY growth DESC;