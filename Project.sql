-- Create the database
CREATE DATABASE FARWELL;
USE FARWELL;

-- Create User table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Create Event table
CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    venue VARCHAR(255),
    date DATE
);

-- Create Organizer table
CREATE TABLE Organizer (
    organizer_id INT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(255),
    user_id INT,
    event_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

-- Create Attendee table
CREATE TABLE Attendee (
    attendee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    contact_number VARCHAR(255),
    email VARCHAR(255),
    family_count INT,
    event_id INT,
    user_id INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Teacher table
CREATE TABLE Teacher (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    family_members INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Student table
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    dietary_preference VARCHAR(255),
    family_members INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Voting table
CREATE TABLE Voting (
    voter_id INT AUTO_INCREMENT PRIMARY KEY,
    turkish BOOLEAN,
    continental BOOLEAN,
    chinese BOOLEAN,
    fast_food BOOLEAN,
    afghani BOOLEAN,
    role VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Menu table
CREATE TABLE Menu (
    item_no INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    quantity INT,
    type VARCHAR(255),
    event_id INT,
    voter_id INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (voter_id) REFERENCES Voting(voter_id)
);

-- Create Task table
CREATE TABLE Task (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_type VARCHAR(255),
    assigned_to VARCHAR(255),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Organizer(organizer_id)
);

-- Create Performance table
CREATE TABLE Performance (
    performance_number INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255),
    duration INT,
    venue VARCHAR(255),
    rehearsals INT,
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Organizer(organizer_id)
);

-- Create Invitation table
CREATE TABLE Invitation (
    invite_id INT AUTO_INCREMENT PRIMARY KEY,
    invitee_name VARCHAR(255),
    invitation_status VARCHAR(255),
    task_id INT,
    FOREIGN KEY (task_id) REFERENCES Task(task_id)
);

-- Create Decoration table
CREATE TABLE Decoration (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    requirements VARCHAR(255),
    task_id INT,
    FOREIGN KEY (task_id) REFERENCES Task(task_id)
);

-- Create Budget table
CREATE TABLE Budget (
    budget_id INT AUTO_INCREMENT PRIMARY KEY,
    decor DECIMAL(10,2),
    cater DECIMAL(10,2),
    venue_booking DECIMAL(10,2),
    task_id INT,
    FOREIGN KEY (task_id) REFERENCES Task(task_id)
);


-- Insert data into User table
INSERT INTO User (login, password)
VALUES ('jawadKhan@nu.edu.pk', 'jawad123*'),
       ('arishakhan@nu.edu.pk', 'arisha123*'),
       ('hassanrizvi@nu.edu.pk', 'hassan123*'),
       ('batoolhassan@nu.edu.pk', 'batool123*'),
       ('rameenbabar@nu.edu.pk', 'rameen123*');

-- Insert data into Event table
INSERT INTO Event (venue, date)
VALUES ('FAST NUCES CS LAWN', '2024-05-15');

-- Insert data into Organizer table
INSERT INTO Organizer (role, user_id, event_id)
VALUES 
    ('Manager', 1, 1),
    ('Manager', 2, 1),
    ('Manager', 3, 1),
    ('Manager', 1, 1),
    ('Manager', 2, 1),
    ('Volunteer', 3, 1),
    ('Volunteer', 1, 1),
    ('Volunteer', 2, 1),
    ('Volunteer', 3, 1),
    ('Volunteer', 1, 1),
    ('Volunteer', 2, 1),
    ('Volunteer', 3, 1),
    ('Volunteer', 1, 1),
    ('Volunteer', 2, 1),
    ('Volunteer', 3, 1),
    ('Volunteer', 1, 1),
    ('Volunteer', 2, 1),
    ('Volunteer', 3, 1),
    ('Volunteer', 1, 1),
    ('Volunteer', 2, 1);
       
-- Insert data into Attendee table
INSERT INTO Attendee (name, contact_number, email, family_count, event_id, user_id)
VALUES 
    ('Minahil Tariq', '0357768822', 'minahiltariq@nu.edu.pk', 4, 1, 1),
    ('Muneeb ullah jan', '0321636371', 'muneebjan@nu.edu.pk', 3, 1, 2),
    ('Malaika Azhar', '0333568721', 'malaikaazhar@nu.edu.pk', 5, 1, 3);


-- Insert data into Teacher table
INSERT INTO Teacher (address, family_members, user_id)
VALUES ('Lahore, Pakistan', 2, 1),
       ('Karachi, Pakistan', 3, 2),
       ('Islamabad, Pakistan', 4, 3);

-- Insert data into Student table
INSERT INTO Student (address, dietary_preference, family_members, user_id)
VALUES ('Lahore, Pakistan', 'Vegetarian', 2, 1),
       ('Karachi, Pakistan', 'Non-vegetarian', 1, 2),
       ('Islamabad, Pakistan', 'Vegan', 3, 3);
       
-- Insert data into Voting table
INSERT INTO Voting (turkish, continental, chinese, fast_food, afghani, role, user_id)
VALUES (TRUE, FALSE, TRUE, FALSE, FALSE, 'Teacher', 1),
       (FALSE, TRUE, FALSE, TRUE, FALSE, 'Student', 2),
       (TRUE, FALSE, FALSE, FALSE, TRUE, 'Student', 3);

-- Insert data into Menu table
INSERT INTO Menu (name, quantity, type, event_id, voter_id)
VALUES 
    ('Seekh kebab', 120, 'Main Course', 1, 1),
    ('Salad', 90, 'Appetizer', 1, 2),
    ('Haleem', 70, 'Main Course', 1, 3),
    ('Chicken Karahi', 110, 'Main Course', 1, 1),
    ('Samosa', 100, 'Appetizer', 1, 2),
    ('Fries', 80, 'Appetizer', 1, 3),
    ('Biryani', 85, 'Main Course', 1, 1),
    ('Fried Rice', 95, 'Main Course', 1, 2),
    ('Nihari', 75, 'Main Course', 1, 3),
    ('Fruit Platter', 130, 'Dessert', 1, 1),
    ('Gol Gappay', 105, 'Appetizer', 1, 2),
    ('Ice Cream', 115, 'Dessert', 1, 3),
    ('Cupcakes', 125, 'Dessert', 1, 1),
    ('Pulao', 105, 'Main Course', 1, 2),
    ('Butter Chicken', 115, 'Main Course', 1, 3),
    ('Chicken Tikka', 95, 'Main Course', 1, 1),
    ('Spring Rolls', 85, 'Appetizer', 1, 2),
    ('Chocolate Cake', 120, 'Dessert', 1, 3);


-- Insert data into Task table
INSERT INTO Task (task_type, assigned_to, organizer_id)
VALUES 
    ('Budget', 'Arisha', 6),
    ('Decoration', 'Jawad', 7),
    ('Invitations', 'Hassan', 8),
    ('Budget', 'Batool', 9),
    ('Decoration', 'Minahil', 11),
    ('Invitations', 'Momina', 10),
    ('Budget', 'Maryam', 14),
    ('Decoration', 'Muneeb', 15),
    ('Invitations', 'Hadi', 13),
    ('Budget', 'Malaika', 12),
    ('Decoration', 'Fasih', 20),
    ('Invitations', 'Katrina', 13),
    ('Budget', 'Khadija', 9),
    ('Decoration', 'Amna', 16),
    ('Invitations', 'Eshaal', 17),
    ('Budget', 'Irtiza', 18),
    ('Decoration', 'Muntaha', 19),
    ('Invitations', 'Manal', 9),
    ('Budget', 'Huzaifa', 18),
    ('Decoration', 'Zunaira', 20);

-- Insert data into Performance table
INSERT INTO Performance (type, duration, venue, rehearsals, organizer_id)
VALUES 
    ('Stand-up Comedy', 120, 'Auditorium', 4, 1),
    ('Play', 180, 'Auditorium', 6, 2),
    ('Dances', 90, 'Auditorium', 3, 3),
    ('Musical-Singing performance', 150, 'Auditorium', 5, 1),
    ('Stand-up Comedy', 210, 'Auditorium', 7, 2),
    ('Play', 100, 'Auditorium', 4, 3),
    ('Dances', 160, 'Auditorium', 6, 1),
    ('Musical-Singing performance', 90, 'Auditorium', 3, 2),
    ('Stand-up Comedy', 180, 'Auditorium', 6, 3),
    ('Play', 120, 'Auditorium', 4, 1),
    ('Dances', 150, 'Auditorium', 5, 2),
    ('Musical-Singing performance', 90, 'Auditorium', 3, 3),
    ('Stand-up Comedy', 120, 'Auditorium', 4, 1),
    ('Play', 180, 'Auditorium', 6, 2),
    ('Dances', 150, 'Auditorium', 5, 3),
    ('Musical-Singing performance', 100, 'Auditorium', 4, 1),
    ('Stand-up Comedy', 210, 'Auditorium', 7, 2),
    ('Play', 90, 'Auditorium', 3, 3),
    ('Dances', 120, 'Auditorium', 4, 1),
    ('Musical-Singing performance', 180, 'Auditorium', 6, 2);
    
-- Insert data into Invitation table
INSERT INTO Invitation (invitee_name, invitation_status, task_id)
VALUES 
    ('Adil Majeed', 'Pending', 1),
    ('Khadija Mehmood', 'Accepted', 2),
    ('Atif Khursheed', 'Declined', 3),
    ('Ayesha Kamran', 'Pending', 4),
    ('Khizra Sohail', 'Accepted', 5),
    ('Sana Ilyas', 'Declined', 6),
    ('Sumaira Azhar', 'Pending', 7),
    ('Shafak Shakeel', 'Accepted', 8),
    ('Laraib Afzal', 'Declined', 9),
    ('Ansa Liaqat', 'Pending', 10),
    ('Abid Rauf', 'Accepted', 11),
    ('Mehreen Javaid', 'Declined', 12),
    ('Muhammad Hannan', 'Pending', 13),
    ('Sana Ahsan', 'Accepted', 14),
    ('Hassan Mujtaba', 'Declined', 15),
    ('Usman Ashraf', 'Pending', 16),
    ('Maham Haider', 'Accepted', 17),
    ('Arif Hussain', 'Declined', 18),
    ('Hazber Samson', 'Pending', 19),
    ('Shahbaz Hassan', 'Accepted', 20);

-- Insert data into Decoration table
INSERT INTO Decoration (requirements, task_id)
VALUES 
    ('Flower arrangements', 1),
    ('Balloon arches', 2),
    ('Lighting setup', 3),
    ('Backdrop design', 4),
    ('Centerpiece arrangements', 5),
    ('Fabric draping', 6),
    ('Candle arrangements', 7),
    ('Stage decorations', 8),
    ('Table settings', 9),
    ('Entrance decor', 10),
    ('Ceiling decorations', 11),
    ('Wall decor', 12),
    ('Outdoor decor', 13),
    ('Themed decor', 14),
    ('Furniture rentals', 15),
    ('Floor decorations', 16),
    ('Window treatments', 17),
    ('Event signage', 18),
    ('Props and accessories', 19),
    ('Audiovisual setup', 20);

-- Insert data into Budget table
INSERT INTO Budget (decor, cater, venue_booking, task_id)
VALUES 
    (1000.00, 2500.00, 1500.00, 1),
    (800.00, 2000.00, 1200.00, 2),
    (1200.00, 3000.00, 1800.00, 3),
    (900.00, 2200.00, 1300.00, 4),
    (1100.00, 2700.00, 1600.00, 5),
    (750.00, 1800.00, 1100.00, 6),
    (950.00, 2400.00, 1400.00, 7),
    (850.00, 2100.00, 1250.00, 8),
    (1150.00, 2800.00, 1650.00, 9),
    (1050.00, 2600.00, 1550.00, 10),
    (950.00, 2300.00, 1350.00, 11),
    (850.00, 2000.00, 1200.00, 12),
    (1000.00, 2500.00, 1500.00, 13),
    (800.00, 1900.00, 1150.00, 14),
    (1200.00, 3000.00, 1750.00, 15),
    (1100.00, 2700.00, 1600.00, 16),
    (750.00, 1800.00, 1050.00, 17),
    (950.00, 2300.00, 1400.00, 18),
    (850.00, 2100.00, 1250.00, 19),
    (1150.00, 2800.00, 1650.00, 20);