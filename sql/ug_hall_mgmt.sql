-- SQL Data Definition Language (DDL) CODE

-- Create the database
CREATE DATABASE ug_hall_mgmt; 

-- Use the database 
USE ug_hall_mgmt;

-- Hall Table
CREATE TABLE Hall (
    Hall_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255),
    Capacity INT,
    Hall_Type VARCHAR(50),
    Established_Year INT,
    Contact_Info VARCHAR(100)
);

-- Room Table
CREATE TABLE Room (
    Room_ID INT PRIMARY KEY,
    Hall_ID INT,
    Room_Number VARCHAR(10),
    Room_Type VARCHAR(50),
    Capacity INT,
    Amenities TEXT,
    Occupied_Status BOOLEAN,
    FOREIGN KEY (Hall_ID) REFERENCES Hall(Hall_ID)
);

-- Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Hall_ID INT,
    Room_ID INT,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Program_Of_Study VARCHAR(100),
    Year_Level INT,
    Check_In_Date DATE,
    Check_Out_Date DATE,
    Mobile_Number VARCHAR(15),
    Email VARCHAR(100),
    Proof_Of_Course_Registration BOOLEAN,
    FOREIGN KEY (Hall_ID) REFERENCES Hall(Hall_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

-- Hall Administration Table
CREATE TABLE Hall_Administration (
    Admin_ID INT PRIMARY KEY,
    Hall_ID INT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Contact_Info VARCHAR(100),
    Working_Hours VARCHAR(50),
    FOREIGN KEY (Hall_ID) REFERENCES Hall(Hall_ID)
);

-- Event Table
CREATE TABLE Event (
    Event_ID INT PRIMARY KEY,
    Hall_ID INT,
    Name VARCHAR(100),
    Description TEXT,
    Date DATE,
    Time TIME,
    Venue VARCHAR(100),
    Organized_By VARCHAR(100),
    FOREIGN KEY (Hall_ID) REFERENCES Hall(Hall_ID)
);

-- Facilities
CREATE TABLE Facilities (
    facility_id INT PRIMARY KEY AUTO_INCREMENT,
    hall_id INT,
    facility_name VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) NOT NULL,
    last_maintenance_date DATE,
    FOREIGN KEY (hall_id) REFERENCES Hall(hall_id)
);
-- Maintenance Request Table
CREATE TABLE Maintenance_Request (
    Request_ID INT PRIMARY KEY,
    Hall_ID INT,
    Room_ID INT,
    Issue_Description TEXT,
    Request_Date DATE,
    Status VARCHAR(50),
    Assigned_To VARCHAR(100),
    FOREIGN KEY (Hall_ID) REFERENCES Hall(Hall_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

-- Visitor Table
CREATE TABLE Visitor (
    Visitor_ID INT PRIMARY KEY,
    Hall_ID INT,
    Name VARCHAR(100),
    Visit_Purpose TEXT,
    Date_Of_Visit DATE,
    Host_Student_ID INT,
    FOREIGN KEY (Hall_ID) REFERENCES Hall(Hall_ID),
    FOREIGN KEY (Host_Student_ID) REFERENCES Student(Student_ID)
);

-- Event Attendance Table
CREATE TABLE Event_Attendance (
    Event_ID INT,
    Student_ID INT,
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    PRIMARY KEY (Event_ID, Student_ID)
);




-- SQL Data Manipulation Language (DML) CODE
-- DATA INSERTION

-- Insert three halls with Ghanaian contact numbers
INSERT INTO Hall (Hall_ID, Name, Location, Capacity, Hall_Type, Established_Year, Contact_Info)
VALUES 
(1, 'Pentagon', 'Legon Campus', 600, 'Mixed', 1985, '024-234-5678'),
(2, 'Commonwealth', 'Legon Campus', 450, 'Mixed', 2000,  '027-345-6789'),
(3, 'Legon Hall', 'Legon Campus', 700, 'Male', 1950,  '020-456-7890');


-- Insert three rooms for each hall with Ghanaian contact numbers
INSERT INTO Room (Room_ID, Hall_ID, Room_Number, Room_Type, Capacity, Amenities, Occupied_Status)
VALUES 
(101, 1, 'A101', 'Single', 1, 'Air Conditioning, Heater', TRUE),
(102, 1, 'A102', 'Double', 2, 'Air Conditioning', TRUE),
(103, 1, 'B101', 'Single', 1, 'Fan', FALSE),

(201, 2, 'C101', 'Double', 2, 'Fan, Heater', TRUE),
(202, 2, 'C102', 'Single', 1, 'Air Conditioning', TRUE),
(203, 2, 'D101', 'Triple', 3, 'Fan, Heater', FALSE),

(301, 3, 'E101', 'Single', 1, 'Air Conditioning, Fridge', TRUE),
(302, 3, 'E102', 'Double', 2, 'Fan, Heater', TRUE),
(303, 3, 'F101', 'Triple', 3, 'Fan', FALSE);


-- Insert three students for each hall with Ghanaian contact numbers
INSERT INTO Student (Student_ID, Hall_ID, Room_ID, Name, Gender, Program_Of_Study, Year_Level, Check_In_Date, Check_Out_Date, Mobile_Number, Email, Proof_Of_Course_Registration)
VALUES 
(1001, 1, 101, 'Kwame Aidoo', 'Male', 'Computer Science', 200, '2024-01-15', '2024-05-15', '024-234-5678', 'kwame.aidoo@ug.edu.gh', TRUE),
(1002, 1, 102, 'Esi Agyemang', 'Female', 'Economics', 200, '2024-01-16', '2024-05-16', '027-345-6789', 'esi.agyemang@ug.edu.gh', TRUE),
(1003, 1, 103, 'Kwabena Osei', 'Male', 'Mathematics', 200, '2024-01-17', '2024-05-17', '020-456-7890', 'kwabena.osei@ug.edu.gh', TRUE),

(2001, 2, 201, 'Ama Boateng', 'Female', 'Law', 300, '2024-02-01', '2024-07-01', '024-567-8901', 'ama.boateng@ug.edu.gh', TRUE),
(2002, 2, 202, 'Kofi Ansah', 'Male', 'Business Administration', 300, '2024-02-02', '2024-07-02', '027-678-9012', 'kofi.ansah@ug.edu.gh', TRUE),
(2003, 2, 203, 'Akosua Sarpong', 'Female', 'Political Science', 300, '2024-02-03', '2024-07-03', '020-789-0123', 'akosua.sarpong@ug.edu.gh', TRUE),

(3001, 3, 301, 'Yaw Owusu', 'Male', 'Mechanical Engineering', 400, '2024-03-10', '2024-08-10', '027-890-1234', 'yaw.owusu@ug.edu.gh', TRUE),
(3002, 3, 302, 'Akua Mensah', 'Female', 'Nursing', 400, '2024-03-11', '2024-08-11', '024-901-2345', 'akua.mensah@ug.edu.gh', TRUE),
(3003, 3, 303, 'Kwasi Frimpong', 'Male', 'Electrical Engineering', 400, '2024-03-12', '2024-08-12', '020-012-3456', 'kwasi.frimpong@ug.edu.gh', TRUE);

-- Insert three administrators for each hall with Ghanaian contact numbers
INSERT INTO Hall_Administration (Admin_ID, Hall_ID, Name, Role, Contact_Info, Working_Hours)
VALUES 
(1, 1, 'Kofi Mensah', 'Hall Master', '024-234-5678', '9:00 AM - 5:00 PM'),
(2, 1, 'Ama Osei', 'Hall Secretary', '027-345-6789', '8:00 AM - 4:00 PM'),
(3, 1, 'Kwame Asamoah', 'Assistant Hall Master', '020-456-7890', '10:00 AM - 6:00 PM'),

(4, 2, 'Akosua Baidoo', 'Hall Master', '024-567-8901', '9:00 AM - 5:00 PM'),
(5, 2, 'Kwasi Adom', 'Hall Secretary', '027-678-9012', '8:00 AM - 4:00 PM'),
(6, 2, 'Kwaku Boateng', 'Assistant Hall Master', '020-789-0123', '10:00 AM - 6:00 PM'),

(7, 3, 'Esi Ankomah', 'Hall Master', '027-890-1234', '9:00 AM - 5:00 PM'),
(8, 3, 'Yaw Appiah', 'Hall Secretary', '024-901-2345', '8:00 AM - 4:00 PM'),
(9, 3, 'Kwame Doku', 'Assistant Hall Master', '020-012-3456', '10:00 AM - 6:00 PM');


-- Insert three events for each hall with Ghanaian contact numbers
INSERT INTO Event (Event_ID, Hall_ID, Name, Description, Date, Time, Venue, Organized_By)
VALUES 
(1, 1, 'Freshers Welcome', 'Welcome event for new students', '2024-01-30', '18:00:00', 'Main Hall', 'Hall Administration'),
(2, 1, 'Sports Day', 'A day of fun and games for residents', '2024-02-15', '09:00:00', 'Sports Field', 'Hall Administration'),
(3, 1, 'Debate Competition', 'Debate among residents of the hall', '2024-03-10', '14:00:00', 'Main Hall', 'Hall Administration'),

(4, 2, 'Career Fair', 'Career development event for students', '2024-02-20', '10:00:00', 'Conference Room', 'Hall Administration'),
(5, 2, 'Health Talk', 'Talk on maintaining good health', '2024-03-01', '12:00:00', 'Lecture Hall', 'Hall Administration'),
(6, 2, 'Talent Show', 'Showcasing talents of the residents', '2024-03-15', '18:00:00', 'Auditorium', 'Hall Administration'),

(7, 3, 'Music Concert', 'Live music event for residents', '2024-02-25', '20:00:00', 'Main Hall', 'Hall Administration'),
(8, 3, 'Open Mic Night', 'A night of performances and comedy', '2024-03-05', '19:00:00', 'Cafeteria', 'Hall Administration'),
(9, 3, 'Movie Night', 'Watch a movie together as a hall', '2024-03-20', '21:00:00', 'Main Hall', 'Hall Administration');


-- Insert three maintenance requests for each hall with Ghanaian contact numbers
INSERT INTO Maintenance_Request (Request_ID, Hall_ID, Room_ID, Issue_Description, Request_Date, Status, Assigned_To)
VALUES 
(1, 1, 101, 'Air conditioning not working', '2024-01-10', 'Pending', 'John Doe'),
(2, 1, 102, 'Water leak in bathroom', '2024-01-11', 'Pending', 'Jane Smith'),
(3, 1, 103, 'Room light not working', '2024-01-12', 'Resolved', 'Michael Lee'),

(4, 2, 201, 'Broken door lock', '2024-02-01', 'Resolved', 'Samuel Boateng'),
(5, 2, 202, 'Faulty window', '2024-02-02', 'Pending', 'Daniel Opoku'),
(6, 2, 203, 'Ceiling fan malfunction', '2024-02-03', 'Pending', 'Kofi Kwaku'),

(7, 3, 301, 'No hot water in shower', '2024-03-01', 'Pending', 'Kwabena Amoako'),
(8, 3, 302, 'Damaged flooring', '2024-03-02', 'Resolved', 'Adom Kwasi'),
(9, 3, 303, 'Broken window', '2024-03-03', 'Pending', 'David Annan');
