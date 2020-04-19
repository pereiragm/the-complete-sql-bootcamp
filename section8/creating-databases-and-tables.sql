--CREATE TABLE account(
--	user_id serial PRIMARY KEY,
--	username varchar(50) UNIQUE NOT NULL,
--	password varchar(50) NOT NULL,
--	email varchar(355) UNIQUE NOT NULL,
--	created_on timestamp NOT NULL,
--	last_login timestamp);

--CREATE TABLE role(
--	role_id serial PRIMARY KEY,
--	role_name varchar(255) UNIQUE NOT NULL
--);

--CREATE TABLE account_role(
--	user_id integer NOT NULL,
--	role_id integer NOT NULL,
--	grant_date timestamp without time ZONE,
--	PRIMARY KEY (user_id,role_id),
--
--	CONSTRAINT account_role_role_id_fkey FOREIGN KEY (role_id)
--		REFERENCES role (role_id) MATCH SIMPLE
--		ON UPDATE NO ACTION ON DELETE NO ACTION,
--	CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id)
--		REFERENCES account (user_id) MATCH SIMPLE
--		ON UPDATE NO ACTION ON DELETE NO ACTION	
--);

--CREATE TABLE lead(
--	lead_id serial PRIMARY KEY,
--	first_name varchar(255) NOT null,
--	last_name varchar(255) NOT null,
--	email varchar(255) UNIQUE NOT null,
--	sign_up_date timestamp NOT NULL,
--	spent_period integer NOT null
--);

--CREATE TABLE link(
--	id serial PRIMARY KEY,
--	url varchar(255) NOT NULL,
--	name varchar(255) NOT NULL,
--	description varchar(255),
--	rel varchar(50)
--);


--INSERT INTO link(url, name)
--VALUES
--('www.yahoo.com', 'yahoo'),
--('www.bing.com', 'bing'),
--('www.google.com', 'google');

SELECT * FROM link;

-- Create table from another one preserving the same structure.
-- Does not copy the rows.
CREATE TABLE link_copy LIKE (link);
SELECT * FROM link_copy;

-- Insert rows from another table
INSERT INTO link_copy
SELECT * FROM link
WHERE name = 'google';

SELECT * FROM link_copy;

SELECT * FROM link;
INSERT INTO link(url, name)
VALUES
('www.a.com', 'A'),
('www.amazon.com', 'amazon'),
('www.b.com', 'B');

-- Update all values of description column
UPDATE link
SET description = 'Empty Description';

-- Update only certain colums 
UPDATE link
SET description = 'Name starts with an A'
WHERE name LIKE 'A%';

-- Add RETURNING keyword to get back the updated values.
UPDATE link
SET description = 'Some description'
WHERE id = 3
RETURNING id, url, name, description;

-- Delete row with some condition
SELECT * FROM link;
DELETE from link
WHERE name = 'A'
RETURNING *;

--============================================

--CREATE TABLE account(
--	user_id serial PRIMARY KEY,
--	username varchar(50) UNIQUE NOT NULL,
--	password varchar(50) NOT NULL,
--	email varchar(355) UNIQUE NOT NULL,
--	created_on timestamp NOT NULL,
--	last_login timestamp);

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);


CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
);

SELECT * FROM account a;

INSERT INTO account(username, "password", email, created_on)
VALUES
('Guilherme', 'password', 'guilherme@mail.com', current_timestamp)

INSERT INTO job(job_name)
VALUES
('President')

SELECT * FROM job j;

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1, 50, current_timestamp)

SELECT * FROM account_job aj;

-- ===========================
--UPDATE tables

SELECT * FROM account a;

UPDATE account
SET last_login = current_timestamp

UPDATE account
SET last_login = created_on  -- both will have same value

SELECT * FROM account_job aj;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id

UPDATE account
SET last_login = current_timestamp
RETURNING email, created_on, last_login

-- ===========================
-- DELETE clause

SELECT * FROM job;

INSERT INTO job(job_name)
VALUES
('Cowboy')

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id, job_name

-- ===========================
-- ALTER clause

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
);

SELECT * FROM information i;

ALTER TABLE information
RENAME TO new_info;

SELECT * FROM new_info i;

ALTER TABLE new_info
RENAME COLUMN person TO people;

-- remove constraint
ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

-- and not we can execute the following query:
INSERT INTO new_info(title)
VALUES
('some new value');

-- ===========================
-- DROP clause

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

-- ===========================
-- CHECK constraint

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
);

SELECT * FROM employees;

INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES (
	'Jose',
	'Silva',
	'1990-11-13',
	'2010-12-01',
	1000
)





