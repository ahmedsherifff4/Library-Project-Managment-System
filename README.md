# 📚 Library Management System

A comprehensive database system designed to manage library operations, including book inventory, staff roles, user transactions, and borrowing tracking.

## 📂 Project Resources
- **Database Schema & Logic (PDF):** [Click here to view the Design Document That contain ERD,SCHEMA AND ASSUPTION](https://github.com/ahmedsherifff4/Library-Project-Managment-System/tree/238aa12185da045a315cbe5e6bddeb70c2056ee2/Library_Project_Erd%2CSchema_And_Assumptions)  
- **SQL Implementation Code:** [Click here to view the SQL Script](https://github.com/ahmedsherifff4/Library-Project-Managment-System/blob/5255e3acde370a18fe7e0f6d7fb4752ee06b89ef/src/library_management.sql)  
- **Forms & User Interface (PDF):** [Click here to view the Forms Design](./Library_Forms_Design.pdf)  

## 🛠️ What I have Done
1. **Conceptual Design (ERD):** Created a detailed ERD showing entities like Staff, Books, Users, and Authors with their relationships.  
2. **Logical Design:** Transformed the ERD into a Relational Schema, ensuring data integrity and normalization.  
3. **Specialization Implementation:** Implemented a disjoint specialization for Staff (HR and OC).  
4. **Database Creation:** Wrote Oracle SQL scripts to create tables with appropriate constraints (Primary Keys, Foreign Keys, Checks, and Not Null).  
5. **Data Population:** Inserted sample data to test the system's functionality.  
6. **Form Design & Interaction:** Designed the logic for user-facing forms to interact with the database.  

## 🖥️ Forms & User Interface Logic
- **User Registration Form:** To capture user details and issue tickets.  
- **Book Management Form:** Used by the **Organizing Committee (OC)** to add new books, assign authors, and specify storage locations (Cabinet/Shelf).  
- **Borrowing Transaction Form:** To record when a user borrows or returns a book, calculating dates and tracking availability.  
- **HR Dashboard:** To manage staff information and track which HR members are dealing with specific users.  

## ⚠️ Potential Issues & Improvements
1. **Derived Attribute (Age):** Consider adding a View or Virtual Column to calculate age automatically from `BirthDate`.  
2. **Specialization Constraint:** Ensure 'OC' staff cannot have a `Typing_Speed` value to enforce the disjoint rule.  
3. **Return Date Logic:** Add logic to prevent users with overdue books from borrowing more.  
4. **Ticket-User Constraint:** Enforce that a user must purchase at least one ticket.  

## 🚀 Implementation Snippet
```sql
-- Example: Creating the Book table with Relations
CREATE TABLE Book(
    Book_ID number(5) PRIMARY KEY,
    Title varchar2(100) NOT NULL,
    Author_ID number(5) REFERENCES Author(Author_id),
    Company_ID number(5) REFERENCES Publishing_company(Company_id)
);



