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

-- 8 accomplish the following
--   i remove column named 'completed'
--   ii add a column to 'tasks' named 'completed_at' : timestamp, may be NULL, has a default value of NULL
--   iii change 'updated_at' column to not allow NULL values, and have a default vale of 'now()'
--   iv create a new task by only setting values ()
--   v create a new task

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