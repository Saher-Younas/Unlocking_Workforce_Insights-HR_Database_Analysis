# Unlocking Workforce Insights: HR Database Analysis

## Project Overview
This project is a deep dive into HR analytics, transforming raw employee data into powerful insights that drive strategic decision-making. By leveraging SQL for data transformation and analytics, this project uncovers trends in employee demographics, hiring, retention, and attrition.

## Key Features & SQL Operations
### Database Creation & Cleaning
- Designed and structured the `hr_db` database.
- Standardized date formats (`birthdate`, `hire_date`, `termdate`) for consistency.
- Resolved column inconsistencies (`id` → `emp_id`).
- Added an `age` column to analyze workforce demographics.
- Enabled safe updates and ensured data integrity.

### Data Analysis & Insights
1. **Employee Demographics:**
   - Gender & Ethnicity distribution.
   - Identifying youngest & oldest employees.
   - Number of employees under 18.

2. **Department & Role-Based Analysis:**
   - Workforce distribution across departments.
   - Promotion trends based on tenure & job role.
   - Time-to-promotion analysis for leadership roles.

3. **Attrition & Retention Trends:**
   - Average tenure per department.
   - Employee churn prediction using tenure & termination data.
   - Peak hiring trends by year & month.

4. **Advanced Workforce Analytics:**
   - Department-wise average tenure insights.
   - Predicting attrition using tenure and department trends.
   - Identifying seasonal hiring patterns.
   - Employee churn prediction based on hire date, term date, and department.

## Technologies Used
- **MySQL**: Data extraction, transformation, and advanced analytics.
- **SQL Queries**: Complex filtering, grouping, and trend analysis.
- **Data Cleaning & Formatting**: `STR_TO_DATE()`, `DATE_FORMAT()`, `TIMESTAMPDIFF()` for accurate date transformations.

## Key SQL Queries & Insights

### 1. Employee Demographics Breakdown
```sql
SELECT gender, COUNT(*) AS count FROM hr WHERE age > 18 GROUP BY gender;
SELECT race, COUNT(*) AS count FROM hr WHERE age >= 18 GROUP BY race ORDER BY count DESC;
```
Understanding workforce diversity and inclusivity.

### 2. Department-Wise Employee Count
```sql
SELECT department, COUNT(*) AS employee_count FROM hr GROUP BY department;
```
Aids in workforce planning and resource allocation.

### 3. Predicting Employee Attrition
```sql
SELECT department, AVG(TIMESTAMPDIFF(YEAR, hire_date, COALESCE(termdate, CURDATE()))) AS avg_tenure,
SUM(CASE WHEN termdate IS NOT NULL THEN 1 ELSE 0 END) AS total_exits
FROM hr
GROUP BY department ORDER BY avg_tenure ASC;
```
Highlights departments with high turnover rates.

### 4. Promotion Trends Analysis
```sql
SELECT jobtitle, department, COUNT(*) AS promotions_count FROM hr
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 5
GROUP BY jobtitle, department ORDER BY promotions_count DESC;
```
Determines promotion frequency across job roles and departments.

### 5. Hiring Trends & Peak Hiring Periods
```sql
SELECT YEAR(hire_date) AS hire_year, MONTH(hire_date) AS hire_month, COUNT(*) AS hires
FROM hr GROUP BY hire_year, hire_month ORDER BY hire_year DESC, hire_month DESC;
```
Analyzes hiring trends to optimize recruitment strategies.

### 6. Time-to-Promotion Analysis
```sql
SELECT jobtitle, department, AVG(TIMESTAMPDIFF(YEAR, hire_date, CURDATE())) AS avg_years_to_promotion
FROM hr WHERE jobtitle LIKE '%Manager%' OR jobtitle LIKE '%Lead%'
GROUP BY jobtitle, department ORDER BY avg_years_to_promotion ASC;
```
Provides insights into leadership development pathways.

### 7. Employee Churn Prediction
```sql
SELECT emp_id, first_name, last_name, department, jobtitle,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS tenure_years,
       (CASE 
           WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) < 2 THEN 'Less than 2 years'
           ELSE '2 years or more'
        END) AS tenure_category
FROM hr
ORDER BY tenure_years ASC;
```
Identifies early attrition risks for proactive employee retention.

## Summary of Analysis
This project transforms HR data into a valuable decision-making tool. By cleansing and analyzing workforce data, it uncovers trends in hiring, promotions, retention, and attrition, making it an essential asset for HR teams looking to optimize workforce planning and strategy.

## How to Use This Project
1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/hr-database-analysis.git
   ```
2. Import `hr_db.sql` into your MySQL database.
3. Run the SQL queries in `analysis_queries.sql` to generate workforce insights.

## Let's Connect
If you're interested in this work or have an exciting data-driven opportunity, feel free to reach out!

LinkedIn:  www.linkedin.com/in/saher-younas1-222134139
Email: saheryounas06@gmail.com


