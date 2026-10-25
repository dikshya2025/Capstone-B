/* ============================================================
   TechNova - Backend Server (Sprint 3)
   Express + SQLite (better-sqlite3)
   Start with:  npm start     then open http://localhost:3000
   ============================================================ */
const path = require('path');
const fs = require('fs');
const express = require('express');
const Database = require('better-sqlite3');

const PORT = process.env.PORT || 3000;
const DB_PATH = path.join(__dirname, 'db', 'technova.db');

if (!fs.existsSync(DB_PATH)) {
  console.error('Database not found. Run "npm run init-db" first.');
  process.exit(1);
}

const db = new Database(DB_PATH, { readonly: true });
const app = express();
app.use(express.json());

// Allow the frontend (opened from a file or another port) to call this API
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  next();
});

// Turns a products row into the shape the frontend expects
function formatProduct(row) {
  return {
    id: row.product_id,
    name: row.name,
    cat: row.category,
    brand: row.brand,
    price: row.price,
    stock: row.stock,
    rating: row.rating,
    reviews: row.review_count,
    emoji: row.emoji,
    tag: row.tag,
    tagClass: row.tag_class,
    desc: row.short_desc,
    fullDesc: row.full_desc,
    specs: JSON.parse(row.specs_json || '{}')
  };
}

const PRODUCT_SELECT = `
  SELECT p.*, c.slug AS category, b.slug AS brand
  FROM products p
  JOIN categories c ON c.category_id = p.category_id
  JOIN brands b     ON b.brand_id    = p.brand_id`;

// Home: simple status page (shown in the browser at http://localhost:3000)
app.get('/', (req, res) => {
  const count = db.prepare('SELECT COUNT(*) AS n FROM products').get().n;
  res.send(`
    <h1>TechNova Backend is running</h1>
    <p>Database connected. Products in database: <strong>${count}</strong></p>
    <ul>
      <li><a href="/api/health">/api/health</a></li>
      <li><a href="/api/products">/api/products</a></li>
      <li><a href="/api/products/1">/api/products/1</a></li>
      <li><a href="/api/products?cat=audio">/api/products?cat=audio</a></li>
      <li><a href="/api/categories">/api/categories</a></li>
    </ul>`);
});

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', service: 'technova-backend', time: new Date().toISOString() });
});

app.get('/api/categories', (req, res) => {
  res.json(db.prepare('SELECT category_id AS id, slug, name, emoji FROM categories').all());
});

// All products, optional ?cat=audio filter
app.get('/api/products', (req, res) => {
  const rows = req.query.cat
    ? db.prepare(PRODUCT_SELECT + ' WHERE c.slug = ? ORDER BY p.product_id').all(String(req.query.cat))
    : db.prepare(PRODUCT_SELECT + ' ORDER BY p.product_id').all();
  res.json(rows.map(formatProduct));
});

app.get('/api/products/:id', (req, res) => {
  const row = db.prepare(PRODUCT_SELECT + ' WHERE p.product_id = ?').get(Number(req.params.id));
  if (!row) return res.status(404).json({ error: 'Product not found' });
  res.json(formatProduct(row));
});

app.use((req, res) => res.status(404).json({ error: 'Route not found' }));

app.listen(PORT, () => {
  console.log('TechNova server running on http://localhost:' + PORT);
});
