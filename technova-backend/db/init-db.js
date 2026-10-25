/* ============================================================
   TechNova - database setup script
   Run with:  npm run init-db
   Creates db/technova.db, builds all tables from schema.sql,
   inserts the demo users (passwords hashed), then loads seed.sql.
   ============================================================ */
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const Database = require('better-sqlite3');

const DB_PATH = path.join(__dirname, 'technova.db');
const SCHEMA_PATH = path.join(__dirname, 'schema.sql');
const SEED_PATH = path.join(__dirname, 'seed.sql');

// Salted scrypt hash, stored as "salt:hash" (no plain-text passwords in the database)
function hashPassword(password) {
  const salt = crypto.randomBytes(16).toString('hex');
  const hash = crypto.scryptSync(password, salt, 64).toString('hex');
  return salt + ':' + hash;
}

// Demo accounts (same admin login as the frontend prototype)
const DEMO_USERS = [
  { name: 'Admin',        email: 'admin@technova.com', password: 'admin123',    role: 'admin' },
  { name: 'Sarah Nguyen', email: 'sarah@example.com',  password: 'customer123', role: 'customer' },
  { name: 'Tom Baker',    email: 'tom@example.com',    password: 'customer123', role: 'customer' },
  { name: 'Priya Patel',  email: 'priya@example.com',  password: 'customer123', role: 'customer' }
];

if (fs.existsSync(DB_PATH)) fs.unlinkSync(DB_PATH);   // start fresh each run

const db = new Database(DB_PATH);
db.pragma('foreign_keys = ON');

db.exec(fs.readFileSync(SCHEMA_PATH, 'utf8'));
console.log('Tables created from schema.sql');

// Users first, so the orders in seed.sql can reference them.
// (Admin is user_id 1; customers are 2-4.)
const insertUser = db.prepare(
  'INSERT INTO users (name, email, password_hash, role) VALUES (?, ?, ?, ?)'
);
DEMO_USERS.forEach(u => insertUser.run(u.name, u.email, hashPassword(u.password), u.role));
console.log('Demo users inserted: ' + DEMO_USERS.length);

db.exec(fs.readFileSync(SEED_PATH, 'utf8'));
console.log('Sample data loaded from seed.sql');

['categories', 'brands', 'products', 'users', 'orders', 'order_items', 'contact_messages']
  .forEach(t => console.log('  ' + t.padEnd(18) + db.prepare('SELECT COUNT(*) AS n FROM ' + t).get().n + ' rows'));

db.close();
console.log('Database ready: ' + DB_PATH);
