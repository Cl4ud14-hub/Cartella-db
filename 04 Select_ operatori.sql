/*
Operatori principali in sql server
	=	UGUALE
	<>	DIVERSO DA
	!=	Diverso da
	<	Minore
	>	Mggiore
	<=	Minore uguale
	>= maggiore uguale
	AND E
	OR O
	*/

-- 1 Uguale:
-- questa riga restituisce solo lo studente con Id 4

SELECT
StudenteId,
Nome,
Cognome,
Email
FROM Studenti
WHERE StudenteId = 4;

-- Restituire tutti gli studenti tranne con Id (5)

SELECT
StudenteId,
Nome,
Cognome,
Email
FROM Studenti
WHERE StudenteId <> 5;


-- restituire i corsi che hanno più di 5 crediti
SELECT * FROM Corsi
WHERE Crediti >5;

-- restituire i corsi che hanno meno di 5 crediti

SELECT * FROM Corsi
WHERE Crediti < 5;

-- Maggiore o uguale >=
-- restituire i corsi con almeno 5 crediti

SELECT * FROM Corsi
WHERE Crediti >= 5;

-- Minori o uguale >=
-- restituire i corsi con 5 crediti o meno

SELECT * FROM Corsi
WHERE Crediti <= 5;

/*
	AND significa (E)
	Tutte le condizioni devono essere vere.
*/

/*
	-- Restituire la lista dei corsi con almeno 5 crediti 
	e la durata maggiore di 50 ore
*/

SELECT * FROM Corsi
WHERE Crediti >= 5 AND Durata > 50;


SELECT * FROM Corsi
WHERE Crediti >= 5 Or  Durata > 50;

-- Restituire la lista dei corsi che con 5 crediti
-- oppure consi con 3 crediti

SELECT * FROM Corsi
WHERE Crediti = 5 Or  Crediti = 3;

/*
	9 FILTRO DEGLI STUDENTI PER NOME
*/
SELECT * FROM Studenti WHERE Nome = 'Anna';
SELECT * FROM Studenti WHERE Cognome = 'Rossi';

/* 
	11 Condizione su una data
*/
SELECT 
	Nome + ' ' + Cognome AS [Nome Completo],
	DatadiNascita AS [Data di Nascita],
	Email
FROM Studenti
WHERE DatadiNascita > '2002'
ORDER BY [Nome Completo] ASC


/* ============================================================
   12. AND CON LE DATE
    Esercizio 1:
        Restituire la lista degli Studenti 
        nati tra il 2001 e il 2002
		i campi da restituire sono NomeCompleto e DataNascita
   ============================================================ */

 SELECT
 Nome + ' ' + Cognome AS [Nome Completo],
 DatadiNascita AS [Data di Nascita]
 FROM Studenti WHERE Datadinascita >= '2001-01-01' 
 AND Datadinascita <= '2003-01-01';


  SELECT * FROM Studenti 
  -- Limit in sql server (Top)

  SELECT TOP 10 * FROM Studenti;

  -- top 10 con 15
SELECT TOP 10 * FROM Studenti
WHERE Datadinascita IS NOT NULL;

SELECT * FROM Corsi
WHERE Crediti IN (6,5);

SELECT TOP 5 * FROM Corsi
WHERE Crediti IN (6,5)
ORDER BY Crediti ASC;


-- 13 LIMIT IN SQL SERVER (TOP)
SELECT TOP 10 *
    FROM Studenti;

-- 14 TOP 10 CON IS NULL E NOT NULL 
SELECT TOP 10 *
    FROM Studenti
    WHERE DataNascita IS NOT NULL;
-- 15 LISTE INT SQL SERVER IN(...)
-- IN = Restituisce gli elemtnti di una lista 
SELECT * FROM Corsi
    WHERE Crediti IN (6,5);

SELECT TOP 10 * FROM Corsi
    WHERE Crediti IN (6,5)
    ORDER BY Crediti ASC;


SELECT TOP 10 * FROM Corsi
    WHERE Crediti IN (6,5)
    ORDER BY NomeCorso ASC;

/*
    16 BETWEEN:

    Permette di verificare se un valore
    si trova all'interno di un intervallo.

    Sintassi:

    WHERE colonna BETWEEN valore Minimo (<) AND valoreMassimo (>)
*/
-- Corsi con una durata compresa tra 30 e 50 ore

SELECT 
Nomedelcorso AS [Nome del corso],
Descrizione,
Durata
FROM Corsi
WHERE Durata BETWEEN 30 And 50;

-- RESTITUISCE LA LISTA DEI PRIMI 5 CORSI CON UNA DURATA COMPRESA TRA 30 E 50

SELECT TOP 5
Nomedelcorso AS [Nome del corso],
Descrizione,
Durata
FROM Corsi
WHERE Durata BETWEEN 30 And 50
ORDER BY [nomedelcorso] ASC;

/* -- 18 restituire la lista degli studenti nati tra l'anno 2000 ed il 2002, 
Dati da visualizzare nome comleto e data di nascita */

SELECT 
 Nome + ' ' + Cognome AS [Nome Completo],
 DatadiNascita AS [Data di Nascita]
FROM STUDENTI
WHERE Datadinascita BETWEEN '2000-01-01' AND '2003-01-01';

-- Operatori di confronto OR e IN e NOT IN

SELECT * fROM Corsi
where crediti =3
or Crediti = 5
or Crediti = 6

SELECT * fROM Corsi
WHERE crediti IN (3, 5,6);

SELECT * FROM Corsi
WHERE crediti NOT IN (3, 5,6);

/*  LIKE 
-- A% = restituisce tutti i nomi che iniziano con la lettera a
-- %o = restituisce tutti i nomi che finiscono con la lettera o
-- %u% = restituisce tutti i nomi che contengono la lettera U
-- Es 1: Restituire la lista dei corsi che iniziano con la P
*/

SELECT * FROM Corsi
WHERE Nomedelcorso LIKE'P%';

SELECT * FROM Corsi
WHERE Nomedelcorso LIKE'%n';

/* 
Quando si usa la funzione distinct per non visualizzare i record duplicati, è necessario indicare
le colonne che si vuole visualizzare
*/

SELECT DISTINCT 
    NomedelCorso, 
    Descrizione,
    Crediti,
    Durata
FROM Corsi
WHERE Crediti >= 5 AND Durata > 50;

SELECT 
Nomedelcorso AS [Nome del corso],
Descrizione,
Durata
FROM Corsi
WHERE Durata BETWEEN 30 And 50;

SELECT DISTINCT 
    NomedelCorso, 
    Descrizione,
    Crediti,
    Durata
FROM Corsi
WHERE Crediti <> 30 AND Durata >= 50;

SELECT TOP 10 * 
FROM Studenti
WHERE DatadiNascita IS NOT NULL
AND DatadiNascita >='2000'
ORDER BY DatadiNascita ASC

