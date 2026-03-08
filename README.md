# Database Management System (DBMS) Script & Web App

This project consists of SQL scripts to spin up a database and a Node.js web application that provides an interface to run `SELECT` queries against it. The application connects to Microsoft SQL Server using Windows Authentication.

## Project Structure

- `CreateDB.sql`: SQL script to create the database schema.
- `insertData.sql`: SQL script to populate the database with sample data.
- `sql-web-app/`: A Node.js web application that provides a localized web interface to execute queries.

## Prerequisites

Before running this project, ensure you have the following installed:
- **[Node.js](https://nodejs.org/)** (v14 or later)
- **Microsoft SQL Server** (e.g., SQL Server Express)
- **SQL Server Management Studio (SSMS)** or Azure Data Studio
- **[ODBC Driver 17 for SQL Server](https://learn.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver16)** (Required for the Node.js application to interact with SQL Server on Windows)

---

## 🚀 Getting Started

Follow these steps to get the database and applications up and running.

### 1. Database Setup

1. Open **SQL Server Management Studio (SSMS)**.
2. Connect to your local SQL Server instance using **Windows Authentication**.
3. Open and execute the `CreateDB.sql` script to create the database and tables.
4. Next, open and execute the `insertData.sql` script to populate the tables with initial data.
5. Take note of your **Server Name** (e.g., `localhost\SQLEXPRESS`) and your **Database Name**.

### 2. Web Application Setup

1. Open a terminal or command prompt and navigate to the web app directory:
   ```bash
   cd sql-web-app
   ```

2. Install the necessary Node.js dependencies:
   ```bash
   npm install
   ```

3. Setup your environment variables:
   - Create a copy of `.env.sample` inside the `sql-web-app` folder and rename it to `.env`.
   - Open `.env` and configure your database connection settings:
     ```env
     DB_SERVER=localhost\SQLEXPRESS  # Replace with your SQL Server Name
     DB_NAME=YourDatabaseName        # Replace with the Database name created in step 1
     PORT=3000
     ```

4. Start the Node.js server:
   ```bash
   npm start
   ```

5. Access the application:
   - Open your web browser and navigate to `http://localhost:3000`
   - You can now use the interface to securely execute `SELECT` queries on your database.

## Security Features
- **SQL Injection Prevention**: The server aggressively only permits `SELECT` statements, returning `403 Forbidden` if forbidden statements such as `DROP`, `DELETE`, `UPDATE`, `INSERT`, `ALTER`, `CREATE`, `TRUNCATE`, or `EXEC` are detected.
