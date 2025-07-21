# Movie Analytics Project Using SQL

## Overview
This project performs an in-depth analysis of a movie dataset using MySQL. It answers key business questions such as:
- Which are the top actors and directors according to number of movies, genres, their average imdb ratings?
- What are the top 3 highest grossing movies per year?
- How do genres and languages impact performance?

It demonstrates core SQL concepts such as joins, aggregation, filtering, window functions and stored procedures.

---

## Dataset
- **Source**: Data inspired by IMDb, gathered from public GitHub repositories.
- **Note**: Data used is fictional for academic and portfolio purposes.
- **Tables Used**:
  - `movies_table` – main movie details (title, year, actors, genre, rating, budget, gross, etc.)
  - `directors` – director information (director name, director id)
  - `actors` – actor names

---

## Key SQL Concepts Used
- **Joins** (INNER, LEFT)
- **Aggregate Functions**: `COUNT()`, `AVG()`, `MAX()`, `MIN()`
- **Grouping and Filtering**: `GROUP BY`, `HAVING`, `WHERE`
- **Window Functions**: `DENSE_RANK()`, `ROW_NUMBER()`
- **Stored Procedures** with `IN` and `OUT` parameters
- **Subqueries & Nested Queries**
- **CASE Statements**

---

##  Business Insights Derived
-  **Top 3 Grossing Movies by Year**
-  **Most Featured Actors with Average IMDb Scores**
-  **Directors with Highest Average IMDb Ratings**
-  **Distribution by Language and Country**
-  **Genre Trends and Their Impact**
-  **Budget vs. Gross Revenue Patterns**

---
## Conclusion
Though based on fictional data, this project reflects real-world product analytics by mimicking how companies assess content performance, customer engagement, and market segmentation to inform business decisions
