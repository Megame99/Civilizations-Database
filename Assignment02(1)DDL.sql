-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.io
-- Project Name: Assignment 02
-- Topic: Ancient Civilizations and Trade Routes
-- Model Author: Megan Machkouri
-- Creation Date: 2020-11-25
-- Description: Contains all DDL scripts required our database; creates entities, constraints and relationships.
-- This file can be executed repeatedly without error


-- object: public."Ancient_Civilizations_T" | type: TABLE --
DROP TABLE IF EXISTS public."Ancient_Civilizations_T" CASCADE;
CREATE TABLE public."Ancient_Civilizations_T"(
	"Civilization" varchar(25) NOT NULL,
	"Religion" varchar(15),
	"Government" varchar(25) NOT NULL,
	"Currency" varchar(25),
	CONSTRAINT "Civilizations_T_pk" PRIMARY KEY ("Civilization")
);
-- ddl-end --
--ALTER TABLE public."Ancient_Civilizations_T" OWNER TO postgres;
-- ddl-end --

-- object: public."Ancient_Cities_T" | type: TABLE --
DROP TABLE IF EXISTS public."Ancient_Cities_T" CASCADE;
CREATE TABLE public."Ancient_Cities_T"(
	"City_Name" varchar(25) NOT NULL UNIQUE,
	"Civilization" varchar(25) NOT NULL,
	"Trade_Hub" boolean NOT NULL,
	CONSTRAINT "City_T_pk" PRIMARY KEY ("City_Name"),
	CONSTRAINT FK_Civilizations FOREIGN KEY("Civilization") REFERENCES public."Ancient_Civilizations_T" ("Civilization") ON DELETE RESTRICT ON UPDATE CASCADE
);
-- ddl-end --
--ALTER TABLE public."Ancient_Cities_T" OWNER TO postgres;
-- ddl-end --

-- object: public."Traded_Resources_T" | type: TABLE --
DROP TABLE IF EXISTS public."Traded_Resources_T" CASCADE;
CREATE TABLE public."Traded_Resources_T"(
	"Resource_Name" varchar(25) NOT NULL UNIQUE,
	"Civilization" varchar(25) NOT NULL,
	"Origin" varchar(25) NOT NULL UNIQUE,
	"Quantity" integer,
	"Price" smallint,
	CONSTRAINT "Trade_Market_pk" PRIMARY KEY ("Resource_Name","Civilization"),
	CONSTRAINT "FK_Civilizations" FOREIGN KEY("Civilization") REFERENCES public."Ancient_Civilizations_T" ("Civilization") ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT "FK_City_T" FOREIGN KEY ("Origin") REFERENCES public."Ancient_Cities_T" ("City_Name") ON DELETE NO ACTION ON UPDATE NO ACTION
	
-- ddl-end --
);
-- ddl-end --
--ALTER TABLE public."Traded_Resources_T" OWNER TO postgres;
-- ddl-end --

-- object: public."Relationships_T" | type: TABLE --
DROP TABLE IF EXISTS Relationships_T CASCADE;
CREATE TABLE Relationships_T(
	"Civilization1" varchar(25) NOT NULL,
	"Civilization2" varchar(25) NOT NULL,
	"Share_Borders" boolean NOT NULL,
	"Allies" boolean,
	"Enemies" boolean,
	CONSTRAINT "Relationships_pk" PRIMARY KEY ("Civilization1","Civilization2"),
	CONSTRAINT "FK_Relationships" FOREIGN KEY ("Civilization1") REFERENCES public."Ancient_Civilizations_T" ("Civilization")ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT "FK_Relationships2" FOREIGN KEY ("Civilization2") REFERENCES public."Ancient_Civilizations_T" ("Civilization")ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ddl-end --
--ALTER TABLE Relationships_T OWNER TO postgres;
-- ddl-end -

-- object: public."Trade_Agreements_T" | type: TABLE --
DROP TABLE IF EXISTS public."Trade_Agreements_T" CASCADE;
CREATE TABLE public."Trade_Agreements_T"(
	"Resource" varchar(25) NOT NULL,
	"Sender" varchar(25) NOT NULL,
	"Receiver" varchar(25) NOT NULL,
	"City_Origin" varchar(25) NOT NULL,
	"Tax" smallint NOT NULL,
	"Quantity" smallint NOT NULL,
	CONSTRAINT "Trade_Deals_T_pk" PRIMARY KEY ("Resource","Sender","Receiver"),
	CONSTRAINT "FK_Resource_Market" FOREIGN KEY ("Resource") REFERENCES public."Traded_Resources_T" ("Resource_Name") ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT "FK_Sender_Relationships_T" FOREIGN KEY ("Sender", "Receiver") REFERENCES Relationships_T ("Civilization1", "Civilization2")ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT "FK_Receiver_Relationships_T" FOREIGN KEY ("Receiver", "Sender") REFERENCES Relationships_T ("Civilization2", "Civilization1")ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT "FK_Origin_Relationships_T" FOREIGN KEY ("City_Origin") REFERENCES public."Traded_Resources_T" ("Origin")ON DELETE NO ACTION ON UPDATE NO ACTION
);
--ALTER TABLE public."Trade_Agreements_T" DROP CONSTRAINT IF EXISTS "FK_Receiver_Relationships_T" CASCADE;
--ALTER TABLE public."Trade_Agreements_T" 	CONSTRAINT "FK_Receiver_Relationships_T" FOREIGN KEY ("Receiver", "Sender") REFERENCES Relationships_T ("Civilization2", "Civilization1")ON DELETE NO ACTION ON UPDATE NO ACTION
-- ddl-end --
--ALTER TABLE public."Trade_Agreements_T" OWNER TO postgres;
-- ddl-end --

-- object: public."Trade_Routes_T" | type: TABLE --
DROP TABLE IF EXISTS Trade_Routes_T CASCADE;
CREATE TABLE Trade_Routes_T(
	"City_Destination" varchar(25) NOT NULL,
	"City_Origin" varchar(25) NOT NULL,
	"Resource" varchar(25) NOT NULL,
	"Duration(Days)" integer,
	"Transportation_Method" varchar(10) NOT NULL,
	CONSTRAINT "Trade_Route_T_pk" PRIMARY KEY ("City_Destination","Resource", "City_Origin"),
	CONSTRAINT "FK_Trade_Resource" FOREIGN KEY ("Resource") REFERENCES public."Traded_Resources_T" ("Resource_Name")ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT "FK_Destination_City_T" FOREIGN KEY ("City_Destination") REFERENCES public."Ancient_Cities_T" ("City_Name")ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT "FK_Origin_Agreements_T" FOREIGN KEY ("City_Origin") REFERENCES public."Traded_Resources_T" ("Origin") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- 
-- -- object: public."many_Traded_Resources_T_has_many_Trade_Routes_T" | type: TABLE -- | | Relationship: many to many
DROP TABLE IF EXISTS public."many_Traded_Resources_T_has_many_Trade_Routes_T" CASCADE;
CREATE TABLE public."many_Traded_Resources_T_has_many_Trade_Routes_T"(
	"Resource_Name_Traded_Resources_T" varchar(25) NOT NULL,
	"Civilization_Traded_Resources_T" varchar(25) NOT NULL,
	"City_Destination_Trade_Routes_T" varchar(25) NOT NULL,
	"City_Origin_Trade_Routes_T" varchar(25) NOT NULL,
	"Resource_Trade_Routes_T" varchar(25) NOT NULL,
	CONSTRAINT "many_Traded_Resources_T_has_many_Trade_Routes_T_pk" PRIMARY KEY ("Resource_Name_Traded_Resources_T","Civilization_Traded_Resources_T","City_Destination_Trade_Routes_T","City_Origin_Trade_Routes_T","Resource_Trade_Routes_T")

);
-- -- ddl-end --
-- 
-- -- object: "Traded_Resources_T_fk" | type: CONSTRAINT --
ALTER TABLE public."many_Traded_Resources_T_has_many_Trade_Routes_T" DROP CONSTRAINT IF EXISTS "Traded_Resources_T_fk" CASCADE;
ALTER TABLE public."many_Traded_Resources_T_has_many_Trade_Routes_T" ADD CONSTRAINT "Traded_Resources_T_fk" FOREIGN KEY ("Resource_Name_Traded_Resources_T","Civilization_Traded_Resources_T")
REFERENCES public."Traded_Resources_T" ("Resource_Name","Civilization") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- -- ddl-end --
-- 
-- -- object: "Trade_Routes_T_fk" | type: CONSTRAINT --
 ALTER TABLE public."many_Traded_Resources_T_has_many_Trade_Routes_T" DROP CONSTRAINT IF EXISTS "Trade_Routes_T_fk" CASCADE;
ALTER TABLE public."many_Traded_Resources_T_has_many_Trade_Routes_T" ADD CONSTRAINT "Trade_Routes_T_fk" FOREIGN KEY ("City_Destination_Trade_Routes_T","City_Origin_Trade_Routes_T","Resource_Trade_Routes_T")
REFERENCES Trade_Routes_T ("City_Destination","City_Origin","Resource") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- -- ddl-end --
-- 
-- object: public."many_Traded_Resources_T_has_many_Trade_Agreements_T" | type: TABLE -- | Relationship: many to many
 DROP TABLE IF EXISTS public."many_Traded_Resources_T_has_many_Trade_Agreements_T" CASCADE;
CREATE TABLE public."many_Traded_Resources_T_has_many_Trade_Agreements_T"(
	"Resource_Name_Traded_Resources_T" varchar(25) NOT NULL,
	"Civilization_Traded_Resources_T" varchar(25) NOT NULL,
	"Resource_Trade_Agreements_T" varchar(25) NOT NULL,
	"Sender_Trade_Agreements_T" varchar(25) NOT NULL,
	"Receiver_Trade_Agreements_T" varchar(25) NOT NULL,
	"Origin_Traded_Resources_T" varchar(25) NOT NULL,
	CONSTRAINT "many_Traded_Resources_T_has_many_Trade_Agreements_T_pk" PRIMARY KEY ("Resource_Name_Traded_Resources_T","Civilization_Traded_Resources_T","Resource_Trade_Agreements_T","Sender_Trade_Agreements_T","Receiver_Trade_Agreements_T")

);
-- -- ddl-end --
-- 
-- -- object: "Traded_Resources_T_fk" | type: CONSTRAINT --
ALTER TABLE public."many_Traded_Resources_T_has_many_Trade_Agreements_T" DROP CONSTRAINT IF EXISTS "Traded_Resources_T_fk" CASCADE;
ALTER TABLE public."many_Traded_Resources_T_has_many_Trade_Agreements_T" ADD CONSTRAINT "Traded_Resources_T_fk" FOREIGN KEY ("Resource_Name_Traded_Resources_T","Civilization_Traded_Resources_T")
REFERENCES public."Traded_Resources_T" ("Resource_Name","Civilization") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --
-- 
-- -- object: "Trade_Agreements_T_fk" | type: CONSTRAINT --
ALTER TABLE public."many_Traded_Resources_T_has_many_Trade_Agreements_T" DROP CONSTRAINT IF EXISTS "Trade_Agreements_T_fk" CASCADE;
ALTER TABLE public."many_Traded_Resources_T_has_many_Trade_Agreements_T" ADD CONSTRAINT "Trade_Agreements_T_fk" FOREIGN KEY ("Resource_Trade_Agreements_T","Sender_Trade_Agreements_T","Receiver_Trade_Agreements_T")
REFERENCES public."Trade_Agreements_T" ("Resource","Sender","Receiver") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- -- ddl-end --


