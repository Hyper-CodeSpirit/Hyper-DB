CREATE TABLE IF NOT EXISTS hyper.users (
    id BIGSERIAL PRIMARY KEY,
    user_name VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    avatar TEXT,
    password TEXT,  -- Optional password column
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    authentication_method VARCHAR(50) NOT NULL
);
