-- =========================================
-- Schema & Sample Data: Product Performance & Inventory Analysis
-- =========================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    cost_price INT,
    sell_price INT,
    stock_qty INT
);

INSERT INTO products VALUES
-- ELECTRONICS
(1, 'Laptop Pro 14"',        'Electronics',  8000000, 12000000, 5),
(2, 'Wireless Earbuds',      'Electronics',  300000,  650000,   120),
(3, 'Smart Watch',           'Electronics',  900000,  1800000,  60),
(4, 'Power Bank 20000mAh',   'Electronics',  150000,  350000,   200),
(5, 'Bluetooth Speaker',     'Electronics',  250000,  550000,   8),

-- FASHION
(6, 'Sneakers Casual',       'Fashion',      200000,  450000,   150),
(7, 'Denim Jacket',          'Fashion',      180000,  400000,   90),
(8, 'Tote Bag Canvas',       'Fashion',      80000,   200000,   15),
(9, 'Sunglasses UV Protect', 'Fashion',      60000,   180000,   300),
(10, 'Cotton T-Shirt',       'Fashion',      40000,   120000,   500),

-- HOME & LIVING
(11, 'Aroma Diffuser',       'Home & Living', 120000, 280000,   10),
(12, 'Ceramic Mug Set',      'Home & Living', 50000,  150000,   250),
(13, 'LED Desk Lamp',        'Home & Living', 90000,  220000,   180),
(14, 'Storage Box Organizer','Home & Living', 70000,  180000,   6),
(15, 'Throw Pillow',         'Home & Living', 45000,  130000,   220);


CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    quantity_sold INT
);

INSERT INTO order_items VALUES
(1, '2024-05-02', 1, 8),
(2, '2024-05-10', 1, 6),
(3, '2024-05-18', 1, 9),
(4, '2024-05-25', 1, 7),
(5, '2024-05-03', 2, 25),
(6, '2024-05-09', 2, 30),
(7, '2024-05-16', 2, 28),
(8, '2024-05-23', 2, 22),
(9, '2024-05-04', 3, 12),
(10, '2024-05-15', 3, 15),
(11, '2024-05-26', 3, 10),
(12, '2024-05-05', 4, 40),
(13, '2024-05-12', 4, 35),
(14, '2024-05-20', 4, 38),
(15, '2024-05-06', 5, 15),
(16, '2024-05-14', 5, 18),
(17, '2024-05-22', 5, 12),
(18, '2024-05-07', 6, 45),
(19, '2024-05-17', 6, 50),
(20, '2024-05-28', 6, 40),
(21, '2024-05-08', 7, 20),
(22, '2024-05-19', 7, 18),
(23, '2024-05-11', 8, 3),
(24, '2024-05-21', 8, 2),
(25, '2024-05-13', 9, 8),
(26, '2024-05-24', 9, 5),
(27, '2024-05-09', 10, 15),
(28, '2024-05-20', 10, 10),
(29, '2024-05-06', 11, 6),
(30, '2024-05-18', 11, 5),
(31, '2024-05-10', 12, 12),
(32, '2024-05-25', 12, 8),
(33, '2024-05-07', 13, 22),
(34, '2024-05-19', 13, 25),
(35, '2024-05-08', 14, 10),
(36, '2024-05-21', 14, 8),
(37, '2024-05-12', 15, 9),
(38, '2024-05-27', 15, 6);