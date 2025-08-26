USE ecommerce_db;

-- 1. Insert 30 Products
INSERT INTO products (product_name, category, price, stock) VALUES
('iPhone 15 Pro', 'Electronics', 999.99, 50),
('Samsung Galaxy S24', 'Electronics', 899.99, 35),
('Google Pixel 8', 'Electronics', 799.99, 40),
('Nike Air Max Shoes', 'Clothing', 129.99, 100),
('Adidas Ultraboost', 'Clothing', 149.99, 80),
('Levi''s Jeans', 'Clothing', 79.99, 75),
('MacBook Air M2', 'Electronics', 1199.99, 25),
('Dell XPS 13', 'Electronics', 999.99, 30),
('iPad Air', 'Electronics', 599.99, 45),
('KitchenAid Mixer', 'Home & Kitchen', 299.99, 30),
('Instant Pot', 'Home & Kitchen', 89.99, 60),
('Air Fryer', 'Home & Kitchen', 79.99, 55),
('Harry Potter Book Set', 'Books', 89.99, 40),
('Python Programming Book', 'Books', 49.99, 100),
('The Alchemist', 'Books', 14.99, 200),
('Yoga Mat', 'Sports', 39.99, 60),
('Dumbbell Set', 'Sports', 129.99, 25),
('Basketball', 'Sports', 29.99, 90),
('Coffee Maker', 'Home & Kitchen', 79.99, 45),
('Wireless Headphones', 'Electronics', 149.99, 55),
('Smart Watch', 'Electronics', 199.99, 40),
('Gaming Mouse', 'Electronics', 59.99, 70),
('Mechanical Keyboard', 'Electronics', 89.99, 65),
('4K Monitor', 'Electronics', 299.99, 20),
('Bluetooth Speaker', 'Electronics', 79.99, 50),
('Desk Lamp', 'Home & Kitchen', 34.99, 120),
('Office Chair', 'Furniture', 199.99, 15),
('Water Bottle', 'Kitchen', 24.99, 200),
('Backpack', 'Fashion', 49.99, 80),
('Sunglasses', 'Fashion', 89.99, 60);

-- 2. Insert Customers  
INSERT INTO customers (first_name, last_name, email, password, address, city, phone) VALUES
('John', 'Doe', 'john@email.com', 'password123', '123 Main St', 'New York', '555-0101'),
('Jane', 'Smith', 'jane@email.com', 'password123', '456 Oak Ave', 'Los Angeles', '555-0102'),
('Bob', 'Johnson', 'bob@email.com', 'password123', '789 Pine Rd', 'Chicago', '555-0103'),
('Sarah', 'Wilson', 'sarah@email.com', 'password123', '321 Elm St', 'Miami', '555-0104'),
('Mike', 'Brown', 'mike@email.com', 'password123', '654 Maple Dr', 'Seattle', '555-0105'),
('Emily', 'Davis', 'emily@email.com', 'password123', '987 Cedar Ln', 'Boston', '555-0106'),
('David', 'Miller', 'david@email.com', 'password123', '654 Birch St', 'Austin', '555-0107'),
('Lisa', 'Anderson', 'lisa@email.com', 'password123', '321 Spruce Ave', 'Denver', '555-0108'),
('Chris', 'Taylor', 'chris@email.com', 'password123', '159 Willow Way', 'Phoenix', '555-0109'),
('Amy', 'Thomas', 'amy@email.com', 'password123', '753 Palm Blvd', 'San Diego', '555-0110');

-- 3. Insert Orders
INSERT INTO orders (customer_id, order_date, total_order_amount, billing_address, payment_method, customers_idcustomers, customers_idcustomers1) VALUES
(1, '2024-01-15 10:30:00', 1129.98, '123 Main St, New York', 'Credit Card', 1, 1),
(2, '2024-01-16 14:45:00', 179.98, '456 Oak Ave, Los Angeles', 'PayPal', 2, 2),
(1, '2024-01-17 09:15:00', 49.99, '123 Main St, New York', 'Credit Card', 1, 1),
(3, '2024-01-18 16:20:00', 299.99, '789 Pine Rd, Chicago', 'Debit Card', 3, 3),
(4, '2024-01-19 11:00:00', 129.99, '321 Elm St, Miami', 'PayPal', 4, 4),
(5, '2024-01-20 13:15:00', 199.99, '654 Maple Dr, Seattle', 'Credit Card', 5, 5),
(6, '2024-01-21 15:30:00', 89.99, '987 Cedar Ln, Boston', 'Apple Pay', 6, 6),
(7, '2024-01-22 09:45:00', 149.99, '654 Birch St, Austin', 'Credit Card', 7, 7),
(8, '2024-01-23 11:20:00', 79.99, '321 Spruce Ave, Denver', 'PayPal', 8, 8),
(9, '2024-01-24 14:10:00', 299.99, '159 Willow Way, Phoenix', 'Debit Card', 9, 9),
(10, '2024-01-25 16:40:00', 599.99, '753 Palm Blvd, San Diego', 'Credit Card', 10, 10);
SELECT '30 Products inserted:' AS '';
SELECT *
FROM products;
SELECT *
FROM customers;
SELECT *
FROM ;
INSERT INTO order_items (idorder_items, order_id, product_id, quantity, unit_price, orders_idorders, orders_customers_idcustomers, products_idproducts1) VALUES
-- Order 1 (Customer 1)
(1, 1, 1, 1, 999.99, 1, 1, 1),    -- iPhone 15 Pro
(2, 1, 8, 1, 149.99, 1, 1, 8),    -- Wireless Headphones
(3, 1, 12, 1, 199.99, 1, 1, 12),  -- Smart Watch

-- Order 2 (Customer 2)  
(4, 2, 4, 2, 129.99, 2, 2, 4),    -- 2x Nike Shoes
(5, 2, 5, 1, 79.99, 2, 2, 5),     -- Levi's Jeans

-- Order 3 (Customer 3)
(6, 3, 6, 1, 299.99, 3, 3, 6),    -- KitchenAid Mixer
(7, 3, 7, 1, 79.99, 3, 3, 7),     -- Coffee Maker
(8, 3, 14, 1, 34.99, 3, 3, 14),   -- Desk Lamp

-- Order 4 (Customer 4)
(9, 4, 3, 1, 1199.99, 4, 4, 3),   -- MacBook Air M2
(10, 4, 9, 1, 39.99, 4, 4, 9),    -- Yoga Mat

-- Order 5 (Customer 5)
(11, 5, 10, 1, 89.99, 5, 5, 10),  -- Harry Potter Book Set
(12, 5, 2, 1, 899.99, 5, 5, 2),   -- Samsung Galaxy S24

-- Order 6 (Customer 1 - Second order)
(13, 6, 11, 1, 599.99, 6, 1, 11), -- iPad Air
(14, 6, 13, 1, 79.99, 6, 1, 13),  -- Bluetooth Speaker

-- Order 7 (Customer 6)
(15, 7, 4, 1, 129.99, 7, 6, 4),   -- Nike Shoes
(16, 7, 8, 1, 149.99, 7, 6, 8),   -- Wireless Headphones
(17, 7, 15, 1, 49.99, 7, 6, 15),  -- Backpack

-- Order 8 (Customer 7)
(18, 8, 1, 1, 999.99, 8, 7, 1),   -- iPhone 15 Pro
(19, 8, 12, 1, 199.99, 8, 7, 12), -- Smart Watch

-- Order 9 (Customer 8)
(20, 9, 6, 1, 299.99, 9, 8, 6),   -- KitchenAid Mixer
(21, 9, 7, 1, 79.99, 9, 8, 7),    -- Coffee Maker
(22, 9, 9, 1, 39.99, 9, 8, 9),    -- Yoga Mat

-- Order 10 (Customer 9)
(23, 10, 3, 1, 1199.99, 10, 9, 3), -- MacBook Air M2
(24, 10, 8, 1, 149.99, 10, 9, 8),  -- Wireless Headphones
(25, 10, 13, 1, 79.99, 10, 9, 13), -- Bluetooth Speaker
(26, 10, 14, 1, 34.99, 10, 9, 14); -- Desk Lamp