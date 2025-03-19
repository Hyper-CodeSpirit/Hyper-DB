CREATE TABLE IF NOT EXISTS hyper.invoices (
    id BIGSERIAL PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL, 
    vehicle VARCHAR(100),
    invoice_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(20), 
    amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0), 
    service_description TEXT NOT NULL
);
