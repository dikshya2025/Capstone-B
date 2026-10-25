-- ============================================================
-- TechNova database schema (SQLite)
-- Capstone B - Sprint 3
-- ============================================================
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS contact_messages;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS brands;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

-- Product categories (smartphones, laptops, ...)
CREATE TABLE categories (
  category_id  INTEGER PRIMARY KEY AUTOINCREMENT,
  slug         TEXT NOT NULL UNIQUE,
  name         TEXT NOT NULL,
  emoji        TEXT
);

-- Brands (apple, sony, ...)
CREATE TABLE brands (
  brand_id  INTEGER PRIMARY KEY AUTOINCREMENT,
  slug      TEXT NOT NULL UNIQUE,
  name      TEXT NOT NULL
);

-- Product catalogue (matches the frontend products-data.js)
CREATE TABLE products (
  product_id   INTEGER PRIMARY KEY AUTOINCREMENT,
  name         TEXT NOT NULL,
  category_id  INTEGER NOT NULL,
  brand_id     INTEGER NOT NULL,
  price        REAL NOT NULL CHECK (price >= 0),
  stock        INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
  rating       REAL DEFAULT 0,
  review_count INTEGER DEFAULT 0,
  emoji        TEXT,
  tag          TEXT,
  tag_class    TEXT,
  short_desc   TEXT,
  full_desc    TEXT,
  specs_json   TEXT,
  created_at   TEXT NOT NULL DEFAULT (datetime('now')),
  FOREIGN KEY (category_id) REFERENCES categories(category_id),
  FOREIGN KEY (brand_id)    REFERENCES brands(brand_id)
);

-- Customers and admins (password stored as a salted scrypt hash)
CREATE TABLE users (
  user_id        INTEGER PRIMARY KEY AUTOINCREMENT,
  name           TEXT NOT NULL,
  email          TEXT NOT NULL UNIQUE,
  password_hash  TEXT NOT NULL,
  role           TEXT NOT NULL DEFAULT 'customer' CHECK (role IN ('customer','admin')),
  created_at     TEXT NOT NULL DEFAULT (datetime('now'))
);

-- Customer orders
CREATE TABLE orders (
  order_id     INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id      INTEGER NOT NULL,
  status       TEXT NOT NULL DEFAULT 'pending'
               CHECK (status IN ('pending','paid','shipped','delivered','cancelled')),
  total_amount REAL NOT NULL DEFAULT 0,
  created_at   TEXT NOT NULL DEFAULT (datetime('now')),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Line items inside an order
CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_id      INTEGER NOT NULL,
  product_id    INTEGER NOT NULL,
  quantity      INTEGER NOT NULL CHECK (quantity > 0),
  unit_price    REAL NOT NULL,
  FOREIGN KEY (order_id)   REFERENCES orders(order_id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Messages sent from the Contact page
CREATE TABLE contact_messages (
  message_id  INTEGER PRIMARY KEY AUTOINCREMENT,
  name        TEXT NOT NULL,
  email       TEXT NOT NULL,
  subject     TEXT,
  message     TEXT NOT NULL,
  created_at  TEXT NOT NULL DEFAULT (datetime('now'))
);
