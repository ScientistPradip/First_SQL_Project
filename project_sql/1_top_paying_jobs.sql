/* 
Question: What are the top-paying data analyst jobs?
- Identify the tip 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remote nulls).
- Why? Highlight the top-paying opportunities for Data Scientist, offering insights into emoloyees
*/

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

