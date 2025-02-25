SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COunt(skills_job_dim.job_id) as demand_count,
    Round(AVG(job_postings_fact.salary_year_avg),2) as average_salary
From job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short ='Data Scientist'
    And job_postings_fact.job_work_from_home = 'True'
     And job_postings_fact.salary_year_avg is Not NULL
GROUP BY  skills_dim.skills,skills_dim.skill_id
Having COunt(skills_job_dim.job_id) >10
ORDER BY
average_salary DESC,
    demand_count DESC


/*1. Highest-Paying Skills
The top 5 highest-paying skills are:
C ($164,864.98, demand: 48)
Go ($164,691.09, demand: 57)
Qlik ($164,484.64, demand: 15)
Looker ($158,714.91, demand: 57)
Airflow ($157,414.13, demand: 23)
These skills tend to be related to low-level programming (C, Go) and business intelligence tools (Qlik, Looker).
2. Most In-Demand Skills
The top 5 skills with the highest demand:
Python (763 job postings, salary: $143,827.93)
SQL (591 job postings, salary: $142,832.59)
R (394 job postings, salary: $137,885.37)
AWS (217 job postings, salary: $149,629.96)
Tableau (219 job postings, salary: $146,970.05)
Python and SQL are crucial for data analysis, while R is commonly used in statistics and ML.
AWS and Tableau indicate strong demand for cloud-based analytics and visualization tools.
3. High Salary but Low Demand
Qlik ($164,484.64) and Looker ($158,714.91) have high salaries but low demand (15 & 57 postings).
These specialized business intelligence (BI) tools seem to be high-paying but niche.
4. Low Salary but High Demand
JavaScript ($104,810.00, demand: 26) and HTML ($105,027.78, demand: 18)
Excel ($129,224.44, demand: 77) and Power BI ($131,390.36, demand: 72)
These are widely used but lower-paying compared to more specialized data science tools.
5. Salary Distribution Insights
Most salaries fall between $120K and $165K.
Machine Learning & AI tools like Pytorch ($152,602.70), TensorFlow ($151,536.49), and Scikit-learn ($148,963.95) offer strong salaries but are not the absolute highest.
Big Data tools like Spark ($150,188.49), Hadoop ($143,321.50), and Databricks ($139,631.11) are well-paid but slightly behind ML frameworks.
*/