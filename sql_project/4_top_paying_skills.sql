

SELECT 
    skills_dim.skills,
    Round(AVG(job_postings_fact.salary_year_avg),2) as average_salary
From job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short ='Data Analyst'
    And job_postings_fact.salary_year_avg is Not NULL
    And job_postings_fact.job_work_from_home = 'True'
GROUP BY  skills_dim.skills
ORDER BY average_salary DESC
LIMIT 10

/*Key Takeaways:
Big Data and AI Tools Pay Well: PySpark, Watson, and Couchbase are associated with large-scale data processing and AI-driven decision-making.
DevOps and MLOps are Rewarding: Bitbucket and GitLab indicate that data science roles are shifting towards production-ready solutions.
Even Traditional Data Science Skills Can be Lucrative: Jupyter, Pandas, and Elasticsearch show that well-rounded expertise in common tools still commands strong salaries.*/