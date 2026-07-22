# 🛒 Retail Sales Analytics — SQL Project

A beginner-to-intermediate SQL analytics project built on a realistic retail/e-commerce dataset. Includes database design, sample data, and 15+ business-driven analysis queries covering revenue, customer behavior, and product performance — with visualized results.

![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=mysql&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-07405E?style=flat&logo=sqlite&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

---

## 📌 Project Overview

This project simulates a small e-commerce business and answers real business questions using SQL — from revenue and top-selling products to customer retention and cancellation trends. It demonstrates core-to-intermediate SQL skills: joins, aggregations, subqueries, and window functions, along with the ability to turn query output into visual insight.

## 🗂️ Database Schema

Four normalized tables connected by primary/foreign key relationships:

![ER Diagram](images/er_diagram.png)

| Table | Description | Rows |
|---|---|---|
| `customers` | Customer profile & location | 15 |
| `products` | Product catalog with category & price | 15 |
| `orders` | Order-level metadata (date, status) | 30 |
| `order_items` | Line items per order (quantity, price) | 45 |

## 📁 Repository Structure

```
retail-sales-analytics-sql/
├── 01_schema.sql              # Table creation (DDL)
├── 02_sample_data.sql         # Sample data inserts
├── 03_analysis_queries.sql    # 15 business analysis queries
├── images/                    # ER diagram & result charts
└── README.md
```

## 🚀 Getting Started

### Option 1 — Run in browser (no install needed)
1. Open [sqliteonline.com](https://sqliteonline.com)
2. Paste and run `01_schema.sql`, then `02_sample_data.sql`, then `03_analysis_queries.sql`

### Option 2 — Run locally
```bash
sqlite3 retail_analytics.db < 01_schema.sql
sqlite3 retail_analytics.db < 02_sample_data.sql
sqlite3 retail_analytics.db < 03_analysis_queries.sql
```

> **Note:** Written for SQLite syntax. For MySQL/PostgreSQL, replace `strftime()` in queries #6 and #14 with `DATE_FORMAT()` (MySQL) or `TO_CHAR()` (PostgreSQL).

---

## 📊 Key Insights (from the sample dataset)

**Revenue by Category**

![Revenue by Category](images/revenue_by_category.png)

Electronics leads as the top revenue-generating category, followed by Footwear and Apparel.

**Top 5 Best-Selling Products**

![Top Products](images/top_products.png)

Wireless Mouse and Cotton T-Shirt are the highest-volume sellers by units sold.

**Monthly Revenue Trend**

![Monthly Revenue Trend](images/monthly_revenue_trend.png)

Revenue grew month-over-month across the two-month sample window, indicating positive momentum.

**Top 5 Customers by Spend**

![Top Customers](images/top_customers.png)

A small group of repeat customers accounts for a disproportionate share of total revenue — a classic 80/20 pattern worth targeting with loyalty offers.

---

## 🧠 Business Questions Answered

- What is total revenue and average order value?
- Which products and categories generate the most revenue?
- Who are the top customers by spend?
- What does the monthly revenue trend look like?
- What percentage of orders get cancelled?
- Which customers are repeat buyers vs. one-time buyers?
- Which products have never been ordered?
- How does revenue break down by city/state?

## 🛠️ SQL Concepts Demonstrated

- **Joins:** INNER JOIN, LEFT JOIN
- **Aggregation:** GROUP BY, HAVING, SUM, COUNT, AVG
- **Subqueries:** NOT IN, correlated filtering
- **Window Functions:** RANK(), running totals with OVER()
- **Conditional Logic:** CASE statements
- **Data Modeling:** Normalized schema with FK relationships

## 🔮 Possible Extensions

- [ ] Connect to Power BI / Tableau for a live interactive dashboard
- [ ] Export query results to Python (pandas) for deeper statistical analysis
- [ ] Add a `returns` table to model refund analytics
- [ ] Scale the dataset to 1,000+ rows using a synthetic data generator

## 📄 License

This project is open source and free to use for learning purposes.

---

*Built as a portfolio project to demonstrate SQL data analytics skills.*
