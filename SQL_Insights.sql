CREATE DATABASE PROJECT;

USE PROJECT;

SELECT * FROM remote_jobs_cleaned_data;

-- --------------------------------------------------------------------------------
-- 1. Most common job titles.
SELECT 
    `Job Title`, 
    COUNT(*) AS Job_Count
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    `Job Title`
ORDER BY 
    Job_Count DESC;
-- --------------------------------------------------------------------------------

-- 2. Count of jobs per location.
SELECT Location,COUNT(`Job Title`) AS Job_Count
FROM remote_jobs_cleaned_data
GROUP BY Location
ORDER BY Job_Count DESC;
-- --------------------------------------------------------------------------------

-- 3. Jobs with salaries greater than 10LPA 
-- For the Minimum Salaries
SELECT 
    `Job Title`, 
    `Minimum Salary (Rupees)` * 12 AS Annual_Min_Salary
FROM 
    remote_jobs_cleaned_data
WHERE 
    (`Minimum Salary (Rupees)` * 12) > 1000000
ORDER BY Annual_Min_Salary DESC;

-- For the Maximum Salaries
SELECT 
    `Job Title`, 
    `Maximum Salary (Rupees)` * 12 AS Annual_Max_Salary
FROM 
    remote_jobs_cleaned_data
WHERE 
    (`Maximum Salary (Rupees)` * 12) > 1000000
ORDER BY Annual_Max_Salary DESC;
-- --------------------------------------------------------------------------------

-- 4. Most frequently hiring companies.
SELECT 
    `Company`, 
    COUNT(*) AS Job_Count
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    `Company`
ORDER BY 
    Job_Count DESC;
-- --------------------------------------------------------------------------------
    
-- 5. Highest Paying Role Maximum Salaries
SELECT 
    `Job Title`, 
    MAX(`Maximum Salary (Rupees)` * 12) AS Highest_Annual_Salary
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    `Job Title`
ORDER BY 
    Highest_Annual_Salary DESC
LIMIT 1;

-- 6. Lowest Paying Role in Maximum Salaries
SELECT 
    `Job Title`, 
    MAX(`Maximum Salary (Rupees)` * 12) AS Lowest_Annual_Salary
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    `Job Title`
ORDER BY 
    Lowest_Annual_Salary ASC
LIMIT 1;
-- --------------------------------------------------------------------------------

-- 7. Highest Paying Role in Minimun Salaries
SELECT 
    `Job Title`, 
    MAX(`Minimum Salary (Rupees)` * 12) AS Highest_Annual_Salary
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    `Job Title`
ORDER BY 
    Highest_Annual_Salary DESC
LIMIT 1;

-- 8. Lowest Paying Role Minimun Salaries
SELECT 
    `Job Title`, 
    MAX(`Minimum Salary (Rupees)` * 12) AS Lowest_Annual_Salary
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    `Job Title`
ORDER BY 
    Lowest_Annual_Salary ASC
LIMIT 1;
-- --------------------------------------------------------------------------------

-- 9. Job Listings by Salary Range: Minimum salaries
SELECT 
    `Job Title`,
    CASE
        WHEN (`Minimum Salary (Rupees)` * 12) <= 500000 THEN 'Below 5 LPA'
        WHEN (`Minimum Salary (Rupees)` * 12) BETWEEN 500001 AND 1000000 THEN '5-10 LPA'
        WHEN (`Minimum Salary (Rupees)` * 12) BETWEEN 1000001 AND 1500000 THEN '10-15 LPA'
        ELSE 'Above 15 LPA'
    END AS Salary_Range,
    COUNT(*) AS Job_Count
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    `Job Title`, Salary_Range
ORDER BY 
    Job_Count DESC;
-- --------------------------------------------------------------------------------

-- 9. Job Listings by Salary Range:Maximum Salaries
SELECT 
    `Job Title`,
    CASE
        WHEN (`Maximum Salary (Rupees)` * 12) <= 500000 THEN 'Below 5 LPA'
        WHEN (`Maximum Salary (Rupees)` * 12) BETWEEN 500001 AND 1000000 THEN '5-10 LPA'
        WHEN (`Maximum Salary (Rupees)` * 12) BETWEEN 1000001 AND 1500000 THEN '10-15 LPA'
        ELSE 'Above 15 LPA'
    END AS Salary_Range,
    COUNT(*) AS Job_Count
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    `Job Title`, Salary_Range
ORDER BY 
    Job_Count DESC;
    
-- ----------------------------------------------------------------------
-- 10. Job Listings Posted in the Last 4 Months:

SELECT 
    `Job Title`, 
    `Company`, 
    `Location`, 
    `Minimum Salary (Rupees)`, 
    `Maximum Salary (Rupees)`,
    `Date Posted`
FROM 
    remote_jobs_cleaned_data
WHERE 
    `Date Posted` >= CURDATE() - INTERVAL 4 MONTH
ORDER BY 
    `Date Posted` DESC;
-- ------------------------------------------------------------
-- 11. Job Listings Over Time (Trend Analysis):

SELECT 
    YEAR(`Date Posted`) AS Year,
    MONTH(`Date Posted`) AS Month,
    COUNT(*) AS Job_Count
FROM 
    remote_jobs_cleaned_data
GROUP BY 
    Year, Month
ORDER BY 
    Year DESC, Month DESC;
-- ------------------------------------------------------
-- 12 Company Offering High Paying Jobs
SELECT 
    `Company`, 
    COUNT(*) AS High_Paying_Job_Count
FROM 
    remote_jobs_cleaned_data
WHERE 
    (`Minimum Salary (Rupees)` * 12) > 100000
GROUP BY 
    `Company`
ORDER BY 
    High_Paying_Job_Count DESC
LIMIT 1;

-- 13 Company Offering Low Paying Jobs
SELECT 
    `Company`, 
    COUNT(*) AS Low_Paying_Job_Count
FROM 
    remote_jobs_cleaned_data
WHERE 
    (`Minimum Salary (Rupees)` * 12) > 100000
GROUP BY 
    `Company`
ORDER BY 
    Low_Paying_Job_Count asc
LIMIT 1;
-- ----------------------------------------------------------------------------------------------
-- 14 Company Offering High Paying Jobs
SELECT 
    `Company`, 
    COUNT(*) AS High_Paying_Job_Count
FROM 
    remote_jobs_cleaned_data
WHERE 
    (`Maximum Salary (Rupees)` * 12) > 100000
GROUP BY 
    `Company`
ORDER BY 
    High_Paying_Job_Count DESC
LIMIT 1;

-- 15 Company Offering Low Paying Jobs
SELECT 
    `Company`, 
    COUNT(*) AS Low_Paying_Job_Count
FROM 
    remote_jobs_cleaned_data
WHERE 
    (`Maximum Salary (Rupees)` * 12) > 100000
GROUP BY 
    `Company`
ORDER BY 
    Low_Paying_Job_Count asc
LIMIT 1;

-- Summary
-- * Most common Job Titles are Customer Support Representative, Sales Development Representative, Senior Software Engineer.
-- * Most Frequently Hiring Company is Contra.
-- * Most Hiring Loctions are World Wide with the Highest and Unites States,Remote, reamining all as ranges from 1 to 3.
-- * The Highest Paying Role is 'Lead Product Designer' and Lowest Paying Role is 'Itinerary Creator Turn Your Travels Into ome'in case of Maximum Salaries.
-- * The Highest Paying Role is 'Brand Designer' and Lowest Paying Role is 'Itinerary Creator Turn Your Travels Into ome'in case of Minimum Salaries.
-- * In the 2025 there are total 96 Job Listings.
-- * Highest Paying Company is 'Contra' and Lowest Paying Company is 'SlideSpeak AI' in case of Minimum Salaries.
-- * Highest Paying Company is 'Contra' and Lowest Paying Company is 'SlideSpeak AI' in case of Maximum Salaries.