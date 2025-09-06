DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS job_history CASCADE;
DROP TABLE IF EXISTS jobs CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS locations CASCADE;

CREATE TABLE locations (
    location_id CHAR(9) NOT NULL PRIMARY KEY,
    location_name VARCHAR(30),
    city VARCHAR(30),
    country CHAR(2)
);

CREATE TABLE departments (
    department_id CHAR(9) NOT NULL PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    manager_id CHAR(9),
    location_id CHAR(9),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE jobs (
    job_id CHAR(9) NOT NULL PRIMARY KEY,
    job_title VARCHAR(30) NOT NULL,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);

CREATE TABLE employees (
    employee_id CHAR(9) NOT NULL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    ssn CHAR(9) UNIQUE,
    birth_date DATE,
    gender CHAR,
    address VARCHAR(30),
    job_id CHAR(9),
    salary DECIMAL(10,2),
    manager_id CHAR(9),
    department_id CHAR(9) NOT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

ALTER TABLE departments
ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

CREATE TABLE job_history (
    employee_id CHAR(9) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    job_id CHAR(9) NOT NULL,
    department_id CHAR(9),
    PRIMARY KEY (employee_id, start_date),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);