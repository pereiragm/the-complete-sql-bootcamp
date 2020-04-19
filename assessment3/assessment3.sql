CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE,
	graduation_year INTEGER NOT NULL
);

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	department VARCHAR(100) NOT NULL
);

SELECT * FROM students s;

SELECT * FROM teachers;

-- Once you've made the tables, insert a student named Mark Watney
-- (student_id=1) who has a phone number of 777-555-1234 and doesn't
-- have an email. He graduates in 2035 and has 5 as a homeroom number.
INSERT INTO students(
	first_name,
	last_name,
	homeroom_number,
	phone,
	graduation_year
)
VALUES (
	'Mark',
	'Watney',
	5,
	'777-555-1234',
	2035
);

-- Then insert a teacher names Jonas Salk (teacher_id = 1) who as a
-- homeroom number of 5 and is from the Biology department. His contact
-- info is: jsalk@school.org and a phone number of 777-555-4321
INSERT INTO teachers(
	first_name,
	last_name,
	homeroom_number,
	phone,
	email,
	department
)
VALUES (
	'Jonas',
	'Salk',
	5,
	'777-555-4321',
	'jsalk@school.org',
	'Biology'
);






