1-Select All Columns from Employees
CompanyDatabase> SELECT * FROM "Employees";
+----------------+---------+--------------------------+----------------+------------+----+-------------+
| FullName       | Salary  | JobPosition              | PhoneExtension | IsPartTime | Id | ParkingSpot |
|----------------+---------+--------------------------+----------------+------------+----+-------------|
| Dino Ribeiro   | 100000  | Software Engineer        | 101            | False      | 1  | <null>      |
| Dawn Ribeiro   | 200000  | Senior Software Engineer | 100            | False      | 0  | <null>      |
| BJ Ribeiro     | 150000  | Senior Project Manager   | 102            | False      | 2  | <null>      |
| Kahlua Ribeiro | 35000   | Junior Analyst           | 103            | True       | 3  | <null>      |
| Gaspar Ribeiro | 40000   | Head of Security         | 104            | False      | 4  | <null>      |
| Salah Ribeiro  | 85000   | Head Chef                | 200            | False      | 5  | <null>      |
| Becker Ribeiro | 1250000 | Chief Executive Officer  | 500            | False      | 6  | <null>      |
| Jason Perry    | 450     | Software Developer       | 999            | True       | 8  | <null>      |
| Lazy Larry     | 85000   | Junior IT                | 333            | False      | 9  | <null>      |
+----------------+---------+--------------------------+----------------+------------+----+-------------+
SELECT 9
Time: 0.029s

2- Select only the full names and phone extensions for only full-time employees.
CompanyDatabase> SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'True';
+----------------+----------------+
| FullName       | PhoneExtension |
|----------------+----------------|
| Kahlua Ribeiro | 103            |
| Jason Perry    | 999            |
+----------------+----------------+
SELECT 2
Time: 0.009s

3-Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.
CompanyDatabase> INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "Id") VALUES ('Jason Perry', '450', 'Software Developer', '999', 'True', '8');
INSERT 0 1
Time: 0.002s



4- Update all employees that are cooks to have a salary of 500.
CompanyDatabase> INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "Id") VALUES ('Gordon Ramsey', '100', 'Cook', '555', 'True', '10');
INSERT 0 1
Time: 0.004s
CompanyDatabase> UPDATE "Employees" SET "Salary" = '100' WHERE "JobPosition" = 'Cook';
You are about to run a destructive command.
Do you want to proceed? (y/n): y
Your call!
UPDATE 1
Time: 0.004s

5-Delete all employees that have the full name of "Lazy Larry".
CompanyDatabase> DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';
You are about to run a destructive command.
Do you want to proceed? (y/n): y
Your call!
DELETE 1
Time: 0.003s

6-Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.
CompanyDatabase> ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);
You are about to run a destructive command.
Do you want to proceed? (y/n): y
Your call!
ALTER TABLE
Time: 0.007s

+----------------+---------+--------------------------+----------------+------------+----+-------------+
| FullName       | Salary  | JobPosition              | PhoneExtension | IsPartTime | Id | ParkingSpot |
|----------------+---------+--------------------------+----------------+------------+----+-------------|
| Dino Ribeiro   | 100000  | Software Engineer        | 101            | False      | 1  | <null>      |
| Dawn Ribeiro   | 200000  | Senior Software Engineer | 100            | False      | 0  | <null>      |
| BJ Ribeiro     | 150000  | Senior Project Manager   | 102            | False      | 2  | <null>      |
| Kahlua Ribeiro | 35000   | Junior Analyst           | 103            | True       | 3  | <null>      |
| Gaspar Ribeiro | 40000   | Head of Security         | 104            | False      | 4  | <null>      |
| Salah Ribeiro  | 85000   | Head Chef                | 200            | False      | 5  | <null>      |
| Becker Ribeiro | 1250000 | Chief Executive Officer  | 500            | False      | 6  | <null>      |
| Jason Perry    | 450     | Software Developer       | 999            | True       | 8  | <null>      |
| Gordon Ramsey  | 100     | Cook                     | 555            | True       | 10 | <null>      |
+----------------+---------+--------------------------+----------------+------------+----+-------------+

EPIC MODE

Create a second table: Departments that has these columns:
Name
BuildingNumber

CompanyDatabase> CREATE TABLE "Departments" (
................ "Name" TEXT NOT NULL,
................ "BuildingNumber" INT);
CREATE TABLE
Time: 0.012s
CompanyDatabase> SELECT * FROM "Departments";
+------+----------------+
| Name | BuildingNumber |
|------+----------------|
+------+----------------+
SELECT 0
Time: 0.009s

/*Had to create a new Serial Primary key to the deparment table*/

CompanyDatabase> ALTER TABLE "Departments" ADD COLUMN "Id" SERIAL PRIMARY KEY;
You are about to run a destructive command.
Do you want to proceed? (y/n): y
Your call!
ALTER TABLE
Time: 0.049s
CompanyDatabase> SELECT * FROM "Departments";
+-----------------+----------------+----+
| Name            | BuildingNumber | Id |
|-----------------+----------------+----|
| Headquarters    | 1              | 1  |
| Kitchen         | 2              | 2  |
| Security Office | 3              | 3  |
+-----------------+----------------+----+
SELECT 3
Time: 0.009s
CompanyDatabase> ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");
You are about to run a destructive command.
Do you want to proceed? (y/n): y
Your call!
ALTER TABLE
Time: 0.012s

/*INSERT EMPLOYEES AND RELATED DEPARTMENTS*/

CompanyDatabase> SELECT * FROM "Employees";
+----------------+---------+--------------------------+----------------+------------+----+-------------+--------------+
| FullName       | Salary  | JobPosition              | PhoneExtension | IsPartTime | Id | ParkingSpot | DepartmentId |
|----------------+---------+--------------------------+----------------+------------+----+-------------+--------------|
| Dino Ribeiro   | 100000  | Software Engineer        | 101            | False      | 1  | <null>      | 1            |
| Dawn Ribeiro   | 200000  | Senior Software Engineer | 100            | False      | 0  | <null>      | 1            |
| BJ Ribeiro     | 150000  | Senior Project Manager   | 102            | False      | 2  | <null>      | 1            |
| Kahlua Ribeiro | 35000   | Junior Analyst           | 103            | True       | 3  | <null>      | 1            |
| Becker Ribeiro | 1250000 | Chief Executive Officer  | 500            | False      | 6  | <null>      | 1            |
| Salah Ribeiro  | 85000   | Head Chef                | 200            | False      | 5  | <null>      | 2            |
| Gordon Ramsey  | 100     | Cook                     | 555            | True       | 10 | <null>      | 2            |
| Gaspar Ribeiro | 40000   | Head of Security         | 104            | False      | 4  | <null>      | 3            |
| Bobby Firmino  | 38000   | Private Investigator     | 444            | False      | 11 | <null>      | 3            |
| Jason Perry    | 450     | Software Developer       | 999            | True       | 8  | <null>      | 1            |
+----------------+---------+--------------------------+----------------+------------+----+-------------+--------------+
SELECT 10
Time: 0.013s

/*USE SQL JOINS TO QUERY*/

CompanyDatabase> SELECT * FROM "Employees" JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId";
+----------------+---------+--------------------------+----------------+------------+----+-------------+--------------+-----------------+----------------+----+
| FullName       | Salary  | JobPosition              | PhoneExtension | IsPartTime | Id | ParkingSpot | DepartmentId | Name            | BuildingNumber | Id |
|----------------+---------+--------------------------+----------------+------------+----+-------------+--------------+-----------------+----------------+----|
| Dino Ribeiro   | 100000  | Software Engineer        | 101            | False      | 1  | <null>      | 1            | Headquarters    | 1              | 1  |
| Dawn Ribeiro   | 200000  | Senior Software Engineer | 100            | False      | 0  | <null>      | 1            | Headquarters    | 1              | 1  |
| BJ Ribeiro     | 150000  | Senior Project Manager   | 102            | False      | 2  | <null>      | 1            | Headquarters    | 1              | 1  |
| Kahlua Ribeiro | 35000   | Junior Analyst           | 103            | True       | 3  | <null>      | 1            | Headquarters    | 1              | 1  |
| Becker Ribeiro | 1250000 | Chief Executive Officer  | 500            | False      | 6  | <null>      | 1            | Headquarters    | 1              | 1  |
| Salah Ribeiro  | 85000   | Head Chef                | 200            | False      | 5  | <null>      | 2            | Kitchen         | 2              | 2  |
| Gordon Ramsey  | 100     | Cook                     | 555            | True       | 10 | <null>      | 2            | Kitchen         | 2              | 2  |
| Gaspar Ribeiro | 40000   | Head of Security         | 104            | False      | 4  | <null>      | 3            | Security Office | 3              | 3  |
| Bobby Firmino  | 38000   | Private Investigator     | 444            | False      | 11 | <null>      | 3            | Security Office | 3              | 3  |
| Jason Perry    | 450     | Software Developer       | 999            | True       | 8  | <null>      | 1            | Headquarters    | 1              | 1  |
+----------------+---------+--------------------------+----------------+------------+----+-------------+--------------+-----------------+----------------+----+
SELECT 10
Time: 0.016s