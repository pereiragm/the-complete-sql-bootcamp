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

-- Create table from another one preserving the same structure
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
('www.b.com', 'B');


