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

