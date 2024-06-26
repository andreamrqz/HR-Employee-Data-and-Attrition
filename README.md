## HR Employee Data and People Analytics

## Overview
This README file documents the process and findings from querying an HR employee dataset from [Kaggle](https://www.kaggle.com/datasets/jash312/hr-employee-attrition-datasets/data?select=HR+Employee+data.csv) using SQL Workbench. Additionally, a dashboard was created in [Tableau](https://public.tableau.com/app/profile/andrea.marquez3249/viz/HRDashboard-PeopleAnalytics/OverviewDashboard) to visualize the insights obtained from the data.

![Overview Dashboard.png](https://github.com/andreamrqz/HR-Employee-Data-and-Attrition/blob/main/Overview%20Dashboard.png)
![Employee Records Dashboard.png](https://github.com/andreamrqz/HR-Employee-Data-and-Attrition/blob/main/Employee%20Records%20Dashboard.png)

## Data Processing
Using SQL Workbench, I performed several queries to extract and analyze key information from the dataset. Below are the insights obtained:

### 1. Number of Departments
There are six departments in the company. Ordered by descending headcount, they are:
- Corporate Functions, 2321
- Sales, 2277
- Product, 2239
- Delivery, '218
- HR, 2187
- Marketing, 2181

### 2. Company Locations
The company operates in the following locations:
- US: New York, Boston, and Philadelphia
- Canada: Toronto, Markham, Calgary, Ottawa, and Vancouver

### 3. Employee Count in Canada and the US
US:
- Current Employees: 3,868
- Total Employees: 5,419

Canada:
- Current Employees: 6,357
- Total Employees: 8,004

Most of the employees work or have worked in Canada.

### 4. Percentage of Current Employees Working Overtime
Ten percent (1,042 persons) of the current employee population is working overtime in the latest year.

### 5. Average Salary per Job Role and Department
Salary Range: $2,852.54 to $19,320.56

Highest Paid Roles by Department:
- Marketing: Director of Marketing
- Delivery: Director of Service Delivery
- Sales: Director of Sales
- Corporate Functions: Administrative Manager
- HR: Director of Human Resources
- Product: Director of Product Management

### 6. Employee Satisfaction by Department
Average satisfaction scores range from 2.36 to 2.4 across departments in the following order:
- Corporate Functions
- Product
- Sales
- Marketing
- HR
- Delivery

### 7. Employee Satisfaction by Job Role
- Highest Satisfaction: Vice President (VP) or Chief Officer (L7 Job Level) with a score of 3.37
- Lowest Satisfaction: Senior Account Executive (L3 Job Level) with a score of 2.28

### 8. Longest Tenure by Department
- Delivery: 15 years
- Corporate Functions: 14 years
- Sales: 13 years
- HR: 13 years
- Marketing: 12 years
- Product: 12 years


## Dashboard in Tableau
An interactive dashboard was created in Tableau to visualize these insights, such as employee KPIs and records. The data table used for the dashboard was generated by inner joining the four CSV files from [Kaggle](https://www.kaggle.com/datasets/jash312/hr-employee-attrition-datasets/data?select=HR+Employee+data.csv). 

## Conclusion
The analysis provided valuable insights into the company’s employee distribution, salary ranges, satisfaction levels, and tenure. The Tableau dashboard complements this analysis by offering a visual representation of the data, facilitating better understanding and decision-making.

## Future Work
Further analysis can be done to explore trends over time, predict attrition, and understand the impact of different factors on employee satisfaction and performance.

