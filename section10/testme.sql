-- ==============================
-- NULLIF: takes 2 inputs and returns null if both args are equal,
-- otherwise it returns the first argument passed.

CREATE TABLE depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);

INSERT INTO depts(first_name, department)
VALUES
('Vinton', 'A'),
('Lauren', 'A'),
('Claire', 'B');

SELECT * FROM depts;

-- Lets calculate the ratio of male and female members
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) /
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts

-- After running this query, the previous one returns an error...
DELETE FROM depts WHERE department = 'B';

-- Let's rewrite it using NULLIF. Now, the query does not not break
-- anymore and returns NULL instead.
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) /
NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0)
) AS department_ratio
FROM depts





