-- Add migration script here
-- backend/migrations/<timestamp>_schema.sql
DROP TABLE IF EXISTS sessions;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS notes (
    id SERIAL PRIMARY KEY,
    message VARCHAR NOT NULL,
    owner VARCHAR NOT NULL,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
);

INSERT INTO notes (message, owner) VALUES ('Hello world!', 'user');

CREATE TABLE IF NOT EXISTS sessions (
    id SERIAL PRIMARY KEY,
    session_id VARCHAR NOT NULL UNIQUE,
    user_id INT NOT NULL UNIQUE
);