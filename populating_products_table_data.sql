USE `ecommerce_db` ;
INSERT INTO products (product_name, category, price, stock) VALUES
('iPhone 15 Pro', 'Electronics', 999.99, 50),
('Samsung Galaxy S24', 'Electronics', 899.99, 35),
('MacBook Air M2', 'Electronics', 1199.99, 25),
('iPad Air', 'Electronics', 599.99, 40),
('Wireless Headphones', 'Electronics', 149.99, 60),
('Smart Watch', 'Electronics', 199.99, 45),
('Nike Air Max Shoes', 'Clothing', 129.99, 100),
('Levi''s Jeans', 'Clothing', 79.99, 80),
('Cotton T-Shirt', 'Clothing', 24.99, 200),
('Winter Jacket', 'Clothing', 149.99, 35),
('KitchenAid Mixer', 'Home & Kitchen', 299.99, 20),
('Coffee Maker', 'Home & Kitchen', 79.99, 55),
('Air Fryer', 'Home & Kitchen', 89.99, 40),
('Harry Potter Book Set', 'Books', 89.99, 60),
('Yoga Mat', 'Sports', 39.99, 75);
SELECT*
FROM products;