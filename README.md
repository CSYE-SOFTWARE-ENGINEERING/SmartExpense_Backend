# SmartExpense_Backend

## Project Overview

**SmartExpense_Backend** is a backend service designed to help users manage and track personal or business expenses. It provides a secure and efficient RESTful API that powers front-end applications, enabling full control over expense-related data.

## Features

- **User Authentication & Authorization**: Secure access to user-specific expense data.
- **Expense Management**: Create, read, update, and delete expense records.
- **Category Tagging**: Organize expenses by customizable categories.
- **Reports & Analytics**: Generate insightful reports to understand spending habits.

## Tech Stack

- **Language**: Java
- **Framework**: Spring Boot
- **Database**: MySQL
- **API Documentation**: Swagger

## Project Structure

SmartExpense_Backend/               ← Root project directory

├── .vscode/                        ← VS Code project settings

├── docs/                           ← Project documentation files

├── .github/workflows/             ← GitHub Actions CI/CD workflow configs

├── smartexpense/                  ← Main source code directory

│   ├── controllers/               ← Handles incoming HTTP requests (API controllers)

│   ├── models/                    ← Domain models and entity classes

│   ├── repositories/              ← Data access layer (interacts with the database)
│   ├── services/                  ← Business logic layer

│   └── SmartExpenseApplication.java ← Main Spring Boot application entry point

├── README.md                      ← Project README documentation

└── java-app.pkr.hcl               ← Deployment/packaging configuration file (HCL format)

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/CSYE-SOFTWARE-ENGINEERING/SmartExpense_Backend.git
cd SmartExpense_Backend

2. Configure Environment
Make sure you have Java 11+ installed.

Set up the database and update connection settings in application.properties or application.yml.

3. Run the Application
Using Maven:./mvnw spring-boot:run

Using Gradle:./gradlew bootRun

The application will be available at http://localhost:8080.

API Documentation
When the application is running, you can access the Swagger UI at:
http://localhost:8080/swagger-ui.html


License
This project is licensed under the MIT License. See the LICENSE file for details.




