-- ==============================
-- CASE

-- Classify customers using CASE
SELECT customer_id,
CASE
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer c;

-- Using CASE expression. In this case our expression is 'customer_id'
SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END
FROM customer c;

-- Making some categories for rental rates
SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film f;

-- Identifying bargain films
SELECT
sum(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains
FROM film f;

-- Improving it
SELECT
sum(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
sum(CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
sum(CASE rental_rate
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film f;

-- CASE: Challenge tasks 
SELECT
sum(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS r,
sum(CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END) AS pg,
sum(CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END) AS pg13
FROM film;

-- ==============================
-- COALESCE: returns the first argument that is NOT null
-- Its is useful when we want to perform some query with null
-- values without modifying it. Ex:
-- SELECT item,(price - COALESCE(discount, 0)) AS final FROM table

-- ==============================
-- CAST: conert one data typo into another

-- error
SELECT CAST('five' AS integer);

SELECT CAST('5' AS integer);

-- or:
SELECT '5'::integer;

SELECT inventory_id FROM rental;

-- error
SELECT char_length(inventory_id) FROM rental;

-- So, lets use CAST to make use of the 'char_length'
SELECT char_length(CAST(inventory_id AS VARCHAR)) FROM rental;

-- ==============================
-- VIEWS: used TO store a query that is used very often, insteado of
-- executing the same query multiple times

SELECT first_name, last_name, address_id FROM customer c;

SELECT address FROM address a;

-- Initial query:
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

-- Create a view for the previous query
CREATE VIEW customer_info AS
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

-- Now we can get the same output with:
SELECT * FROM customer_info;

-- If we want to edit que view (e.g. add 'district' column):
CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

-- To remove a view (use 'IF EXISTS' to prevent errors):
DROP VIEW IF EXISTS customer_info

-- To rename a VIEW:
ALTER VIEW customer_info RENAME TO c_info;

SELECT * FROM c_info;

DROP VIEW c_info;

-- ==============================
-- IMPORT/EXPORT: import data from csv file to already created table
-- The 'simple' table example has been created on 'conditional_expressions.sql'
