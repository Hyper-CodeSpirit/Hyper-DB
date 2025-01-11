CREATE TABLE IF NOT EXISTS hyper.user (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(100)
);