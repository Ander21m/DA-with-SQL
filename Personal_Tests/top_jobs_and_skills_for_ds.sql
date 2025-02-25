
-- Data Scientist Jobs
/*
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name as company_name
From job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
Where job_title_short = 'Data Scientist' AND
job_location = 'Anywhere'
And salary_year_avg IS NOt NULL
ORDER BY salary_year_avg DESC
LIMIT 10
*/



-- Data Scientist Jobs
With top_paying_Ds As (SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name as company_name
From job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
Where job_title_short = 'Data Scientist' AND
job_location = 'Anywhere'
And salary_year_avg IS NOt NULL
ORDER BY salary_year_avg DESC
LIMIT 10)

SELECT 
    top_paying_Ds.*,
    skills_dim.skills
From top_paying_Ds
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_Ds.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER By 
    top_paying_Ds.salary_year_avg DESC


/*

Insights from the Visualization:
SQL and Python are the most in-demand skills:

These two skills dominate the dataset, appearing in multiple job listings.
SQL is critical for data querying and database management.
Python is essential for data analysis, machine learning, and automation.
Other skills appear less frequently:

Unlike SQL and Python, other skills seem to be less consistently required.
This suggests that SQL and Python are core skills, while other tools depend on specific job roles.
High-Paying Jobs Require Specialized Skills:

The highest-paying jobs ($500K+) often require a mix of programming, data analytics, and business acumen.*/