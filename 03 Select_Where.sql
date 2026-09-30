USE ScuolaDb;
GO

-- Primo passo con select
SELECT * FROM Studenti;

-- Secondo passo con 'SELECT'
/*
	Esempio: 
		select
			colonna1, 
			colonna2,
			...
		from tabella
*/

SELECT 
Nome,
Cognome,
Codicefiscale 
from studenti

-- concatenazione di due colonne (+)
-- ALIASS =  AS  serve per definire il nome di una colonna

-- Esempio 1

SELECT 
    Nome + ' ' + Cognome AS NomeCompleto,
    CodiceFiscale 
FROM Studenti;

--Esempio2
SELECT 
    Nome + ' ' + Cognome AS 'Nome Completo',
    CodiceFiscale
FROM Studenti;

--Esempio2
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    CodiceFiscale AS [CF]
FROM Studenti;



-- Where filtra a secondo le condizioni
-- Esempio 1
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    CodiceFiscale AS [CF],
    DatadiNascita
FROM Studenti;

-- IS NULL() / -- IS NOT NULL CON IL FILTRO WHARE

SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    CodiceFiscale AS [CF],
    DatadiNascita
FROM Studenti
WHERE DatadiNascita IS NOT NULL;

SELECT 
    Nome + ' ' + Cognome AS [Nome Completo], EMAIL, DATADINASCITA,
    CodiceFiscale AS [CF]
    
FROM Studenti
WHERE DatadiNascita IS  NULL;


-- ORDER  ordina ascendente o discendente (ASC) DESC

SELECT 
    Nome + ' ' + Cognome AS [Nome Completo], EMAIL, DATADINASCITA,
    CodiceFiscale AS [CF]
    
FROM Studenti
WHERE DatadiNascita IS  NULL
ORDER BY [Nome completo] ASC;


SELECT 
    Nome + ' ' + Cognome AS [Nome Completo], EMAIL, DATADINASCITA,
    CodiceFiscale AS [CF]
    
FROM Studenti
WHERE DatadiNascita IS  NULL
ORDER BY [Nome completo] DESC;

SELECT * FROM CORSI;
SELECT * FROM AULE;
SELECT * FROM DOCENTI;
SELECT * FROM DOCENTICORSO;
SELECT * FROM ISCRIZIONI;
SELECT * FROM LEZIONI;
SELECT * FROM STUDENTI;
SELECT * FROM VOTI;


SELECT DISTINCT
    Nome,
    Cognome,
    DatadiNascita,
    Email,
    Telefono,
    CodiceFiscale
FROM Studenti;


