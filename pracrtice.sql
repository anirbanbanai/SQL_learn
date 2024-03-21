-- Active: 1710576437568@@127.0.0.1@5432@test_dbani

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_Id INT REFERENCES departments(department_id),
    selary DECIMAL(10,2),
    hire_date DATE
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
)

INSERT INTO departments (department_name) VALUES
 ('HR'),
  ('Marketing'),
  ('Finance'),
  ('IT'),
  ('sales'),
  ('engeering'),
  ('Customer_suppor'),
  ('administrator'),
  ('research'),
  ('quality assurance') ;

  INSERT INTO employees (employee_name, department_id,selary,hire_date) VALUES 
  ('John doe',1, 60000.00, '2022-02-10'),
  ('Kenh doe',2, 70000.00, '2022-04-10'),
  ('Kenh Fie',3, 75000.00, '2021-04-10'),
  ('Dorry Fie',4, 75000.00, '2021-01-10'),
  ('Disuj Fie',5, 65000.00, '2021-05-10'),
  ('Tom Ket',6, 75000.00, '2022-05-10'),
  ('Tom KHY',7, 85000.00, '2020-05-10'),
  ('Jesmin Ki',8, 85000.00, '2020-05-10'),
  ('Julia Ki',9, 95000.00, '2020-01-10'),
  ('Julia Juthy',10, 95000.00, '2020-01-10');




SELECT * FROM departments;

SELECT * FROM employees
JOIN departments ON employees.department_id = departments.department_id;

SELECT * FROM departments
JOIN employees USING(department_id)


---Shoe department name with avg selary

SELECT department_name, round(avg(selary)) as avg_selary from employees
JOIN departments USING(department_id)
GROUP BY department_name

---Count each employees each department
SELECT department_name, count(employee_id) as employee_total from employees
JOIN departments USING(department_id)
GROUP BY department_name;

---find the department name with highest selary

SELECT department_name,round(avg(selary)) as avg_selary  from employees
JOIN departments USING (department_id)
GROUP BY department_name
ORDER BY avg_selary DESC
LIMIT 2


---Count employee hired each YEAR
SELECT extract(YEAR FROM hire_date) as hire_year, count(*) from employees
GROUP BY hire_year

---