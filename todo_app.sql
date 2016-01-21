-- 1 delete a user named 'michael' if it exists
ALTER DATABASE todoapp OWNER TO "MicahKoki";
DROP USER IF EXISTS michael;

-- 2 create a user named 'michael' with encrypted password 'stonebreaker'
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

