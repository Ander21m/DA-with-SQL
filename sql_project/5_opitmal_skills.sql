


With average_salary_skills As
(SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    Round(AVG(job_postings_fact.salary_year_avg),2) as average_salary
From job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short ='Data Analyst'
    And job_postings_fact.salary_year_avg is Not NULL
    And job_postings_fact.job_work_from_home = 'True'
GROUP BY  skills_dim.skills,skills_dim.skill_id

),skills_demand As
(
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COunt(skills_job_dim.job_id) as demand_count
From job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short ='Data Analyst'
    And job_postings_fact.job_work_from_home = 'True'
     And job_postings_fact.salary_year_avg is Not NULL
GROUP BY  skills_dim.skills,skills_dim.skill_id
)


SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
From skills_demand
INNER Join average_salary_skills
 ON average_salary_skills.skill_id = skills_demand.skill_id

WHERE demand_count >10
ORDER BY 
    average_salary DESC,
    demand_count DESC
Limit 10


--Improve Version
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COunt(skills_job_dim.job_id) as demand_count,
    Round(AVG(job_postings_fact.salary_year_avg),2) as average_salary
From job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title_short ='Data Analyst'
    And job_postings_fact.job_work_from_home = 'True'
     And job_postings_fact.salary_year_avg is Not NULL
GROUP BY  skills_dim.skills,skills_dim.skill_id
Having COunt(skills_job_dim.job_id) >10
ORDER BY
average_salary DESC,
    demand_count DESC
Limit 15