-- Create database
CREATE DATABASE IF NOT EXISTS company;

-- Use the created database
USE company;

-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    hire_date DATE,
    salary DECIMAL(10, 2)
);

-- Create departments table
CREATE TABLE IF NOT EXISTS departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Insert some sample departmentsINSERT INTO departments (department_name) VALUES
('HR'),
('Finance'),
('Engineering');

-- Insert sample employees
INSERT INTO employees (first_name, last_name, email, hire_date, salary)
VALUES
('John', 'Doe', 'john.doe@example.com', '2020-01-15', 75000),
('Jane', 'Smith', 'jane.smith@example.com', '2019-03-22', 80000);

-- Select all employees
SELECT * FROM employees;

-- Select all departments
SELECT * FROM departments;




