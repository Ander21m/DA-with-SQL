-- Data Analyst Jobs
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name as company_name
From job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
Where job_title_short = 'Data Analyst' AND
job_location = 'Anywhere'
And salary_year_avg IS NOt NULL
ORDER BY salary_year_avg DESC
LIMIT 10







