-- Active: 1685615688536@@127.0.0.1@5432@postgres@public
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(64) UNIQUE,
    created_at TIMESTAMP,
    modifed_at TIMESTAMP
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date TIMESTAMP,
    created_at TIMESTAMP,
    modified_at TIMESTAMP
);

CREATE TABLE users_events (
    id SERIAL PRIMARY KEY,
    event_id BIGINT REFERENCES events(id),
    user_id BIGINT REFERENCES users(id)
);

CREATE TABLE users_telegram (
    id SERIAL PRIMARY KEY,
    telegram_id BIGINT UNIQUE,
    user_id BIGINT REFERENCES users(id)
);

CREATE TABLE users_discord (
    id SERIAL PRIMARY KEY,
    discord_id BIGINT UNIQUE,
    user_id BIGINT REFERENCES users(id)
);


INSERT INTO users (email, created_at, modifed_at)
        VALUES ('test@tezt.com', now(), now());