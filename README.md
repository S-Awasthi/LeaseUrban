# UrbanLease-Solutions
A Versatile Property Rental Agency Database System

## Overview

This project focuses on ER/EER Modeling, Relational schema design and refinement (Normalization), and implementing a database for a Property Rental Agency (PRA) system. The system facilitates mediation between property owners and tenants across multiple cities in India. The functionalities include adding users, managing properties, recording rental transactions, and generating reports.

## Domain Description

The PRA system involves multiple user roles:
- **DBA (Super User)**: Has the highest privileges, can manage users and assign roles.
- **Managers**: Can add, modify, or delete property records and record rental transactions.
- **Owners**: Users who register properties to be rented.
- **Tenants**: Users who rent properties.
- **Users**: Can have both roles of owner and tenant simultaneously.

### Data Model

1. **User**: Contains details about the users including their Aadhaar ID, name, age, address, phone numbers, and login credentials.
2. **Property**: Contains details about properties including property ID, owner, availability dates, rent, annual hike percentage, total area, plinth area, bedrooms (if residential), floors, year of construction, locality, address, and other facilities.
3. **Rental**: Captures rental transactions including property ID, tenant ID, rent per month, start date, end date, yearly hike in rent percentage, agency commission, and other relevant information.

### ER Diagram

The ER diagram models entities (User, Property, Rental) and their relationships, capturing the roles and interactions between owners, tenants, and managers within the system.

### Relational Schema

The relational schema is designed based on the ER diagram and normalized to reduce redundancy and ensure data integrity.

## Functionality

### 1. User Management

- **Adding Users**: DBA can add users with specific roles (Owner, Tenant, Manager).
- **Managing Users**: DBA can update or delete user records and manage their privileges.

### 2. Property Management

- **Property CRUD Operations**: 
  - DBA and Managers can add, delete, and update any property records.
  - Owners can add, delete, and update only their property records.

### 3. Rental Management

- **Recording Rental Transactions**: Admin and Managers can record rental transactions when a property is rented to a tenant.

### 4. Reporting and Queries

- **Rent History Report**: Generates a report on the rental history of a property.
- **Available Properties**: Lists properties available for rent within a given city/locality/price range.
- **Property Status**: Checks the status of a property based on property ID for all users.
- **Tenant Restrictions**: Tenants can only view available properties and cannot modify any data.

## Usage

### Running SQL Files

To set up and run the database, follow these steps:

1. **Database Setup**:
   - Ensure you have a MySQL server running and have access to a MySQL client or a database management tool like MySQL Workbench.
   - Open your MySQL client and connect to your database server.

2. **Create Database**:
   - Create a new database for the PRA system:
     ```sql
     CREATE DATABASE pra_system;
     USE pra_system;
     ```

3. **Run SQL Scripts**:
   - Open the SQL script files in your client or management tool.

4. **Procedures and Queries**:
   - Use the provided procedures to add, update, and delete users and properties.
   - Record rental transactions using the provided scripts.
   - Execute the provided queries to generate reports and check property status.
