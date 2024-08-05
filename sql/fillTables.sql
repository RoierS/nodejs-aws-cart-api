-- Insert test data into users table
insert into users (name, email) values
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Brown', 'bob.brown@example.com'),
('Charlie Davis', 'charlie.davis@example.com'),
('John Smith', 'john.smith@example.com');

-- Insert test data into carts table
insert into carts (user_id, created_at, updated_at, status) values
('5669968e-b96c-46fd-9269-9c8f3ff154dd', '2024-07-23', '2024-07-23', 'OPEN'),
('7fa50bff-89f8-4005-9c0f-7cb0a374382d', '2024-07-24', '2024-07-24', 'ORDERED'),
('49ebe2c9-4799-4e97-9985-0b3521119c1a', '2024-07-25', '2024-07-25', 'OPEN'),
('9d7619c8-1454-404a-866c-f585f3d03a02', '2024-07-25', '2024-07-25', 'ORDERED');

-- Insert test data into cart_items table
insert into cart_items (cart_id, product_id, count) values
('373db379-22cc-4b8c-b226-f4e585ffbeb6', '3d7e5331-2bfc-4e2b-bb2b-c6446e6c316b', 1),
('309522d0-3953-4359-b6be-537495e5dead', '3366b555-617c-45d0-88ea-224f0225e489', 5),
('92707637-31fc-4c17-bafe-2ad57bd9e429', 'c9901dce-24f6-458b-bdb6-7661db8d7f61', 2),
('403fb94a-f7e8-449f-9c97-e948b67eb016', '73ad8198-af37-450f-9070-d1669af17a2e', 4);

-- Insert test data into products table
insert into products (title, description, price) values
('T-shirt', 'Comfortable cotton t-shirt', 15.99),
('Jeans', 'Classic denim jeans', 29.99),
('Hoodie', 'Warm fleece hoodie', 24.99),
('Sneakers', 'Stylish sports sneakers', 39.99);

-- Insert test data into orders table
insert into orders (user_id, cart_id, payment, delivery, comments, status, total) values
('5669968e-b96c-46fd-9269-9c8f3ff154dd', '373db379-22cc-4b8c-b226-f4e585ffbeb6', '{}', '{}', 'I want to order this product', 'OPEN', 1),
('7fa50bff-89f8-4005-9c0f-7cb0a374382d', '309522d0-3953-4359-b6be-537495e5dead', '{}', '{}', 'I want to order this product', 'OPEN', 10);




