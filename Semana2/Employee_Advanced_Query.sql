use test;
create table employee (employee_id int,
first_name varchar(60),
last_name varchar(60),
dept_id varchar(50),
manager_id int,
salary float,
expertise varchar(60));
#https://learnsql.com/blog/25-advanced-sql-query-examples/
insert into employee (employee_id, first_name, last_name, dept_id, manager_id, salary, expertise)
values (100, 'John', 'White', 'IT', 103, 120000, 'Senior'),
( 101, 'Mary', 'Danner', 'Account', 109, 80000, 'junior'),
(102, 'Ann', 'Lynn', 'Sales', 107, 140000, 'Semisenior'),
(103, 'Peter', 'O\´Connor', 'IT', 110, 130000, 'Senior'),
(106, 'Sue','Sanchez', 'Sales', 107, 110000, 'Junior'),
(107, 'Marta', 'Doe', 'Sales', 110, 180000, 'Senior'),
(109, 'Ann', 'Danner', 'Account', 110, 90000, 'Senior'),
(110, 'Simon', 'Yang', 'CEO', null, 250000, 'Senior'),
(111, 'Juan', 'Graue', 'Sales', 102, 37000, 'Junior');

#Example #1 - Ranking Rows Based on a Specific Ordering Criteria
SELECT 
  employee_id,
  last_name,
  first_name,
  salary,
  RANK() OVER (ORDER BY salary DESC) as ranking
FROM employee
ORDER BY ranking;

#Example #2 - List The First 5 Rows of a Result Set
WITH employee_ranking AS (
  SELECT
    employee_id,
    last_name,
    first_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) as ranking
  FROM employee
)
SELECT
  employee_id,
  last_name,
  first_name,
  salary
FROM employee_ranking
WHERE ranking <= 5
ORDER BY ranking;

#Example #3 - List the Last 5 Rows of a Result Set
WITH employee_ranking AS (
  SELECT
    employee_id,
    last_name,
    first_name,
    salary,
    RANK() OVER (ORDER BY salary ASC) as ranking
  FROM employee
)
SELECT
  employee_id,
  last_name,
  first_name,
  salary
FROM employee_ranking
WHERE ranking <= 5
ORDER BY ranking;

#Example #4 - List The Second Highest Row of a Result Set

WITH employee_ranking AS (
  SELECT
    employee_id,
    last_name,
    first_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) as ranking
  FROM employee
)
SELECT
  employee_id,
  last_name,
  first_name,
  salary
FROM employee_ranking
WHERE ranking = 2;

#Example #5 - List the Second Highest Salary By Department
