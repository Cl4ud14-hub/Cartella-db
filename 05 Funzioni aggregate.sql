-- Le funzioni aggregate in SQL Server

/*
Le funzioni aggregate permettono di effettuare calcoli sulle righe

Le principali sono: 

|COUNT ()   | Conta          |
-----------------------------|
|SUM ()		| Somma          |
|-----------|----------------|
|AVG ()     | Media          |
|-----------|----------------|
|Min()      | Valore Minimo  |
|-----------|----------------|
|Max()      | Valore Massimo |
|-----------|----------------|

*/

-- 1 Totale degli studenti o record della tabella studenti

SELECT 
    'Studenti' AS Tabella, 
    COUNT(*) AS NumeroRighe 
FROM Studenti UNION ALL
SELECT 'Corsi', 
    COUNT(*)
FROM Corsi UNION ALL
SELECT     'Docenti',
    COUNT(*)
FROM Docenti UNION ALL
SELECT  'Docenti Corso',
    COUNT(*) FROM DocentiCorso
    UNION ALL
 SELECT 'Aule',
   COUNT(*) FROM Aule
   UNION ALL 
SELECT 'Iscrizioni',
    COUNT(*) 
    FROM Iscrizioni UNION ALL
SELECT 'Lezioni',
    COUNT(*) 
    FROM Lezioni UNION ALL 
SELECT  'Voti',
    COUNT(*)
    FROM Voti;


 --3 Restituire la somma totale dei crediti della tabella "Corsi"

SELECT SUM (Crediti) AS [Totale Crediti] 
FROM Corsi;

-- 4 Restituire la media dei crediti della tabella "corsi"

SELECT AVG (Crediti) AS [Media Crediti] 
FROM Corsi;

SELECT AVG (Durata ) AS [Durata media Corsi] 
FROM Corsi;

-- 5 Trovare il valore minimo dei crediti

SELECT MIN (Crediti ) AS [Valore minimo dei crediti] 
FROM Corsi;

-- 6 Trovare il valore  max

SELECT MAX (Crediti ) AS [Valore MASSIMO dei crediti] 
FROM Corsi;

/* 7
GROUP BY
Il GROUP BY serve per raggruppare i record.
per esempio, vogliamo sapere quanti docenti abbiamo per specializzazione
*/

SELECT * FROM Docenti;

SELECT
Specializzazione,
    COUNT (*) AS [Totale docenti]
    FROM Docenti
    GROUP BY Specializzazione;

/* 8 VOGLIAMO  sapere quanti docenti abbiamo 
per specializzaznione che iniziano con la D e il nome del docente
*/

SELECT 
Specializzazione,
Nome + ' ' + Cognome AS [Nome Docente],
COUNT (*) AS [Totale Docenti]
FROM Docenti
WHERE Specializzazione LIKE'D%'
GROUP BY Nome, Cognome, Specializzazione
ORDER BY Specializzazione ASC;

/* 9 Having
-- HAVING serve per filtrare i gruppi con GROUP BY
-- ESEMPIO 1
-- Mostra solamente le specializzazioni che hanno almeno 3
*/

SELECT 
Specializzazione,
COUNT (*) AS [Totale Docenti]
FROM Docenti
GROUP BY Specializzazione
HAVING COUNT(*) >=3;

/*
    Differenza fondamentale
    WHERE: filtra le righe del raggruppamento

    HAVING: filtra i gruppi dopo il raggruppamento

    SCHEMA:
    SELECT
        * .....
        .......
        .......
    FROM
    WHERE
    GROUP BY
    HAVING
        SELECT
        ORDER BY
*/

-- Primo Report completo
-- Totale Corsi, Media dei corsi, Somma crediti, Credito minimo e Max
 

 SELECT 
    COUNT (*) AS [TOTALE CORSI],
    AVG (Crediti) AS [Media Crediti],
    SUM (Crediti) AS [Totale Crediti],
    MIN (Crediti ) AS [Valore minimo dei crediti],
    MAX (Crediti ) AS [Valore MASSIMO dei crediti]
FROM Corsi;

