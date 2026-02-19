CREATE DATABASE union_budget_db;
USE union_budget_db;

CREATE TABLE budget_data (
    category VARCHAR(255),
    sl_no INT,
    ministry_department VARCHAR(255),
    scheme TEXT,
    actual_2021_2022_revenue DOUBLE,
    actual_2021_2022_capital DOUBLE,
    actual_2021_2022_total DOUBLE,
    budget_2022_2023_total DOUBLE,
    budget_2023_2024_total DOUBLE
);

DESCRIBE budget_data;

SELECT COUNT(*) FROM budget_data;

SELECT SUM(budget_2023_2024_total) AS total_budget_2023_2024
FROM budget_data;


SELECT scheme, budget_2023_2024_total
FROM budget_data
ORDER BY budget_2023_2024_total DESC
LIMIT 10;

SELECT ministry_department,
       SUM(budget_2023_2024_total) AS total_allocation
FROM budget_data
GROUP BY ministry_department
ORDER BY total_allocation DESC;

SELECT scheme,
       budget_2022_2023_total,
       budget_2023_2024_total,
       (budget_2023_2024_total - budget_2022_2023_total) AS growth
FROM budget_data
ORDER BY growth DESC;