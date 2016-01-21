-- 1 delete a user named 'michael' if it exists
ALTER DATABASE todoapp OWNER TO "MicahKoki";
DROP USER IF EXISTS michael;

-- 2 create a user named 'michael' with encrypted password 'stonebreaker'
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- 3 drop a database named 'todoapp' if it exists
DROP DATABASE IF EXISTS todoapp;

-- 4 create a database named todoapp
CREATE DATABASE todoapp;

-- 5 connect to the newly created database
\c todoapp

DROP TABLE IF EXISTS tasks;
-- 6 create a table named 'tasks'
-- 7 define column 'id' as the table's primary key

CREATE TABLE tasks
(
id serial PRIMARY KEY NOT NULL,
title varchar(255) NOT NULL,
description text,
created_at timestamp NOT NULL DEFAULT now(),
updated_at timestamp,
completed boolean NOT NULL DEFAULT false
);

-- 8

ALTER TABLE tasks
  DROP COLUMN completed,
  ADD COLUMN completed_at timestamp NULL,
  ALTER COLUMN completed_at SET DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks VALUES ( default, 'Study SQL', 'Complete this exercise', now(), now(), NULL );
INSERT INTO tasks VALUES ( default, 'Study PostgreSQL', 'Read all the documentation' );

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks VALUES ( default, 'mistake 1', 'a test entry' );
INSERT INTO tasks VALUES ( default, 'mistake 2', 'another test entry' );
INSERT INTO tasks VALUES ( default, 'third mistake', 'another test entry' );

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;