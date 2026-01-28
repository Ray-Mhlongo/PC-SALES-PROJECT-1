# PC Parts Price Analysis (South Africa)

## Project Overview
This project analyses PC component prices across different shops and provinces in South Africa.

The goal is to practice:
- SQL data modeling
- Data cleaning and standardization
- Basic analytical queries

The data is prepared for visualization in tools like **Power BI**.

This is a **learning-focused portfolio project**.

---

## Tools Used
- SQL (MySQL)
- Power BI
- GitHub

---

## What I Did
- Created a relational database for PC parts pricing
- Inserted raw product data
- Cleaned and standardized inconsistent values (names, formatting)
- Built dimension tables:
  - Categories
  - Provinces
  - Shops
  - Manufacturers
- Applied primary keys and foreign keys
- Ran analysis queries to answer business-style questions

---

## Database Structure

### Main Table
- `Parts`

### Dimension Tables
- `part_categories`
- `Province`
- `Shop`
- `Manufacturer`

This structure allows filtering by:
- Category (CPU, GPU, RAM, etc.)
- Province
- Shop
- Manufacturer

---

## Key Questions Answered
- What products are available in each province?
- What are the cheapest products per category?
- How do prices differ between shops?
- Which products have the highest warranties?
- What are the most and least expensive items per category?
