# UG Hall Management System


**Course:** DCIT 205 - Database Fundamentals  
**Project Title:** UG Hall Management System

## 1. **Description:**  
The UG Hall Management System is a database-focused project aimed at designing a robust and efficient data model to manage student accommodations at the University of Ghana. This project forms part of the DCIT 205 course and focuses on applying database fundamentals to a real-world scenario.

The project involves identifying key entities, defining their attributes, and detailing the relationships between them. Additionally, each entity and attribute is carefully justified based on its relevance to the domain, ensuring a practical and comprehensive data model. The ultimate goal is to create a blueprint for a database system that simplifies hostel management processes, improves data accuracy, and facilitates decision-making for administrators.

**Objectives:**

- Develop a data model that encapsulates all relevant aspects of hostel management.
- Detail entities, attributes, and relationships with clear justifications.
- Apply database design principles to ensure normalization and eliminate redundancy.

## 2. Table of Contents

- [Description](#1-Description)
- [Table of Contents](#2-Table-of-Contents)
- [Project Preview](#3-project-preview)
- [Project Structure](#4-project-Structure)
- [Installation](#5-installation)
- [Dependencies](#6-dependencies)
- [Usage](#7-usage)
- [Key Features of the Data Model](#8-Key-Features-of-the-Data-Model)
- [Future Enhancements](#9-Future-Enhancements)
- [Team Members](#10-Team-Members)
- [License](#11-License)
- [Acknowledgements](#12-Acknowledgments)

## 3. **Project Preview**

![Project Preview](/docs/ug_hall_mgmt_er_diagrams.png)

## 4. **Project Structure**
   ```sh markdown
   UG-HALL-MANAGEMENT-SYSTEM/  
├── docs/  
│   ├── ug_hall_mgmt_DATA_MODEL.pdf  
│   ├── ug_hall_mgmt_er_diagrams.pdf  
│   ├── ug_hall_mgmt_er_diagrams.png  
├── sql/  
│   ├── ug_hall_mgmt_er_diagrams.bak  
│   ├── ug_hall_mgmt_er_diagrams.mwb  
│   ├── ug_hall_mgmt.sql  
├── README.md  
   ```

## 5. Installation

1. Clone the repository:
   ```sh markdown
   HTTPS
   git clone https://github.com/calyxish/UG-HALL-MANAGEMENT-SYSTEM.git  

   GitHub CLI
   git gh repo clone calyxish/UG-HALL-MANAGEMENT-SYSTEM

   ```
2. Navigate to the project directory
   ```sh
    cd UG-HALL-MANAGEMENT-SYSTEM  
   ```
3. Set up your database:
   ```sh markdown
    Import the SQL script ug_hall_mgmt.sql in the sql folder into your preferred database management system (e.g., MySQL or PostgreSQL).
   ```

## 6. Dependencies
   ```sh markdown
    1. A SQL-compatible database management system (e.g., MySQL, PostgreSQL).

    2. Git for version control.
   ```

## 7. Usage

   ```sh markdown
    1. Import the SQL script (ug_hall_mgmt.sql) to create the database schema.

    2. Run sample queries to explore the database structure and functionality.
    3. Extend the database to integrate it into a web or mobile application for enhanced usability.
   ```


## 8. **Key Features of the Data Model:**

1. **Hall Management**: Captures details about university halls, including their names, capacities, types, and locations.
2. **Room Management**: Tracks rooms within halls, including room IDs, occupancy status, and amenities.
3. **Student Information**: Stores details about students, including their personal information, allocated rooms, and check-in/check-out dates.
4. **Administrator Roles**: Records hall administrators, their roles, and working hours.
5. **Event Tracking**: Maintains a log of hall-organized events, including dates, times, and venues.
6. **Maintenance Requests**: Logs and tracks issues reported by students, including their resolution status.

### **Scope:**  
This data model can serve as the foundation for building a comprehensive database-driven application for hostel management. The model not only supports basic CRUD operations but also provides insights into room utilization, maintenance tracking, and event management.

### **Deliverables:**

1. A document outlining the entities, attributes, and justifications for each.
2. An Entity-Relationship Diagram (ERD) representing the relationships among the entities.
3. SQL scripts for creating the database schema and inserting sample data.

### **Reason for Choice:**  
The domain of hostel management was chosen because it is a practical and relatable use case that highlights the core aspects of database design. The project addresses real-life challenges such as managing large datasets, maintaining relationships between entities, and ensuring data integrity.

### **Target Audience:**  
The primary stakeholders for this system include hostel administrators, students, and university management teams.




## 9. Future Enhancements

- Web application integration using Django.
    
- Mobile application for student self-service.
    
- Real-time maintenance tracking system.
    

## 10. Team Members

- **Calyx Ish** - Developer & Team Lead
    
- **Justice Sarfo** - Developer
    
- **Maxwell Adu** - Developer
    


## 11. License

No License at the moment.
## 12. Acknowledgments

- University of Ghana
    
- Course Instructor for guidance
    
- Team members for collaboration