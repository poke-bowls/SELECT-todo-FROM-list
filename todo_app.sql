-- 1 delete a user named 'michael' if it exists
ALTER DATABASE todoapp OWNER TO "MicahKoki";
DROP USER IF EXISTS michael;

-- 2 create a user named 'michael' with encrypted password 'stonebreaker'
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- 3 drop a database named 'todoapp' if it exists
DROP DATABASE IF EXISTS todoapp;

-- 4 create a database named todoapp
CREATE DATABASE todoapp;

