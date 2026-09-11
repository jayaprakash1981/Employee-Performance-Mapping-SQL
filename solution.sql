-- Action 1: Use Database
USE employee;

-- Action 2: Fetch Employee Details & Department
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT 
FROM emp_record_table;

-- Action 3: Filter by Employee Rating
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS DEPARTMENT, EMP_RATING 
FROM emp_record_table 
WHERE EMP_RATING < 2 OR EMP_RATING BETWEEN 2 AND 4 OR EMP_RATING > 4;

-- Action 4: Leadership Roles
SELECT EMP_ID, FIRST_NAME, ROLE, DEPT AS DEPARTMENT 
FROM emp_record_table 
WHERE ROLE IN ('MANAGER', 'PRESIDENT', 'CEO');

-- Action 5: Max Rating by Department
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT AS DEPARTMENT, EMP_RATING, 
       MAX(EMP_RATING) OVER(PARTITION BY DEPT) AS MAX_DEPT_RATING 
FROM emp_record_table;

-- Action 6: Salary Range by Role
SELECT ROLE, MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALARY 
FROM emp_record_table 
GROUP BY ROLE;

-- Action 7: Experience Rank
SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP, 
       RANK() OVER (ORDER BY EXP DESC) AS EXP_RANK 
FROM emp_record_table;

-- Action 8 & 9: Create View for High Earners
CREATE OR REPLACE VIEW high_salary_employees AS 
SELECT EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, SALARY 
FROM emp_record_table 
WHERE SALARY > 6000;

SELECT * FROM high_salary_employees;

-- Action 10: Execution Plan & Index
EXPLAIN SELECT * FROM emp_record_table WHERE FIRST_NAME = 'Eric';
CREATE INDEX idx_first_name ON emp_record_table(FIRST_NAME(255));

-- Action 11: Average Salary by Continent and Country
SELECT CONTINENT, COUNTRY, AVG(SALARY) AS AVG_SALARY 
FROM emp_record_table 
GROUP BY CONTINENT, COUNTRY;
