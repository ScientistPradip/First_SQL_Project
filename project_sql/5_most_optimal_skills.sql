/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identity skills in high demand and associated  with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/


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




