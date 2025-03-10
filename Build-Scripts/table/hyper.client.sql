CREATE TABLE IF NOT EXISTS hyper.client (
    client_id BIGSERIAL PRIMARY KEY,
    client_name VARCHAR(200) NOT NULL UNIQUE,
    client_NIC VARCHAR(100) NOT NULL UNIQUE,
    client_phone VARCHAR(15) NOT NULL CHECK (client_phone ~ '^[0-9]+$'),
    client_address VARCHAR(100) NOT NULL,
    client_email VARCHAR(100) NOT NULL UNIQUE,
    password TEXT,  -- Optional password column
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    authentication_method VARCHAR(50) NOT NULL
);
