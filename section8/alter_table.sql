DROP TABLE IF EXISTS link;

CREATE TABLE link(
	link_id serial PRIMARY KEY, -- serial type is autoincrementable
	title VARCHAR(512) NOT NULL,
	url VARCHAR(1024) NOT NULL UNIQUE
);
