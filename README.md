# Retail Sales Analytics — SQL Project (Beginner)

Ek chhota, realistic e-commerce/retail dataset jispe aap business analytics queries practice kar sakte ho — revenue, top products, top customers, monthly trends, retention, etc.

## Files
1. **01_schema.sql** — 4 tables banata hai: `customers`, `products`, `orders`, `order_items`
2. **02_sample_data.sql** — 15 customers, 15 products, 30 orders, 45 order items ka sample data
3. **03_analysis_queries.sql** — 15 ready-made analysis queries (business questions ke saath)

## Kaise Run Karein
- **SQLite** (easiest, no install needed): [sqliteonline.com](https://sqliteonline.com) ya DB Browser for SQLite use karein → files ko order mein run karein (01 → 02 → 03)
- **MySQL/PostgreSQL**: same order mein run karein. Sirf query 6 aur 14 mein `strftime()` ko apne DB ke date function se replace karna hoga (comment mein bataya gaya hai)

## Database Structure (ER Overview)
```
customers (customer_id PK)
    |
    | 1-to-many
    v
orders (order_id PK, customer_id FK)
    |
    | 1-to-many
    v
order_items (order_item_id PK, order_id FK, product_id FK)
    ^
    | many-to-1
    |
products (product_id PK)
```

## Queries Kya Cover Karti Hain
- Total revenue & average order value
- Top-selling products & categories
- Top customers by spend (+ ranking with window functions)
- Monthly revenue trend + running total
- Customer retention (repeat customers)
- Cancelled order rate
- City/state-wise performance
- Customers/products with zero activity (LEFT JOIN, subqueries)

## Concepts Covered (Learning Value)
JOINs (INNER, LEFT), GROUP BY + aggregates, HAVING, subqueries, CASE statements, window functions (RANK, running total) — beginner se thoda intermediate tak ka spread hai, taaki aap practice karte karte level up kar sako.

## Next Steps (Optional Extensions)
- Data ko Excel/Power BI mein export karke dashboard banayein
- Apna khud ka dataset add karke queries dobara run karein
- Query results ko Python (pandas) mein laake charts banayein

Koi bhi query modify karni ho, naya business question add karna ho, ya isko Power BI/Excel dashboard mein convert karna ho — bata dijiye, main help kar dunga.
