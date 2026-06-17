-- =========================================
-- Schema & Sample Data: Revenue Drop Analysis
-- =========================================

CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    customer_id INT,
    product VARCHAR(255),
    category VARCHAR(100),
    quantity INT,
    price INT,
    region VARCHAR(100)
);

INSERT INTO sales VALUES
-- JANUARI 2024
(1,  '2024-01-03', 101, 'Laptop Pro',         'Electronics', 3,  5000000, 'East'),
(2,  '2024-01-05', 102, 'Wireless Mouse',      'Accessories', 10, 250000,  'East'),
(3,  '2024-01-07', 103, 'Mechanical Keyboard', 'Accessories', 7,  700000,  'East'),
(4,  '2024-01-10', 104, 'Monitor 27"',         'Electronics', 2,  3500000, 'East'),
(5,  '2024-01-12', 105, 'Laptop Pro',          'Electronics', 5,  5000000, 'West'),
(6,  '2024-01-14', 106, 'Wireless Mouse',      'Accessories', 15, 250000,  'West'),
(7,  '2024-01-16', 107, 'Mechanical Keyboard', 'Accessories', 10, 700000,  'West'),
(8,  '2024-01-18', 108, 'Monitor 27"',         'Electronics', 4,  3500000, 'West'),
(9,  '2024-01-20', 109, 'Laptop Pro',          'Electronics', 2,  5000000, 'North'),
(10, '2024-01-22', 110, 'Wireless Mouse',      'Accessories', 8,  250000,  'North'),
(11, '2024-01-24', 111, 'Mechanical Keyboard', 'Accessories', 5,  700000,  'North'),
(12, '2024-01-26', 112, 'Monitor 27"',         'Electronics', 3,  3500000, 'North'),
(13, '2024-01-28', 113, 'Laptop Pro',          'Electronics', 4,  5000000, 'South'),
(14, '2024-01-30', 114, 'Wireless Mouse',      'Accessories', 12, 250000,  'South'),
(15, '2024-01-31', 115, 'Mechanical Keyboard', 'Accessories', 6,  700000,  'South'),

-- FEBRUARI 2024
(16, '2024-02-02', 101, 'Laptop Pro',          'Electronics', 1,  5000000, 'East'),
(17, '2024-02-04', 102, 'Wireless Mouse',      'Accessories', 8,  250000,  'East'),
(18, '2024-02-06', 103, 'Mechanical Keyboard', 'Accessories', 7,  700000,  'East'),
(19, '2024-02-08', 104, 'Monitor 27"',         'Electronics', 2,  3500000, 'East'),
(20, '2024-02-10', 105, 'Laptop Pro',          'Electronics', 4,  5000000, 'West'),
(21, '2024-02-12', 106, 'Wireless Mouse',      'Accessories', 20, 250000,  'West'),
(22, '2024-02-14', 107, 'Mechanical Keyboard', 'Accessories', 8,  700000,  'West'),
(23, '2024-02-16', 108, 'Monitor 27"',         'Electronics', 4,  3500000, 'West'),
(24, '2024-02-18', 109, 'Laptop Pro',          'Electronics', 1,  5000000, 'North'),
(25, '2024-02-20', 110, 'Wireless Mouse',      'Accessories', 10, 250000,  'North'),
(26, '2024-02-22', 111, 'Mechanical Keyboard', 'Accessories', 3,  700000,  'North'),
(27, '2024-02-24', 112, 'Monitor 27"',         'Electronics', 2,  3500000, 'North'),
(28, '2024-02-26', 113, 'Laptop Pro',          'Electronics', 4,  5000000, 'South'),
(29, '2024-02-28', 114, 'Wireless Mouse',      'Accessories', 10, 250000,  'South'),
(30, '2024-02-29', 115, 'Mechanical Keyboard', 'Accessories', 8,  700000,  'South'),

-- MARET 2024
(31, '2024-03-02', 101, 'Laptop Pro',          'Electronics', 4,  5000000, 'East'),
(32, '2024-03-04', 102, 'Wireless Mouse',      'Accessories', 12, 250000,  'East'),
(33, '2024-03-06', 103, 'Mechanical Keyboard', 'Accessories', 9,  700000,  'East'),
(34, '2024-03-08', 104, 'Monitor 27"',         'Electronics', 3,  3500000, 'East'),
(35, '2024-03-10', 105, 'Laptop Pro',          'Electronics', 6,  5000000, 'West'),
(36, '2024-03-12', 106, 'Wireless Mouse',      'Accessories', 18, 250000,  'West'),
(37, '2024-03-14', 107, 'Mechanical Keyboard', 'Accessories', 12, 700000,  'West'),
(38, '2024-03-16', 108, 'Monitor 27"',         'Electronics', 3,  3500000, 'West'),
(39, '2024-03-18', 109, 'Laptop Pro',          'Electronics', 3,  5000000, 'North'),
(40, '2024-03-20', 110, 'Wireless Mouse',      'Accessories', 7,  250000,  'North'),
(41, '2024-03-22', 111, 'Mechanical Keyboard', 'Accessories', 6,  700000,  'North'),
(42, '2024-03-24', 112, 'Monitor 27"',         'Electronics', 4,  3500000, 'North'),
(43, '2024-03-26', 113, 'Laptop Pro',          'Electronics', 5,  5000000, 'South'),
(44, '2024-03-28', 114, 'Wireless Mouse',      'Accessories', 14, 250000,  'South'),
(45, '2024-03-30', 115, 'Mechanical Keyboard', 'Accessories', 7,  700000,  'South'),

-- APRIL 2024
(46, '2024-04-02', 101, 'Laptop Pro',          'Electronics', 2,  5000000, 'East'),
(47, '2024-04-04', 102, 'Wireless Mouse',      'Accessories', 9,  250000,  'East'),
(48, '2024-04-06', 103, 'Mechanical Keyboard', 'Accessories', 11, 700000,  'East'),
(49, '2024-04-08', 104, 'Monitor 27"',         'Electronics', 4,  3500000, 'East'),
(50, '2024-04-10', 105, 'Laptop Pro',          'Electronics', 7,  5000000, 'West'),
(51, '2024-04-12', 106, 'Wireless Mouse',      'Accessories', 16, 250000,  'West'),
(52, '2024-04-14', 107, 'Mechanical Keyboard', 'Accessories', 10, 700000,  'West'),
(53, '2024-04-16', 108, 'Monitor 27"',         'Electronics', 5,  3500000, 'West'),
(54, '2024-04-18', 109, 'Laptop Pro',          'Electronics', 2,  5000000, 'North'),
(55, '2024-04-20', 110, 'Wireless Mouse',      'Accessories', 11, 250000,  'North'),
(56, '2024-04-22', 111, 'Mechanical Keyboard', 'Accessories', 4,  700000,  'North'),
(57, '2024-04-24', 112, 'Monitor 27"',         'Electronics', 3,  3500000, 'North'),
(58, '2024-04-26', 113, 'Laptop Pro',          'Electronics', 6,  5000000, 'South'),
(59, '2024-04-28', 114, 'Wireless Mouse',      'Accessories', 13, 250000,  'South'),
(60, '2024-04-30', 115, 'Mechanical Keyboard', 'Accessories', 9,  700000,  'South');