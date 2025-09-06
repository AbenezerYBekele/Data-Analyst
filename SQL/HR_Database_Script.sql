
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS job_history;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    street_address VARCHAR(100),
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(50),
    country_code CHAR(2) NOT NULL
);

CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL UNIQUE,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2),
    CONSTRAINT chk_salary_range CHECK (min_salary <= max_salary)
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    ssn CHAR(9) UNIQUE,
    email VARCHAR(50) UNIQUE NOT NULL,
    birth_date DATE,
    gender CHAR(1) CONSTRAINT chk_gender CHECK (gender IN ('M', 'F', 'O')),
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2),
    job_id INT NOT NULL,
    department_id INT,
    manager_id INT
);

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL UNIQUE,
    manager_id INT UNIQUE,
    location_id INT
);

CREATE TABLE job_history (
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    job_id INT NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (employee_id, start_date),
    CONSTRAINT chk_date_order CHECK (end_date IS NULL OR end_date >= start_date)
);

ALTER TABLE employees
    ADD CONSTRAINT fk_emp_job FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    ADD CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES departments(department_id),
    ADD CONSTRAINT fk_emp_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

ALTER TABLE departments
    ADD CONSTRAINT fk_dept_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    ADD CONSTRAINT fk_dept_location FOREIGN KEY (location_id) REFERENCES locations(location_id);

ALTER TABLE job_history
    ADD CONSTRAINT fk_hist_employee FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    ADD CONSTRAINT fk_hist_job FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    ADD CONSTRAINT fk_hist_dept FOREIGN KEY (department_id) REFERENCES departments(department_id);

CREATE INDEX idx_emp_job_id ON employees(job_id);
CREATE INDEX idx_emp_dept_id ON employees(department_id);
CREATE INDEX idx_emp_manager_id ON employees(manager_id);
CREATE INDEX idx_dept_location_id ON departments(location_id);

CREATE OR REPLACE VIEW view_employee_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.hire_date,
    TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) AS tenure_years,
    j.job_title,
    d.department_name,
    l.city,
    l.state_province,
    e.salary,
    j.min_salary,
    j.max_salary,
    CASE
        WHEN (j.max_salary - j.min_salary) > 0
        THEN (e.salary - j.min_salary) / (j.max_salary - j.min_salary)
        ELSE 0
    END AS salary_range_utilization,
   
    CONCAT(mgr.first_name, ' ', mgr.last_name) AS manager_name
FROM
    employees e
    LEFT JOIN jobs j ON e.job_id = j.job_id
    LEFT JOIN departments d ON e.department_id = d.department_id
    LEFT JOIN locations l ON d.location_id = l.location_id
    LEFT JOIN employees mgr ON e.manager_id = mgr.employee_id;


CREATE OR REPLACE VIEW view_department_salary_summary AS
SELECT
    d.department_name,
    COUNT(e.employee_id) AS number_of_employees,
    AVG(e.salary) AS average_salary,
    MIN(e.salary) AS min_salary_in_dept,
    MAX(e.salary) AS max_salary_in_dept
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
GROUP BY
    d.department_name;

SET FOREIGN_KEY_CHECKS = 1;
