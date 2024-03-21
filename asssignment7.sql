-- Active: 1710576437568@@127.0.0.1@5432@test_dbani

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY, department_name VARCHAR(50)
);

INSERT INTO
    departments (department_name)
VALUES ('Engineering'),
    ('Marketing'),
    ('Finance');

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY, employee_name VARCHAR(50), age INT, email VARCHAR(30), department_Id INT REFERENCES departments (department_id), salary DECIMAL(10, 2), status VARCHAR(20)
);

INSERT INTO
    employees (
        employee_name, age, email, department_id, salary, status
    )
VALUES (
        'Alice', 30, 'alice@example.com', 1, 60000, NULL
    ),
    (
        'Bob', 35, 'bob@example.net', 2, 65000, NULL
    ),
    (
        'Charlie', 28, 'charlie@google.com', 1, 55000, NULL
    ),
    (
        'David', 33, 'david@yahoo.com', 2, 62000, NULL
    ),
    (
        'Eve', 31, 'eve@example.net', 3, 58000, NULL
    ),
    (
        'Frank', 29, 'frank@example.com', 1, 59000, NULL
    ),
    (
        'Grace', 34, 'grace@google.com', 2, 63000, NULL
    ),
    (
        'Henry', 32, 'henry@yahoo.com', 3, 57000, NULL
    ),
    (
        'Ivy', 27, 'ivy@gmail.com', 1, 56000, NULL
    ),
    (
        'Jack', 36, 'jack@example.net', 2, 64000, NULL
    ),
    (
        'Karen', 29, 'karen@gmail.com', 3, 60000, NULL
    ),
    (
        'Liam', 33, 'liam@gmail.com', 1, 59000, NULL
    ),
    (
        'Mia', 31, 'mia@yahoo.com', 2, 62000, NULL
    ),
    (
        'Nora', 28, 'nora@yahoo.com', 3, 57000, NULL
    ),
    (
        'Oliver', 35, 'oliver@example.net', 1, 61000, NULL
    ),
    (
        'Penelope', 30, 'penelope@google.com', 2, 63000, NULL
    ),
    (
        'Quinn', 32, 'quinn@google.com', 3, 59000, NULL
    ),
    (
        'Rachel', 27, 'rachel@gmail.com', 1, 55000, NULL
    ),
    (
        'Sam', 34, 'sam@example.net', 2, 64000, NULL
    ),
    (
        'Taylor', 31, 'taylor@yahoo.com', 3, 58000, NULL
    );

----drop
DROP TABLE departments;
DROP TABLE employees;

----select
SELECT * from departments;
SELECT * from employees;

---query 1
SELECT * from employees WHERE salary > 60000;

----query 2
SELECT * from employees LIMIT 2 OFFSET 2

----query 3
SELECT round(avg(age)) as average_age from employees

----query 4  not solve
SELECT * from employees WHERE email IN ('example.com','example.net', 'google.com')


---query 5
SELECT * from employees JOIN departments USING(department_id)
WHERE department_name='Engineering'

--- query 6 
UPDATE employees set status ='Promoted' WHERE salary = (SELECT max(salary) from employees)

---- query 7
SELECT department_name, round(avg(salary)) as avg_selary from employees
JOIN departments USING(department_id)
GROUP BY department_name