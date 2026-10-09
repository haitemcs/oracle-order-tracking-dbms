Describe employees;


SELECT DISTINCT UPPER(job_title) as job_title_uppercase
FROM employees
ORDER BY job_title_uppercase ASC;


SELECT employee_id, first_name, last_name, email, hire_date
FROM employees
WHERE hire_date BETWEEN DATE '2016-01-01' AND DATE '2016-12-31'
ORDER BY hire_date ASC;
