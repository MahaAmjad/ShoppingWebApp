#### Installations
IDE: Visual Studio 2022
.Net Framework 8.0
Database: MS SQL SERVER 2022

### Setup & configuration

1: Setup Databse > Run Initial Script In MS SQL Server to setup database.
   You can find script in root > DbScripts > InitialScriptWithData.sql
   Script contains some test data to test APIs.

2: Change DB Connection String in appsettings.json & DBContext(ApplicationDbContext & ShoppingDbContext)

3: Run Project
   In Swagger UI, You can use Test Credetials in Login API to get access token for authorization
   ***Credentials***
   ***Email: johnsteve@gmail.com***
   ***Password: M_opera15***
   Use Access token to authorize and further use APIs