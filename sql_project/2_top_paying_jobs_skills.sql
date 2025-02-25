-- Data Analyst Jobs
WITH top_paying_jobs As (
    SELECT job_id,
    job_title,

    salary_year_avg,
    
    company_dim.name as company_name
From job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
Where job_title_short = 'Data Analyst' AND
job_location = 'Anywhere'
And salary_year_avg IS NOt NULL
ORDER BY salary_year_avg DESC
LIMIT 10

)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
From top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER By 
    top_paying_jobs.salary_year_avg DESC

/*Most In-Demand Skills in High-Paying Jobs:
SQL (8 mentions) – Essential for data querying and database management.
Python (7 mentions) – A key language for data analysis, machine learning, and automation.
Tableau (6 mentions) – A widely used data visualization tool.
R (4 mentions) – Popular for statistical computing and data science.
Snowflake, Pandas, Excel (3 mentions each) – Snowflake (cloud data warehousing), Pandas (Python data handling), and Excel (traditional data analysis) are also important.
Azure, AWS, Power BI, Jira, Atlassian, Gitlab, Confluence, Bitbucket, Go, Oracle (2 mentions each) – Various cloud, BI, and software development tools.
Other Skills (1 mention each) – Hadoop, Databricks, Pyspark, Jupyter, Git, Jenkins, SAP, etc.
Key Takeaways:
Data-related skills dominate: SQL, Python, R, and Tableau are among the most required.
Cloud and big data expertise are valuable: Azure, AWS, Snowflake, and Databricks appear.
Software engineering & DevOps tools are needed: Git, Bitbucket, Jenkins, and Confluence are mentioned.*/


