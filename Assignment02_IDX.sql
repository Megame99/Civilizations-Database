-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.io
-- Project Name: Assignment 02
-- Topic: Ancient Civilizations and Trade Routes
-- Model Author: Megan Machkouri
-- Creation Date: 2020-11-25
-- Description: Contains all index creations scripts

-- object: public.Traded_Resources_T | Statement: Create INDEX| DATE 2020-11-25
CREATE INDEX IndResource ON public."Traded_Resources_T"("Resource_Name");
-- ddlend --
-- object: public."Ancient_Cities_T" | Statement: Create INDEX| DATE 2020-11-25
CREATE INDEX IndCityName ON public."Ancient_Cities_T"("City_Name");
 -- ddl end -- 