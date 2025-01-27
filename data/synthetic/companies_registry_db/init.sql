CREATE TABLE companies (
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    incorporation_date DATE,
    address TEXT,
    revenue NUMERIC,
    profit NUMERIC
);

CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies(company_id),
    name VARCHAR(255),
    appointment_date DATE,
    nationality VARCHAR(100)
);

INSERT INTO companies (name, incorporation_date, address, revenue, profit) VALUES
('Global Trade Corp', '2020-01-15', '12 Offshore Lane, Panama City, Panama', 1000000, -50000),
('Sunrise Holdings', '2021-03-22', '456 Shell Street, Delaware, USA', 5000000, 100000),
('Green Energy Ltd', '2022-05-10', '89 Clean Avenue, Oslo, Norway', 800000, 200000),
('Alpha Consulting', '2019-11-05', '123 Fraud Lane, Moscow, Russia', 1500000, 10000),
('Beta Ventures', '2023-02-14', '78 High Street, London, UK', 300000, 50000);

INSERT INTO directors (company_id, name, appointment_date, nationality) VALUES
(1, 'Ivan Petrov', '2020-02-01', 'Russian'),
(1, 'Maria Ivanova', '2021-04-15', 'Russian'),
(2, 'John Smith', '2021-03-22', 'American'),
(3, 'Elena Berg', '2022-05-10', 'Norwegian'),
(4, 'Sergei Volkov', '2019-11-05', 'Russian'),
(4, 'Anna Kovac', '2020-06-20', 'Hungarian'),
(5, 'David Miller', '2023-02-14', 'British');