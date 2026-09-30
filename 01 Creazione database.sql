-- il commento si usa per definire 
-- Create Database nome del database




-- CREATE DATABASE ScuolaDb; --

-- uso del database
USE ScuolaDb;
GO

--I tipi di dati in sql server
/*
I tipi di dati in sql
Int= intero
Char = carattere (A)
VarcHAR testo (stringa) 16
NvarcHAR= testo (stringa) 35
Flaot = decimali (10.2)
Date = data
*/


-- DROP TABLE IF EXISTS Studenti; questa stringa cancella la tabella se già presente nel db, serve per non creare doppioni

-- Creazione Tabelle
CREATE TABLE Studenti (


 -- ID univoco dello studente
    -- INT = numero intero
    -- PRIMARY KEY = chiave primaria (identifica ogni riga)
    -- IDENTITY(1,1) = auto incremento (parte da 1 e aumenta di 1)
    StudentiID INT NOT NULL PRIMARY KEY IDENTITY(1,1),

    -- Nome dello studente
    -- NVARCHAR(50) = testo Unicode (supporta caratteri speciali)
    -- NOT NULL = campo obbligatorio
    Nome NVARCHAR(50) NOT NULL,

    -- Cognome dello studente
    Cognome NVARCHAR(50) NOT NULL,

    -- Data di nascita
    -- DATE = formato YYYY-MM-DD
    -- NULL = opzionale
    DataNascita DATE NULL,

    -- Email
    -- UNIQUE = non possono esistere duplicati
    -- NOT NULL = obbligatorio
    Email NVARCHAR(150) UNIQUE NOT NULL,

    -- Numero di telefono
    -- VARCHAR = testo normale (no Unicode)
    Telefono VARCHAR(50) UNIQUE NOT NULL,

    -- Codice Fiscale
    -- CHAR(16) = lunghezza fissa di 16 caratteri
    CodiceFiscale CHAR(16) UNIQUE NOT NULL
);





-- Restituire tutte le righe della tabella Studenti
-- Select * from <Studenti> 
SELECT * FROM Studenti;


-- DROP TABLE IF EXISTS Corsi

CREATE TABLE Corsi (

    CorsoID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
        Nomedelcorso NVARCHAR(100) NOT NULL,
    -- Descrizione
    Descrizione NVARCHAR(255)  NULL,
          -- crediti
        Crediti INT  NULL,
        -- durata
        Durata INT NULL
        );

        -- Creazione della tabella Docenti

CREATE TABLE Docenti(
    DocenteId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(50) NOT NULL,
    Cognome NVARCHAR(50) NOT NULL,
    Email NVARCHAR(150) UNIQUE NULL,
    Specializzazione NVARCHAR(50) NOT NULL
);

-- Creazione della tabella Aule
CREATE TABLE Aule(
    AulaId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    NomeAula NVARCHAR(150) NOT NULL,
    Capacita INT NOT NULL
);

EXEC sp_rename 'Studenti.StudentiID', 'StudenteId';
        
CREATE TABLE Voti (
VotoId INT NOT NULL PRIMARY KEY IDENTITY(1,1),

--  Colonne Foreign key
StudenteId INT NOT NULL,
CorsoId INT NOT NULL, 

Voto DECIMAL (4,2) NOT NULL,
DataVoto DATE NOT NULL,
Note NVARCHAR (255) NULL,
Superato BIT NOT NULL DEFAULT 1, 
-- BIT= TIPO boolean (true/false),

FOREIGN KEY (StudenteId) REFERENCES Studenti (StudenteId),
FOREIGN KEY (CorsoID) REFERENCES Corsi (CorsoID)
);

-- SELECT GETDATE(); Restituisce data ed ora del momento di esecuzione

/*
Creazione della tabella iscrizioni,
Relazionale:
Studenti n: nCorsi
Uno studente può frequentare più corsi ed un corso può avere più studenti
*/

CREATE TABLE Iscrizioni (
StudenteId INT NOT NULL,
CorsoID INT NOT NULL,
DataIscrizione DATE DEFAULT GETDATE () NOT NULL,
Stato NVARCHAR (30) NOT NULL DEFAULT 'Attiva',

FOREIGN KEY (StudenteId) REFERENCES Studenti (StudenteId),
FOREIGN KEY (CorsoID) REFERENCES Corsi (CorsoID),

CONSTRAINT UQ_Iscrizione_Studente_Corso
    UNIQUE(StudenteId, CorsoID)
);


CREATE TABLE DocentiCorso (
DocenteCorso INT PRIMARY KEY IDENTITY (1,1),
DocenteId INT NOT NULL,
CorsoId INT NOT NULL, 
DataRegistrazione DATE NULL,
DataAssegnazione DATE NULL,
Ruolo NVARCHAR(50) NULL,

FOREIGN KEY (DocenteId) REFERENCES Docenti (DocenteId),
FOREIGN KEY (CorsoID) REFERENCES Corsi (CorsoID),

CONSTRAINT UQ_Docente_Corso
    UNIQUE(DocenteId, CorsoID)
);


CREATE TABLE Lezioni (
LezioneId INT NOT NULL PRIMARY KEY IDENTITY (1,1),
CorsoId INT NOT NULL,
AulaId INT NOT NULL,
Titolo NVARCHAR (100) NOT NULL,
Descrizione VARCHAR (MAX) NULL,
DataLezione DATE NOT NULL,
OraInizio TIME NOT NULL,
OraFine TIME NOT NULL,
Durata INT NULL, 

FOREIGN KEY (CorsoID) REFERENCES Corsi (CorsoID),
FOREIGN KEY (AulaId) REFERENCES Aule (AulaId),
 );
