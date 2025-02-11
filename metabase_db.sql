-- Create a new database
CREATE DATABASE metabase_demo;

-- Connect to the database
\c metabase_demo;

-- Create customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    signup_date DATE
);

-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    total_price DECIMAL(10,2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert customers
INSERT INTO customers (name, email, signup_date) VALUES
('Alice Johnson', 'alice@example.com', '2024-01-10'),
('Bob Smith', 'bob@example.com', '2024-02-15'),
('Charlie Brown', 'charlie@example.com', '2024-03-05');

-- Insert products
INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Headphones', 'Accessories', 150.00),
('Gaming Mouse', 'Accessories', 50.00),
('Office Chair', 'Furniture', 250.00);

-- Insert orders
INSERT INTO orders (customer_id, product_id, quantity, total_price, order_date) VALUES
(1, 1, 1, 1200.00, '2024-04-01 10:30:00'),
(2, 2, 2, 1600.00, '2024-04-02 14:15:00'),
(3, 3, 1, 150.00, '2024-04-03 09:45:00'),
(1, 4, 3, 150.00, '2024-04-04 16:20:00'),
(2, 5, 1, 250.00, '2024-04-05 12:10:00');
