/* 
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

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


/* 
Here's the breakdown of the demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7. 
Tableau is also highly sought after, with a bold count of 6. 
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand. 

[
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "company": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "company": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "company": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "company": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "company": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "company": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "company": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "company": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "skills": "r"
  }
]
*/
