/*
List all departments by total headcount
*/

SELECT 
    e.Department,
    COUNT(e.EmployeeID) AS Headcount
FROM hr.employee_data AS e
GROUP BY e.Department
ORDER BY Headcount DESC

/*
In which locations does this company operate on?
*/

SELECT DISTINCT
oc.country,
oc.province,
oc.city
FROM hr.office_codes as oc
GROUP BY country,
city,
province


/*
How many current and former employees are or were working in Canada and the US?
*/

SELECT 
    COUNT(DISTINCT CONCAT(emp.EmployeeID, off.country)) as total_number_of_employees,
    COUNT(DISTINCT CASE WHEN emp.LeavingYear = 0 THEN CONCAT(emp.EmployeeID, off.country) END) as curr_number_of_employees,
    off.country
FROM 
    employee_data as emp
INNER JOIN 
    survey AS sv ON emp.EmployeeID = sv.emp_id
INNER JOIN 
    office_codes as off ON sv.off_cde = off.office_code
GROUP BY 
    off.country;

/*
What of current employees are working overtime in the latest year?
*/

SELECT 
    COUNT(CASE WHEN OverTime = 'Yes' THEN 1 END) AS number_of_curr_overtime_employees,
    COUNT(*) AS number_of_curr_employees,
    (COUNT(CASE WHEN OverTime = 'Yes' THEN 1 END) / COUNT(*)) * 100 AS percentage_of_overtime_employees,
    rated_year
FROM 
    hr.employee_data AS emp
INNER JOIN 
    survey AS sv ON emp.EmployeeID = sv.emp_id
WHERE 
    LeavingYear = 0 AND rated_year = 2022;


/*
What is the average salary per job role and department?
*/

SELECT 
    jps.JobRole,
    e.JobLevel_updated,
    e.Department,
    AVG(e.MonthlyIncome) as average_salary
FROM 
    employee_data as e
INNER JOIN 
    job_position_structure as jps ON e.Department = jps.Department
    AND e.JobLevel_updated = jps.JobLevel
GROUP BY 
    jps.JobRole, 
    e.JobLevel_updated,
    e.Department
ORDER BY average_salary DESC

/*
Employee Satisfaction by Department
*/

SELECT 
    jps.Department,
    AVG(e.JobSatisfaction) as average_satisfaction
FROM 
    employee_data as e
INNER JOIN 
    job_position_structure as jps ON e.Department = jps.Department
    AND e.JobLevel_updated = jps.JobLevel
GROUP BY 
    jps.Department
ORDER BY average_satisfaction DESC

/*
Employee Satisfaction by Job Role
*/

SELECT 
    jps.JobRole,
    e.JobLevel_updated,
    AVG(e.JobSatisfaction) as average_satisfaction
FROM 
    employee_data as e
INNER JOIN 
    job_position_structure as jps ON e.Department = jps.Department
    AND e.JobLevel_updated = jps.JobLevel
GROUP BY 
    jps.JobRole,
    e.JobLevel_updated
ORDER BY average_satisfaction DESC

/*
Longest Tenure by Department
*/

SELECT 
    Department,
    MAX(YearsAtCompany) as max_years
FROM 
    employee_data
GROUP BY 
    Department
ORDER BY 
    max_years DESC;

/*
Generate Query to Export CSV File  (Tableau Dashboard)
*/

USE hr;
CREATE VIEW hr.hr_python AS (
SELECT 
    e.EmployeeID,
    e.JoiningYear,
    e.Age,
    e.BusinessTravel,
    e.DailyRate,
    e.Department,
    e.DistanceFromHome,
    e.EducationField,
    e.EnvironmentSatisfaction,
    e.Gender,
    e.HourlyRate,
    e.JobInvolvement,
    e.JobSatisfaction,
    e.MaritalStatus,
    e.MonthlyIncome,
    e.MonthlyRate,
    e.NumCompaniesWorked,
    e.OverTime,
    e.PercentSalaryHike,
    e.PerformanceRating,
    e.RelationshipSatisfaction,
    e.StockOptionLevel,
    e.TotalWorkingYears,
    e.TrainingTimesLastYear,
    e.WorkLifeBalance,
    e.YearsAtCompany,
    e.YearsInCurrentRole,
    e.YearsSinceLastPromotion,
    e.YearsWithCurrManager,
    e.Attrition,
    e.LeavingYear,
    e.Reason,
    e.RelievingStatus,
    e.office_code,
    jps.JobLevel,
    jps.JobRole,
    oc.city,
    oc.province,
    oc.country,    
    s.rated_year,
    s.rating
FROM hr.employee_data AS e 
INNER JOIN survey AS s
    ON e.EmployeeID = s.emp_id
INNER JOIN office_codes AS oc
    ON s.off_cde = oc.office_code
INNER JOIN job_position_structure AS jps
    ON e.Department = jps.Department
    AND e.JobLevel_updated = jps.JobLevel )
    

