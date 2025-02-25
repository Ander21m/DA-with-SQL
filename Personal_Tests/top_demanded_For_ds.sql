--job count

SELECT 
    skills_dim.skills,
    COunt(skills_job_dim.job_id) as demand_count
From job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short ='Data Scientist'
    And job_postings_fact.job_work_from_home = 'True'
GROUP BY  skills_dim.skills
ORDER BY demand_count DESC
LIMIT 10


-- avg salary
SELECT 
    skills_dim.skills,
    Round(AVG(job_postings_fact.salary_year_avg),2) as average_salary
From job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short ='Data Scientist'
    And job_postings_fact.salary_year_avg is Not NULL
    And job_postings_fact.job_work_from_home = 'True'
GROUP BY  skills_dim.skills
ORDER BY average_salary DESC
LIMIT 10
