/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location 
- Why? It reveals how different skills impact salary levels for Data Analyst and
    helps identify the most financally rewarding skills to acquire or improve 
*/

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


/*
The top-paying skills for data analysts show a major shift in the analytics industry toward more technical and AI-focused roles. Many of the highest salaries are tied to machine learning and artificial intelligence technologies such as TensorFlow, PyTorch, Keras, MXNet, and Hugging Face. This indicates that companies increasingly value analysts who can work beyond traditional reporting and dashboards and contribute to predictive analytics, AI solutions, and automation. The data suggests that the role of a data analyst is evolving toward a hybrid position that combines analytics with machine learning and AI capabilities.
Another strong trend is the high value of cloud, infrastructure, and automation-related skills. Technologies such as Terraform, Ansible, Puppet, GitLab, and VMware appear among the top-paying skills. This shows that modern organizations want analysts who understand scalable systems, cloud platforms, deployment processes, and automation pipelines. Analytics is no longer isolated from IT infrastructure; instead, businesses prefer professionals who can integrate data workflows into modern cloud and DevOps environments.
The results also highlight the growing importance of big data and data engineering technologies. Skills such as Kafka, Airflow, Cassandra, Couchbase, and Scala are associated with high salaries because companies increasingly deal with massive volumes of real-time and distributed data. These skills are commonly linked with data engineering and scalable analytics systems, suggesting that the highest-paying analyst roles often require knowledge of data pipelines, distributed systems, and large-scale processing technologies.
Another noticeable pattern is that programming-oriented analysts earn significantly higher salaries than analysts who only rely on traditional business intelligence tools. Skills like Golang, Perl, and dplyr demonstrate that coding ability and automation expertise are highly rewarded. This suggests that companies prefer analysts who can build automated workflows, manipulate large datasets programmatically, and contribute to technical projects rather than only creating reports and visualizations.
The dataset also reveals that niche and specialized technologies can command extremely high salaries. For example, Solidity ranks near the top due to the high demand and limited supply of blockchain-related talent. Similarly, the extremely high salary associated with SVN is likely influenced by outlier job postings or a very small number of specialized positions. This suggests that while some niche skills can produce exceptionally high salaries, they may not represent widespread demand across the job market.

Overall, the data shows that the analytics field is evolving rather than disappearing. Traditional data analysis tasks such as simple reporting and dashboard creation are becoming increasingly automated, while higher-paying roles are moving toward a combination of analytics, programming, cloud computing, machine learning, and data engineering. The modern market increasingly rewards professionals who can combine business understanding with technical expertise and AI-driven problem-solving skills.

[
  {
    "skills": "svn",
    "avg_salary_per_skill": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary_per_skill": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary_per_skill": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary_per_skill": "155486"
  },
  {
    "skills": "golang",
    "avg_salary_per_skill": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary_per_skill": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary_per_skill": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary_per_skill": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary_per_skill": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary_per_skill": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary_per_skill": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary_per_skill": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary_per_skill": "129820"
  },
  {
    "skills": "keras",
    "avg_salary_per_skill": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary_per_skill": "125226"
  },
  {
    "skills": "perl",
    "avg_salary_per_skill": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary_per_skill": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary_per_skill": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary_per_skill": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary_per_skill": "118407"
  },
  {
    "skills": "notion",
    "avg_salary_per_skill": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary_per_skill": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary_per_skill": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary_per_skill": "116387"
  },
  {
    "skills": "scala",
    "avg_salary_per_skill": "115480"
  }
]
*/
