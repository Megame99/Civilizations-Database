-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 9.5
-- Project Site: pgmodeler.io
-- Model Author: Megan Machkouri
-- Creation Date: 2020-11-25
-- Description: Contains all DML scripts required to populate our new_database, INSERT Statements adhere to constraints.
-- This file can be executed repeatedly without error

-- object: Tables within new_database | type: Table(s) | Statement: DELETE |Date: 2020-11-25
DELETE FROM  Trade_Routes_T;
DELETE FROM  public."Trade_Agreements_T";
DELETE FROM Relationships_T;
DELETE FROM  public."Traded_Resources_T";
DELETE FROM  public."Ancient_Cities_T";
DELETE FROM public."Ancient_Civilizations_T";
-- dml-end --

-- object: public."Ancient_Civilizations_T" | type: TABLE | Statement: INSERT |Date: 2020-11-25
INSERT INTO public."Ancient_Civilizations_T" VALUES('Mongol', 'Free Religion', 'Monarchy', 'Unknown');
INSERT INTO public."Ancient_Civilizations_T" VALUES('Roman', 'Greco-Roman', 'Empire', 'Latin');
INSERT INTO public."Ancient_Civilizations_T" VALUES('Carthage', 'Punic', 'Oligarchic Republic', 'Numidian');
INSERT INTO public."Ancient_Civilizations_T" VALUES('Egyptian', 'Polytheistic', 'Monarchy', 'Nubian');
INSERT INTO public."Ancient_Civilizations_T" VALUES('Greek', 'Polytheistic', 'Democracy', 'Greek');
INSERT INTO public."Ancient_Civilizations_T" VALUES('Viking', 'Pagan', 'Clans', 'Old Norse');
INSERT INTO public."Ancient_Civilizations_T" VALUES('Chinese', 'Confucianism', 'Monarchy', 'Chinese');
-- dml-end --

-- object: public."Ancient_Cities_T" | type: TABLE | Statement: INSERT |Date: 2020-11-25
INSERT INTO public."Ancient_Cities_T" VALUES('Rome', 'Roman', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Alexandria', 'Roman', false);
INSERT INTO public."Ancient_Cities_T" VALUES('Ostia', 'Roman', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Lungcheng', 'Mongol', false);
INSERT INTO public."Ancient_Cities_T" VALUES('Karakorum', 'Mongol', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Baibalyk', 'Mongol', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Thebes', 'Egyptian', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Memphis', 'Egyptian', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Heliopolis', 'Egyptian', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Crocodilopolis', 'Egyptian', false);
INSERT INTO public."Ancient_Cities_T" VALUES('Troy', 'Greek', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Athens', 'Greek', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Ithaca', 'Greek', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Nanjing', 'Chinese', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Shanghai', 'Chinese', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Beijing', 'Chinese', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Carthage', 'Carthage', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Utique', 'Carthage', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Lixus', 'Carthage', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Oslo', 'Viking', true);
INSERT INTO public."Ancient_Cities_T" VALUES('Kattagat', 'Viking', true);
-- dml-end --

-- object: public."Traded_Resources_T" | type: TABLE | Statement: INSERT |Date: 2020-11-25
INSERT INTO public."Traded_Resources_T" VALUES('Sheepskin', 'Viking', 'Kattagat');
INSERT INTO public."Traded_Resources_T" VALUES('Chainmail', 'Viking', 'Oslo');
INSERT INTO public."Traded_Resources_T" VALUES('Stallion', 'Mongol', 'Karakorum');
INSERT INTO public."Traded_Resources_T" VALUES('Silk', 'Mongol', 'Lungcheng');
INSERT INTO public."Traded_Resources_T" VALUES('Rice', 'Chinese', 'Nanjing');
INSERT INTO public."Traded_Resources_T" VALUES('Steel', 'Chinese', 'Beijing');
INSERT INTO public."Traded_Resources_T" VALUES('Coffee', 'Carthage', 'Carthage');
INSERT INTO public."Traded_Resources_T" VALUES('Gold', 'Carthage', 'Utique');
INSERT INTO public."Traded_Resources_T" VALUES('Ivory', 'Carthage', 'Lixus');
INSERT INTO public."Traded_Resources_T" VALUES('Cotton', 'Egyptian', 'Memphis');
INSERT INTO public."Traded_Resources_T" VALUES('Grain', 'Egyptian', 'Thebes');
INSERT INTO public."Traded_Resources_T" VALUES('Linen', 'Egyptian', 'Heliopolis');
INSERT INTO public."Traded_Resources_T" VALUES('Wine', 'Roman', 'Ostia');
INSERT INTO public."Traded_Resources_T" VALUES('Ceramics', 'Roman', 'Rome');
INSERT INTO public."Traded_Resources_T" VALUES('Olives', 'Greek', 'Athens');
INSERT INTO public."Traded_Resources_T" VALUES('Tools', 'Greek', 'Troy');
INSERT INTO public."Traded_Resources_T" VALUES('Fish', 'Greek', 'Ithaca');
-- dml-end --

-- object: public."Relationships_T" | type: TABLE | Statement: INSERT |Date: 2020-11-25
INSERT INTO Relationships_T VALUES('Roman', 'Viking', true, true, false);
INSERT INTO Relationships_T VALUES('Egyptian','Carthage',true, true, false);
INSERT INTO Relationships_T VALUES('Egyptian','Roman',true, true, false);
INSERT INTO Relationships_T VALUES('Egyptian','Greek',true, true, false);
INSERT INTO Relationships_T VALUES('Carthage', 'Roman', true, false, true);
INSERT INTO Relationships_T VALUES('Carthage', 'Mongol', true, true, false);
INSERT INTO Relationships_T VALUES('Carthage', 'Egyptian', true, true, false);
INSERT INTO Relationships_T VALUES('Carthage', 'Viking', true, false, true);
INSERT INTO Relationships_T VALUES('Mongol', 'Roman', true, true, false);
INSERT INTO Relationships_T VALUES('Viking', 'Carthage', false, true, false);
INSERT INTO Relationships_T VALUES('Chinese', 'Viking', false, true, false);
INSERT INTO Relationships_T VALUES('Greek','Carthage',true, true, false);
INSERT INTO Relationships_T VALUES( 'Greek', 'Mongol', true, false, true);
INSERT INTO Relationships_T VALUES('Mongol', 'Chinese', true, false, true);
INSERT INTO Relationships_T VALUES( 'Greek', 'Roman', true, false, true);
-- dml-end --

-- object: public."Trade_Agreements_T" | type: TABLE | Statement: INSERT |Date: 2020-11-25
INSERT INTO public."Trade_Agreements_T" VALUES('Fish', 'Greek', 'Carthage','Ithaca', 1.33, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Olives', 'Greek', 'Carthage','Athens', 1.33, 3000);
INSERT INTO public."Trade_Agreements_T" VALUES('Gold', 'Carthage', 'Roman', 'Carthage',1.11, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Gold', 'Carthage', 'Egyptian','Carthage', 1.01, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Ivory', 'Carthage', 'Roman','Carthage', 1.11, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Coffee', 'Carthage', 'Egyptian','Carthage', 1.03, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Coffee', 'Carthage', 'Mongol', 'Carthage',1.03, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Silk', 'Mongol', 'Roman','Karakorum', 1.17, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Steel', 'Chinese', 'Viking', 'Beijing', 1.23, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Stallion', 'Mongol', 'Roman', 'Karakorum', 1.03, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Chainmail', 'Viking', 'Carthage','Oslo', 1.03, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Wine', 'Roman', 'Viking','Ostia', 1.03, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Linen', 'Egyptian', 'Roman', 'Heliopolis', 1.13, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Grain', 'Egyptian', 'Roman', 'Thebes', 1.13, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Linen', 'Egyptian', 'Carthage', 'Memphis', 1.03, 1000);
INSERT INTO public."Trade_Agreements_T" VALUES('Linen', 'Egyptian', 'Greek','Memphis', 1.03, 1000);
-- dml-end --


-- object: public."Trade_Routes_T" | type: TABLE | Statement: INSERT |Date: 2020-11-25
INSERT INTO Trade_Routes_T VALUES('Carthage', 'Ithaca', 'Fish', 30, 'Boat');
INSERT INTO Trade_Routes_T VALUES('Carthage', 'Athens', 'Olives', 40, 'Boat');
INSERT INTO Trade_Routes_T VALUES('Rome', 'Carthage', 'Gold', 30, 'Boat');
INSERT INTO Trade_Routes_T VALUES('Thebes', 'Carthage', 'Gold', 50, 'Road');
INSERT INTO Trade_Routes_T VALUES('Alexandria', 'Carthage', 'Ivory', 30, 'Boat');
INSERT INTO Trade_Routes_T VALUES('Heliopolis', 'Carthage', 'Coffee', 70, 'Road');
INSERT INTO Trade_Routes_T VALUES('Karakorum', 'Carthage', 'Coffee', 350, 'Road');
INSERT INTO Trade_Routes_T VALUES( 'Rome', 'Karakorum', 'Silk', 300, 'Road');
INSERT INTO Trade_Routes_T VALUES( 'Ostia', 'Karakorum', 'Stallion', 300, 'Road');
INSERT INTO Trade_Routes_T VALUES( 'Oslo', 'Beijing','Steel', 120, 'Road');
INSERT INTO Trade_Routes_T VALUES( 'Rome', 'Heliopolis', 'Linen', 20, 'Boat');
INSERT INTO Trade_Routes_T VALUES( 'Athens','Memphis', 'Linen', 50, 'Boat');
-- dml-end --





