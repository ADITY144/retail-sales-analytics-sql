-- =====================================================
-- RETAIL SALES ANALYTICS PROJECT
-- File 1: Database Schema
-- Compatible with: MySQL, PostgreSQL, SQLite (minor tweaks may be needed)
-- =====================================================

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Customers Table
CREATE TABLE customers (
    customer_id     INTEGER PRIMARY KEY,
    customer_name   VARCHAR(100) NOT NULL,
    city            VARCHAR(50),
    state           VARCHAR(50),
    signup_date     DATE
);

-- Products Table
CREATE TABLE products (
    product_id      INTEGER PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    category        VARCHAR(50),
    price           DECIMAL(10,2) NOT NULL
);

-- Orders Table (one row per order)
CREATE TABLE orders (
    order_id        INTEGER PRIMARY KEY,
    customer_id     INTEGER NOT NULL,
    order_date      DATE NOT NULL,
    status          VARCHAR(20) DEFAULT 'Completed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table (one row per product within an order)
CREATE TABLE order_items (
    order_item_id   INTEGER PRIMARY KEY,
    order_id        INTEGER NOT NULL,
    product_id      INTEGER NOT NULL,
    quantity        INTEGER NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
