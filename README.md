# UrbanLease-Solutions
A Comprehensive Database System for a Property Rental Agency

## Project Overview

This project is centered on ER/EER Modeling, designing and refining relational schemas (Normalization), and developing a database tailored for a Property Rental Agency (PRA) system. The system aids in mediating between property owners and tenants across various Indian cities. Key features include user management, property management, recording rental transactions, and generating detailed reports.

## Domain Description

The PRA system encompasses several user roles:
- **DBA (Super User)**: Possesses the highest level of privileges and can manage users and assign their roles.
- **Managers**: Responsible for adding, modifying, or deleting property records and recording rental transactions.
- **Owners**: Users who register properties to be rented out.
- **Tenants**: Users who rent the properties.
- **General Users**: Can simultaneously hold the roles of both owner and tenant.

### Data Model

1. **User**: Stores information about users, including Aadhaar ID, name, age, address, phone numbers, and login credentials.
2. **Property**: Stores details about properties such as property ID, owner, availability dates, rent, annual hike percentage, total area, plinth area, number of bedrooms (if residential), floors, year of construction, locality, address, and additional facilities.
3. **Rental**: Captures details of rental transactions including property ID, tenant ID, monthly rent, start and end dates, annual rent increase percentage, agency commission, and other relevant details.

### ER Diagram

The ER diagram represents entities (User, Property, Rental) and their relationships, illustrating the interactions between owners, tenants, and managers within the system.

### Relational Schema

The relational schema is constructed based on the ER diagram and is normalized to minimize redundancy and ensure data integrity.

## Key Functionalities

### 1. User Management

- **Adding Users**: The DBA can add users with designated roles (Owner, Tenant, Manager).
- **Managing Users**: The DBA has the ability to update or delete user records and manage their privileges.

### 2. Property Management

- **Property CRUD Operations**:
  - DBAs and Managers have the capability to add, delete, and update any property records.
  - Owners can manage (add, delete, update) only their own property records.

### 3. Rental Management

- **Recording Rental Transactions**: Admins and Managers can record transactions when a property is rented to a tenant.

### 4. Reporting and Queries

- **Rent History Report**: Generates a report detailing the rental history of a property.
- **Available Properties**: Lists properties available for rent within specified city/locality/price ranges.
- **Property Status**: Checks the status of a property based on its ID, accessible to all users.
- **Tenant Restrictions**: Tenants can only view available properties and are restricted from modifying any data.

## Usage Instructions

### Running SQL Files

To set up and run the database, follow these steps:

1. **Database Setup**:
   - Ensure your MySQL server is running and you have access to a MySQL client or a database management tool like MySQL Workbench.
   - Connect to your database server using your MySQL client.

2. **Create Database**:
   - Create a new database for the PRA system:
     ```sql
     CREATE DATABASE pra_system;
     USE pra_system;
     ```

3. **Run SQL Scripts**:
   - Open and execute the SQL script files in your client or management tool.

4. **Using Procedures and Queries**:
   - Utilize the provided procedures to add, update, and delete users and properties.
   - Record rental transactions with the given scripts.
   - Run the provided queries to generate reports and check the status of properties.
