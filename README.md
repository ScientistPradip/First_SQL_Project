
# Introduction
Dive into the data job market! Focusing on data analyst roles, this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data analytics. 

SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others wirk to find optimal jobs. 

Data hails from my [SQL Course ](https://lukebarousse.com/sql). Its packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were: 

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?


# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights. 
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking. 

# The Analysis
Each query for this project aimed at  investigating specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered datra analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT 
    job_id,
    company.name AS company,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact AS job_posting
LEFT JOIN company_dim AS company ON
company.company_id = job_posting.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location LIKE '%MO%' AND
    salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg 
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field. 
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broand interest across different industries. 
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

![Top Paying Roles](assets\1_top_paying_roles_bargraph.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job posting with the skills data, providing employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS (
    SELECT 
    job_id,
    company.name AS company,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact AS job_posting
LEFT JOIN company_dim AS company ON
company.company_id = job_posting.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC 
LIMIT 10 
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON
skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON 
skills_dim.skill_id = skills_job_dim.skill_id 
ORDER BY salary_year_avg DESC
```

Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023:
- **SQL** is leading with a bold count of 8
- **Python** follows closely with a bold count of 7.
- **Tableau is also highly sought after, with a bold count of 6. Other skills like **R, Snowflake, Pandas, and Excel** show varity degrees of demand

![Skill Count for Top 10 Paying Data Analyst Jobs in 2023](assets/2_top_paying_roles_skills.png)
*Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results*

### 3. Most Demanded Skills for Data Analyst ###
This query helped identify the skills must most frequently requested in job postint, dircting focus to areas with high demand.

```sql
SELECT
    skills_dim.skill_id AS skill_no,
    skills,
    COUNT(job_title) no_of_jobs
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON
skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON
skills_dim.skill_id = skills_job_dim.skill_id 
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location LIKE '%MO%'
GROUP BY 
    skills_dim.skill_id
ORDER BY 
    no_of_jobs DESC
LIMIT 5;
```
Here's the breakdown of the most demanded skills for data analysts in 2023

- SQL and Excel reman fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
- Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

| skill_no | skills  | no_of_jobs |
|-----------|----------|-------------|
| 0         | sql      | 930         |
| 181       | excel    | 730         |
| 1         | python   | 585         |
| 5         | r        | 434         |
| 182       | tableau  | 323         |

*Table of the the damand for the top 5 skills in data analyst job postings*

### 4. Skills Based on Salary ###
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT 
    skills, 
    ROUND(AVG (salary_year_avg), 0) AS avg_salary_per_skill
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON 
skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON
skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg IS NOT NULL AND
job_title_short = 'Data Analyst' 
--AND job_location LIKE '%MO%' 
--AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary_per_skill DESC
LIMIT 25
```

Here's a breakdown of the results for top paying skills for Data Analysts:

- **High Demand for Big Data & ML Skills:** Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- **Software Development & Deployment Proficiency:** Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
- **Cloud Computing Expertise:** Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.


| skills | avg_salary_per_skill |
|--------|-----------------------|
| svn | 400000 |
| solidity | 179000 |
| couchbase | 160515 |
| datarobot | 155486 |
| golang | 155000 |
| mxnet | 149000 |
| dplyr | 147633 |
| vmware | 147500 |
| terraform | 146734 |
| twilio | 138500 |
| gitlab | 134126 |
| kafka | 129999 |
| puppet | 129820 |
| keras | 127013 |
| pytorch | 125226 |
| perl | 124686 |
| ansible | 124370 |
| hugging face | 123950 |
| tensorflow | 120647 |
| cassandra | 118407 |
| notion | 118092 |
| atlassian | 117966 |
| bitbucket | 116712 |
| airflow | 116387 |
| scala | 115480 |

*Table of the average salary for the top 10 paying skills for data analysts*

### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql

WITH demanded_skills AS (
SELECT
    skills_dim.skill_id,
    skills,
    COUNT(job_title) AS no_of_jobs
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON
skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON
skills_dim.skill_id = skills_job_dim.skill_id 
WHERE 
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL AND 
    job_location = 'Anywhere'
GROUP BY 
    skills_dim.skill_id


), top_paying_skills AS (
SELECT 
    skills_dim.skill_id,
    skills, 
    ROUND(AVG (salary_year_avg), 0) AS avg_salary_per_skill
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON 
skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON
skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg IS NOT NULL AND
job_title_short = 'Data Analyst' 
AND job_location = 'Anywhere' 
--AND job_work_from_home = TRUE
GROUP BY skills_dim.skill_id

)

SELECT 
    demanded_skills.skill_id,
    demanded_skills.skills,
    no_of_jobs,
    avg_salary_per_skill
FROM 
    demanded_skills
INNER JOIN top_paying_skills ON
demanded_skills.skill_id = top_paying_skills.skill_id
WHERE avg_salary_per_skill IS NOT NULL AND
no_of_jobs >10
--job_title_short = 'Data Analyst' 
 --job_location = 'Anywhere'
 ORDER BY 
    avg_salary_per_skill DESC,
    no_of_jobs DESC
LIMIT 25;
```

| skill_id | skills | no_of_jobs | avg_salary_per_skill |
|-----------|---------|-------------|------------------------|
| 8 | go | 27 | 115320 |
| 234 | confluence | 11 | 114210 |
| 97 | hadoop | 22 | 113193 |
| 80 | snowflake | 37 | 112948 |
| 74 | azure | 34 | 111225 |
| 77 | bigquery | 13 | 109654 |
| 76 | aws | 32 | 108317 |
| 4 | java | 17 | 106906 |
| 194 | ssis | 12 | 106683 |
| 233 | jira | 20 | 104918 |
| 79 | oracle | 37 | 104534 |
| 185 | looker | 49 | 103795 |
| 2 | nosql | 13 | 101414 |
| 1 | python | 236 | 101397 |
| 5 | r | 148 | 100499 |
| 78 | redshift | 16 | 99936 |
| 187 | qlik | 13 | 99631 |
| 182 | tableau | 230 | 99288 |
| 197 | ssrs | 14 | 99171 |
| 92 | spark | 13 | 99077 |
| 13 | c++ | 11 | 98958 |
| 186 | sas | 63 | 98902 |
| 7 | sas | 63 | 98902 |
| 61 | sql server | 35 | 97786 |
| 9 | javascript | 20 | 97587 |

*Table of the most optimal skills for data analyst sorted by salary*

Here's a breakdown of the most optimal skills for Data Analysts in 2023:

- **High-Demand Programming Languages:** Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
- **Cloud Tools and Technologies:** Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
- **Business Intelligence and Visualization Tools:** Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
- **Database Technologies:** The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.

# What I Learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

Complex Query Crafting: Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
Data Aggregation: Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
Analytical Wizardry: Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights ###
From the analysis, several general insights emerged:

Top-Paying Data Analyst Jobs: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!
Skills for Top-Paying Jobs: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
Most In-Demand Skills: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
Skills with Higher Salaries: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
Optimal Skills for Job Market Value: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts ###

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.