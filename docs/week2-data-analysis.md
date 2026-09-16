# Week 2 - Data Analysis

## 1. Project Overview

**Project Name:** Secure Project Catalogue Management

This project focuses on managing project information securely and providing an organised project catalogue.

## 2. Team Structure

* 1 Project Manager
* 2 Developers
* 1 Tester
* 2 Reviewers

## 3. Project Data Inventory

The team identified the important data required by the system.

| Data Item               | Purpose                         | Who Creates It?  | Who Uses It?    | Required? |
| ----------------------- | ------------------------------- | ---------------- | --------------- | --------- |
| Project ID              | Identifies each project         | Developer/System | All users       | Yes       |
| Project Name            | Identifies the project          | Project Manager  | All users       | Yes       |
| Project Description     | Explains the project            | Project Manager  | All users       | Yes       |
| Project Status          | Shows current project status    | Project Manager  | All users       | Yes       |
| Project Owner           | Identifies project owner        | Project Manager  | Reviewers       | Yes       |
| Project Category        | Classifies the project          | Project Manager  | All users       | Yes       |
| Start Date              | Records project start           | Project Manager  | All users       | Yes       |
| End Date                | Records project completion      | Project Manager  | All users       | No        |
| Security Classification | Defines project sensitivity     | Project Manager  | Reviewers/Admin | Yes       |
| User ID                 | Identifies a user               | System/Admin     | System          | Yes       |
| Username                | Identifies login user           | User/Admin       | System          | Yes       |
| Email                   | User contact/login information  | User/Admin       | System          | Yes       |
| User Role               | Defines permissions             | Admin            | System          | Yes       |
| Team Member             | Records project members         | Project Manager  | Team            | No        |
| Reviewer                | Records assigned reviewer       | Project Manager  | Team            | No        |
| Review Status           | Records review result           | Reviewer         | Project Manager | Yes       |
| Review Date             | Records when review occurred    | Reviewer         | Project Manager | No        |
| Document Name           | Identifies project document     | Project Member   | Team/Reviewer   | No        |
| Document Type           | Identifies document format/type | Project Member   | Team/Reviewer   | No        |
| Created Date            | Records when data was created   | System           | All users       | Yes       |
| Updated Date            | Records latest update           | System           | All users       | Yes       |
| Project Version         | Tracks project version          | Developer        | Team            | Yes       |

## 4. Data Sources

The main data sources identified for the project are:

* Project Manager
* Developers
* Testers
* Reviewers
* System-generated information
* Project documents

## 5. Data Flow

The basic project data flow is:

**User/Project Manager → Enter Project Data → System Validation → Store Project Data → Project Catalogue → Review/Display Information**

The system receives project information, validates the data, stores it, and displays the information through the project catalogue.

## 6. Data Quality Risks

| Data Item               | Risk                         | Business Impact                        | Prevention Strategy          |
| ----------------------- | ---------------------------- | -------------------------------------- | ---------------------------- |
| Project Name            | Incorrect or incomplete name | Difficult to identify project          | Make field required          |
| Project Description     | Missing information          | Users may misunderstand project        | Validate required field      |
| Email                   | Invalid email format         | User communication problems            | Validate email format        |
| Project Owner           | Incorrect owner              | Responsibility becomes unclear         | Use controlled selection     |
| Project Status          | Incorrect status             | Misleading project information         | Use predefined status values |
| Security Classification | Incorrect classification     | Security/privacy risk                  | Restrict who can edit it     |
| Project ID              | Duplicate ID                 | Data confusion                         | Generate unique ID           |
| Start Date              | Invalid date                 | Incorrect project timeline             | Validate date                |
| Review Status           | Incorrect review result      | Incorrect project approval information | Reviewer confirmation        |
| User Role               | Incorrect permissions        | Unauthorised access                    | Role-based access control    |

## 7. Future Development

### Permanent Data

The following information should remain stored permanently:

* Project ID
* Project Name
* Project Description
* Project Owner
* Project history
* Project documents

### Frequently Changing Data

The following information may change regularly:

* Project Status
* Project Members
* Project Description
* Review Status
* Project Version

### Restricted/Admin Data

Some information should have restricted access:

* User passwords
* User roles
* Security classifications
* Administrative information

### Future Reports

The system could later provide:

* Project status reports
* Project completion reports
* Project review reports
* Project activity/history reports
* Project category reports

## 8. Week 2 Conclusion

Week 2 helped the team identify the important project data, understand how data moves through the system, identify data quality risks, and plan future information requirements. These findings will support the database and backend development of the project.
