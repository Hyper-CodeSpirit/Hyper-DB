CREATE TABLE IF NOT EXISTS hyper.vehicle (
    vehicle_id BIGSERIAL PRIMARY KEY,
    vehicle_plate_number VARCHAR(10) NOT NULL UNIQUE,
    vehicle_type VARCHAR(50) NOT NULL,
    vehicle_model VARCHAR(50) NOT NULL,
    vehicle_year INTEGER,
    vehicle_color VARCHAR(50) NOT NULL,
    vehicle_owner BIGINT NOT NULL, 
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    authentication_method VARCHAR(50) NOT NULL,
    CONSTRAINT fk_vehicle_owner FOREIGN KEY (vehicle_owner) REFERENCES hyper.client(client_id) ON DELETE CASCADE
);
