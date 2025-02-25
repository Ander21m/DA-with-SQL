TODO: Update this readme

# Introduction

Learing about the job positions related to data along side with the skills that are in high demand.Focusing mainly on Data Analyst and Data Scientist roles.In this project, we are focusing on topics such as top-paying jobs,in-demand skills, and many more.
For the SQL querires, you can check them out in this [sql_project folder](/sql_project/)

# Background

This project's original version is the youtube course named "SQL for Data Analytics" from the channel called "Luke Barousse".I just follow each steps from the video and make some adjusment by my own.Also, adding and researching some more insights and findings by myself than that is on the video.

### Here are some of the infos that i try to find in this project

1. The top-paying data analyst and data scientist jobs
2. The skills required for these jobs
3. The most in demand skills for both data analyst and data scientist jobs
4. The skills with higher salaries rate
5. The most optimal skills to learn for those 2 jobs.


# Tools I Used

For this project(since this is base on the tutorial project from youtube), I mostly use that is being mention in the video.Some of the tools are: 

- **SQL** : the main language that is responsible for retriving the critical insights from the database.
- **PostgreSQL** : the database management system used for handling the job posting data.
- **Visual Studio Code(VS Code)** :The environment for handling the management and excuting SQL queries.
- **Git and Github** : used for version control(for project tracking) and sharing the SQL files as well as the analysis insights and some details.

# The Analysis
Here are how i do to achieve some of the insights.

### 1. The top-paying data analyst and data scientist jobs

To get all of the info about the top-paying roles,first i filter the job position for each of the job that i want(in this case data analyst and data scientist) separately by average year salary and location with focusing only on the remote jobs.Here is the query for each job.


This is for Data Analyst 
```sql
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
```
- Highest-Paid Roles: "Data Analyst" at Mantys holds the highest salary at $650,000.
"Director of Analytics" at Meta follows with $336,500.
Director & Principal-Level Salaries:

- "Associate Director - Data Insights" (AT&T) has a salary of $255,829.
Principal Data Analyst roles range from $186,000 - $205,000, indicating a steady market for experienced analysts.
General Data Analyst Roles:

- Standard Data Analyst positions range from $184,000 - $232,000, with roles at Pinterest and Uclahealthcareers offering around $217,000 - $232,423.

![Top paying roles for Data Analyst](images\Salary_Of_DA)
*Bar Graph representing the top paying roles for Data Analyst generated by chat GPT*

For Data Scientist
```sql
-- Data Scientist Jobs
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
```
- Highest-Paid Roles:"Staff Data Scientist/Quant Researcher" holds the highest average salary of $550,000.
"Staff Data Scientist - Business Analytics" follows closely with $525,000.
Director & Head-Level Salaries:

- Salaries for director or head-level positions like "Head of Data Science" and "Director of Data Science & Analytics" range between $300,000 - $351,500.
Specialized leadership roles like "Head of Battery Data Science" also fall in this range at $300,000.
General Data Scientist Roles:

- Standard "Data Scientist" roles average around $375,000, which is still high but lower than staff or leadership roles.
Salary Gap Between Levels:

- There's a noticeable jump in salaries between standard data scientist positions and staff/quant research roles.
Director and head roles see some variation but generally stabilize around the $300,000 - $350,000 range.

![Top paying roles for Data Scientist](images\DS_Salaries_By_job)
*Bar Graph representing the top paying roles for Data Scientist generated by chat GPT*

# What I Learned

By following this course tutorial, I've learn some useful and important skills including SQL toolkits and many more.Some examples include- 

- I learned some of the technique of advanced SQL like table merging using WITH clause to create temp table and CTE.
- I also became more familiar with some of the commend like Group by and aggregate functions(count,avg) after learning this  course.
- Improved my problem solving skills and also gaining more confiedence in myself about not only handling the datasets and sql queries but also for other fields like game dev,app deve and many more.



# Conclusions


### Thoughts

Like i mentioned previously in what i learn,this course helps me a lot by enhancing my SQL skills.Also, provided the some valuable insights i can use in real world job market.The findings from this project also helps me to realize what kind of topic or skill to learn in order to be Data Analyst and Data Scientist also helping me to know more tools and skills relating to each of those jobs.