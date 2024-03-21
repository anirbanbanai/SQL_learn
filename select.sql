-- Active: 1710576437568@@127.0.0.1@5432@test_dbani
CREATE TABLE persons (
    student_id SERIAL PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), age INT, grade CHAR(2), course VARCHAR(50), email VARCHAR(100), dob DATE, blood_group VARCHAR(5), country VARCHAR(20)
)

INSERT INTO
    persons (
        first_name, last_name, age, grade, course, email, dob, blood_group, country
    )
VALUES (
        'C', 'S', 20, 'C+', 'p-hero', 's@gmail.com', '2004-1-7', 'B+', NULL
    )

SELECT * from persons

SELECT country FROM persons ORDER BY country DESC

SELECT DISTINCT course from persons

SELECT * from persons WHERE country = 'BD'

SELECT * from persons WHERE email = 'j@gmail.com'

SELECT * from persons WHERE country IS NOT NULL;

SELECT * from persons WHERE country = 'BD';

SELECT COALESCE(
        country, 'country not provided'
    )
From persons
    -- long term procces, not recomended
SELECT * FROM persons WHERE country = 'USA' OR country = 'US' OR country = 'B'

    -- perfect procce;
SELECT * FROM persons WHERE country IN ('USA', 'US') --like oparator;
SELECT * from persons WHERE first_name LIKE '__n' --LIKE is case sensitive;

SELECT * from persons WHERE first_name ILIKE '__n' --ILIKE is not case sensitive
    --LIMIT OFFSET
SELECT * FROM persons WHERE country IN ('USA', 'US')LIMIT 5;
SELECT * FROM persons WHERE country IN ('USA', 'US') LIMIT 5 OFFSET 1 --OFFSET used for ignore first data

---DELETE oparation
DELETE FROM persons WHERE grade = 'B+';
DELETE FROM persons WHERE grade = 'W+' AND country = 'BD';

---UPDATE oparation
UPDATE persons set email = 'update@gmail.com',age=233 WHERE student_id = 1;

---Date time ZONE
  SELECT now()

  CREATE Table timeZ (ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone)

  INSERT INTO timez VALUES('2024-01-12 10:45:00', '2024-01-12 10:45:00')

  SELECT * FROM timez

  SELECT now()::date;

  SELECT now()::time

  SELECT to_char(now(), 'yyyy/mm/dd')

  SELECT CURRENT_DATE -INTERVAL ' 8 month'

  SELECT age(CURRENT_DATE, '2004-01-07')

  SELECT *, age(CURRENT_DATE,dob) from persons;

   
   ---GROUP
   SELECT country,avg(age) from persons
    GROUP BY country HAVING avg(age)>20.00

    SELECT extract(YEAR FROM dob) as birth_year, count(*) FROM persons GROUP BY birth_year


    