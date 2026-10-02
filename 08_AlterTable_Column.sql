/*
Alter table - cos'è e perchè si usa in sql server?
Alter table serve per modificare una tabella già esistente, senza doverla ricreare.
Con Alter Table:
	aggiungere colonne
	modificare le colonne
	eliminare le colonne 
	aggiungere vincoli (primary key, Foreign key, unique, check)
	eliminare vincoli
	rinominare colonne 
	cambiare i tipi di dati
	modificare una colonna in default
*/
-- Aggiunge una colonna nella tabella studenti

ALTER TABLE Studenti
ADD Indirizzo NVARCHAR(150) NULL;

SELECT * FROM Studenti;

-- ADD Aggiunge una nuova colonna
-- Null significa che è opzionale 

-- Modificare una colonna (tipo di dato)
-- Modificare/sostituire il tipo di dato della colonna telefono da (Nvarchar(50) a Varchard(20))

ALTER TABLE Studenti
ALTER COLUMN Telefono VARCHAR(100) NOT NULL;

-- Rinominare una colonna
EXEC sp_rename 'Studenti.DatadiNascita', 'Data_di_Nascita';

-- ELIMINARE UNA COLONNA
ALTER TABLE Studenti
DROP COLUMN Indirizzo;

-- Aggiungere una chiave esterna
-- assiungere una FK alla tabella dei voti

ALTER TABLE Voti
ADD CONSTRAINT FK_Voti_Studenti
FOREIGN KEY (StudenteId) REFERENCES Studenti(StudenteId);

-- ELIMINARE UNA FOREIGN KEY

ALTER TABLE Voti
DROP CONSTRAINT FK_Voti_Studenti;

-- Aggiungere un vincolo UNIQUE
ALTER TABLE Studenti
ADD CONSTRAINT UQ_Studenti_Telefono UNIQUE(Telefono);

-- AGGIUNGERE UN DEFAULT
-- IMPOSTARE UN VALORE BASE ES. Superato =1 nei voti

ALTER TABLE Voti
ADD CONSTRAINT DF_Voti_Superato DEFAULT 1 FOR Superato;

-- AGGIUNGERE PIù COLONNE INSIEME
ALTER TABLE Studenti
ADD Indirizzo NVARCHAR(150) NULL,
	Nazione CHAR(50) NULL,
	provincia NVARCHAR(20);

ALTER TABLE Studenti
DROP COLUMN Indirizzo, Nazione, provincia;