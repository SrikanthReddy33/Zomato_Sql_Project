# SQL Project: Data Analysis for Dishcover – A Food Delivery Company

# Overview

This project showcases my ability to work with relational databases using SQL. I’ve built and analyzed a fictional food delivery platform. where I used PostgreSQL to create schemas, clean data, and solve business problems through real-world SQL queries.


##  Project Highlights

* Created and managed a PostgreSQL database (`zomato.db`)
*  Designed normalized tables for customers, restaurants, orders, deliveries, and riders
*  Imported structured CSV data into each table
*  Cleaned and handled null/missing data
*  Solved **20 real-world business problems** using SQL (e.g., customer churn, top dishes, city rankings)
*  Built an interactive **Power BI dashboard** to visualize key business insights


---
## What I Learned from This Project
Through Dishcover, I didn’t just write SQL queries—I learned how to think like a data analyst. Here's what I practiced:

 # Database Design – Created clean and structured tables using real-world relationships
 # Data Filtering & Retrieval – Wrote queries to get the right answers from large datasets
 # Aggregation & Grouping – Used functions like SUM, COUNT, AVG to find key insights
 # Joins – Connected multiple tables (e.g., orders, customers, restaurants) to get complete answers
 # Window Functions – Used RANK, ROW_NUMBER,LAG etc., for advanced analysis
 # Date & Time Functions – Found trends over months, years, time slots
 # Conditional Logic – Applied CASE WHEN to add logic inside SQL queries
 # Subqueries – Wrote queries inside queries for more complex problems

This project also helped me visualize insights using Power BI, making the data easier to understand for non-technical people.


### Key Highlights:

-  **Total Sales**: ₹987M across 150K orders  
-  **Category Breakdown**:
  - **Veg**: ₹122M | 122M ratings  
  - **Non-Veg**: ₹106M | 106M ratings  
  - **Other**: ₹24M | 24M ratings  
-  **Top 50 Cities by Order Amount**  
  *(e.g., Tirupati, Pune, Delhi, Raipur, Bikaner)*
-  **Year-wise Sales Trend**:
  - Peak in 2018 (₹0.41bn)
  - Decline observed in 2020 (₹0.14bn)
-  **Quantity Ordered**: 2M units  
-  **Total Ratings**: 148K  

Users can toggle between **Amount** and **Quantity** views. Filters like **Top 5/10/20/50/100 cities** enhance interactivity.

---

##  Tools Used

* **PostgreSQL**
* **pgAdmin 4**
* **SQL**


---

##  Database Structure

The database includes the following tables:

* `restaurants`: Info about restaurants
* `customers`: User details and registration dates
* `orders`: Orders placed by customers
* `delivery`: Delivery details of each order
* `riders`: Rider details and signup info

> You can view the ER Diagram [here][https://github.com/SrikanthReddy33/Zomato_Sql_Project/blob/main/ER%20Diagram.png]

---

## 📁 Project Structure

* **Database Setup:** Creation of the `zomato.db` database and all required tables.
* **Data Import:** Inserting sample data into the tables.
* **Data Cleaning:** Handling null values and ensuring data integrity.
* **Business Problems:** Solving 20 specific business problems using SQL queries.
* **Power BI Dashboard:** Visualizing insights from SQL analysis.

---

## 💡 Sample Business Problems Solved

*  **Top 5 dishes ordered by a specific customer in the last year**
*  **Most popular time slots for food orders**
*  **High-value customers and top cities by revenue**
*  **Orders placed but not delivered**
*  **Rider ratings based on delivery time**
*  **Monthly growth and seasonal demand patterns**

> Want to see all 10 problems and solutions? [View the SQL file](https://github.com/Garima-Khandelwal-1/Dishcover/blob/main/20%20Business%20Problems%20solution.sql)

---

## Conclusion

This project helped me put my SQL knowledge into practice by building a database from scratch and solving real-world business problems in the context of a food delivery company. I learned how to set up and manage tables, clean and import data, and write queries to answer business questions like identifying top customers, most popular dishes, or tracking delivery performance.

With the addition of **Power BI**, I translated raw SQL insights into visual stories — making the data easier to interpret for non-technical users. This project has strengthened both my data analysis skills and my ability to think like a data-driven decision-maker.

---

##  Disclaimer

This project is purely academic and was created for learning and portfolio purposes. All data used is **fictional** and **randomly generated** — it does not reflect any real individuals, companies, or events. The name **"Dishcover"** is made up and is **not associated with Zomato, Swiggy, or any real food delivery platform**. Any similarities are completely coincidental.

---

##  What's Next?
I'm planning to:

Complete the Power BI dashboard to visualize trends like customer segmentation, seasonal demand, and delivery ratings

Upload the .pbix file to GitHub for live interaction

Possibly integrate Tableau for cross-platform visualization experience

##  About Me

I’m a exploring data analytics. This project helped me practice:

* Real-life database modeling
* Data cleaning
* Writing complex SQL queries
* Visualizing data with Power BI
* Interpreting business problems using data



