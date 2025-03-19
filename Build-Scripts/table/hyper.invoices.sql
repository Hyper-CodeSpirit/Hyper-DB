CREATE TABLE IF NOT EXISTS hyper.invoices (
    id BIGSERIAL PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL,  -- Storing client name
    vehicle VARCHAR(100),  -- Optional vehicle information
    invoice_date DATE NOT NULL,  -- Invoice creation date
    due_date DATE NOT NULL,  -- Due date for payment
    status VARCHAR(20),  -- Enum-like constraint
    amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),  -- Precise currency storage
    service_description TEXT NOT NULL -- Description of service provided
);
