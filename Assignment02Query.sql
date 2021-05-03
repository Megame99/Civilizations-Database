-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.io
-- Project Name: Assignment 02
-- Topic: Ancient Civilizations and Trade Routes
-- Model Author: Megan Machkouri
-- Creation Date: 2020-11-25
-- Description: Contains assignment queries. Including simple SQL statements such as
-- JOINS, SELECT, SUBQUERIES & UNIONS


SELECT * FROM public."Ancient_Civilizations_T";
SELECT * FROM public."Ancient_Cities_T";
SELECT * FROM public."Traded_Resources_T";
SELECT * FROM Relationships_T;
SELECT * FROM public."Trade_Agreements_T";
SELECT * FROM Trade_Routes_T;

DROP VIEW IF EXISTS Asia_View;
DROP VIEW IF EXISTS Mediterranean_View;
-- object: public."Ancient_Cities_T" | Statement: SELECT | DATE 2020-11-26
-- Description: Displays all Roman Cities within the Ancient_Cities_T
SELECT * 
FROM public."Ancient_Cities_T"
WHERE "Civilization" = 'Roman';
-- Query End --

---- object: public."Traded_Resources_T" | Statement: SELECT | DATE 2020-11-26
-- Description: Displays all resources traded by Carthage within the Traded_Resources_T

SELECT * 
FROM public."Traded_Resources_T"
WHERE "Civilization" = 'Carthage';
-- Query End --

------ object: Relationships_T" | Statement: SELECT | DATE 2020-11-26
-- Description: Displays all friendly relationships(allies) between Civilizations within the Relationships_T

SELECT * 
FROM Relationships_T
WHERE "Allies" = true;

------ objects: public."Ancient_Cities_T" & public."Ancient_Civilizations_T"| OPERATION: Union| DATE 2020-11-26
-- Description: Displays all friendly relationships(allies) between Civilizations within the Relationships_T

SELECT "City_Origin", "Tax", "Quantity" 
FROM public."Trade_Agreements_T"
UNION
SELECT "Civilization", "Price", "Quantity"
FROM public."Traded_Resources_T";
-- Query End --

------ objects: public."Ancient_Cities_T" & public."Trade_Routes"| OPERATION: Union| DATE 2020-11-26
-- Description: Displays all cities within cities table that ARE city or origins in the trade routes table

SELECT City."City_Name"
FROM public."Ancient_Cities_T" AS City
RIGHT OUTER JOIN Trade_Routes_T AS Trade ON City."City_Name" = Trade."City_Origin";

------ objects: public."Ancient_Cities_T" & public."Trade_Routes"| OPERATION: RIGHT OUTER JOIN| DATE 2020-11-26
-- Description: Displays all cities within city table that ARE NOT city of origins within the trade routes table 
SELECT City."City_Name"
FROM public."Ancient_Cities_T" AS City
LEFT OUTER JOIN Trade_Routes_T AS Trade ON City."City_Name" = Trade."City_Origin"
WHERE Trade."City_Origin" IS NULL;
-- Query End --

------ objects: public."Ancient_Cities_T" & public."Trade_Routes"| OPERATION: SUBQUERY| DATE 2020-11-26
-- Description: Displays all resources within the traded resources table that DO NOT appear in the trade routes table

SELECT *
FROM public."Traded_Resources_T"
WHERE "Resource_Name" NOT IN (SELECT "Resource" FROM Trade_Routes_T);
-- Query End --

------ objects: public."Ancient_Cities_T" & public."Trade_Routes"| OPERATION: SUBQUERY| DATE 2020-11-26
-- Description: Displays all civilizations that do not receive any trade goods.

SELECT DISTINCT "Civilization"
FROM public."Traded_Resources_T"
WHERE "Civilization" NOT IN (SELECT "Receiver" FROM public."Trade_Agreements_T");
-- Query End --

------ objects: public."Traded_Resources_T"| OPERATION: Create View | DATE 2020-11-26
-- Description: Displays all resources on the continent of asia.
CREATE VIEW Asia_View AS 
SELECT "Resource_Name", "Civilization"
FROM public."Traded_Resources_T"
WHERE "Civilization" IN('Mongol', 'Chinese');

SELECT * FROM Asia_View;
------ objects: public."Traded_Resources_T"| OPERATION: Create View | DATE 2020-11-26
-- Description: Displays all resources along the mediterranean coast.						
CREATE VIEW Mediterranean_View AS 
SELECT "Resource_Name", "Civilization"
FROM public."Traded_Resources_T"
WHERE "Civilization" IN('Roman', 'Greek', 'Egypt','Carthage');

SELECT * FROM Mediterranean_View;
-- SELECT column_name, data_type, character_maximum_length FROM information_schema.columns WHERE
-- TABLE_NAME = 'Relationships_T';
