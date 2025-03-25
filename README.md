# Farewell Management System
This repository contains the documentation and design artifacts for the Farewell Management System database project. This project was developed as part of an academic assignment to design a comprehensive database system for managing farewell events. It includes the complete Entity-Relationship Diagram (EERD), relational schema, table descriptions, schema diagrams, and detailed portal descriptions for various user roles.
________________________________________
## Overview
The Farewell Management System is designed to handle multiple aspects of event management. The system supports functionalities such as organizer verification, task assignments, event registration, menu selection with a voting mechanism, and event promotions. It aims to streamline the process of managing farewell events by providing distinct interfaces for organizers and attendees.
________________________________________
## Features
•	Comprehensive Database Design:
o	Detailed Entity-Relationship Diagram (EERD)
o	Well-structured relational schema
o	In-depth table descriptions and schema diagrams
•	Multiple User Roles:
o	Organizer: Login and task management interface
o	Attendee: Registration and menu voting portal
o	Additional Roles: Teacher, Student, and Voting functionalities for extended user engagement
•	Dynamic Portals:
o	Organizer ID Check (with task assignment)
o	Event Registration Page
o	Menu and Voting Page
o	Event on Trend Page (for event promotion)
________________________________________
## Database Design
EERD
The project includes an EERD that visually represents the relationships between different entities within the system.
Relational Schema
The system is based on a relational schema that includes the following tables:
•	User: Contains user credentials (user_id, login, password).
•	Organizer: Extends the user data with organizer-specific attributes (organizer_id, role, linked to User and Event).
•	Attendee: Stores attendee information (attendee_id, name, contact_number, email, family_count, linked to User and Event).
•	Teacher & Student: Separate tables for educators and students with their respective details.
•	Voting: Captures voting details for various menu options.
•	Event: Maintains event information (event_id, venue, date).
•	Menu: Manages menu items along with related votes.
•	Task, Performance, Invitation, Decoration, Budget: These tables handle task management, performance details, invitations, decoration requirements, and budget allocations for the event.
Table Descriptions
Each table is documented with its respective attributes and keys, ensuring clarity on the data relationships and constraints.
Schema Diagram
A detailed schema diagram is included in the documentation, illustrating the connections between tables and reinforcing the integrity of the design.
________________________________________
## Portal Descriptions
The project features multiple user interface portals designed for different roles:
•	Organizer ID Check:
A secure login interface for event organizers with built-in error handling and ID verification.
•	Farewell 24 Event Homepage:
The main landing page features a countdown timer, login section, and role selection options for both organizers and participants.
•	Organizer ID Check with Task Assignment:
Upon successful login, organizers can view and manage assigned tasks (such as budgeting and decoration).
•	Event Registration Page:
A user-friendly registration portal for attendees to provide personal and logistical information.
•	Menu and Voting Page:
Enables attendees to view the event menu and cast votes for their favorite dishes, influencing the final menu selection.
•	Event on Trend Page:
Highlights key events (e.g., "Farewell Batch 2024") with event details and a registration call-to-action.
________________________________________


