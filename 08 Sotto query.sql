

 /*
	COSA SONO LE SOTTOQUERY?
	Una sottoquery è una query dentro un’altra query.
	Serve per:
		filtrare dati usando risultati di altre tabelle
		calcolare valori intermedi
		sostituire JOIN quando vuoi logica più compatta
		creare condizioni avanzate nel WHERE, HAVING, SELECT
*/

-- 1. SOTTOQUERY nel WHERE
-- Obiettivo
--	Trovare gli studenti che hanno preso il voto massimo in tutti i corsi.

-- 🔎 passo 1 Trovare il voto massimo in intero

 SELECT
CAST(MAX(Voto) AS INT)[Voto Massimo]
 FROM Voti; 

-- 🔥Query finale sottoquery (SubQuery)
SELECT
	s.Nome,
	s.Cognome,
	v.Voto
FROM Studenti s
JOIN Voti v
	On s.StudenteId = v.StudenteId
where v.voto = (
	SELECT 
		MAX(Voto) [Voto Massimo] 
	FROM Voti
);

 /*
 2 SOTTOQUERY nel SELECT
 Mostrare ogni studente con la media dei suoi voti (senza GROUP BY)
 */

 SELECT 
 s.Nome,
 s.Cognome,
 v.Voto
 FROM Studenti s
 JOIN Voti v
 ON s.StudenteID = v.StudenteId
 WHERE v.Voto = (
  SELECT
CAST(MAX(Voto) AS INT)[Voto Massimo] -- 30
 FROM Voti);

 SELECT
 AVG(voto) [Voto Medio] -- 29.9
 FROM Voti;

   SELECT
 s.Nome,
 s.Cognome,
 s.CodiceFiscale,
 v.Voto
 FROM Studenti s
  JOIN Voti v
 ON s.StudenteID = v.StudenteId
 where v.voto = (
 SELECT 
 MAX(voto) [Voto massimo]
 FROM Voti);


SELECT
Nome,
Cognome,
CodiceFiscale,
  (SELECT 
  AVG(Voto) [Voto Medio]
  FROM Voti)
  FROM Studenti;

  /*
  --3. SOTTOQUERY con IN
-- Obiettivo
-- Trovare gli studenti che hanno preso almeno un voto ≥ 28.
-- Passo 1 Restituire la lista di tutti gli studenti
SELECT Nome, Cognome, FROM Studenti;
-- Passo 2 Testituire i voti ≥ 28
SELECT 
    Voto
FROM Voti
WHERE voto >= 28;
-- Passo 3 Unire i due passi usando il filtro seguito da IN
*/

SELECT
Nome,
Cognome
FROM Studenti
WHERE StudenteId IN (SELECT StudenteId
					 FROM Voti
					 WHERE Voto >=28);

 /*
 4 SOTTOQUERY con EXISTS
 Mostrare gli studenti che hanno almento un voto registrato
 elenco del nome cognome di tutti gli studenti
 */

SELECT
Nome,
Cognome
FROM Studenti s
WHERE EXISTS (
		SELECT 1
		FROM Voti v
		WHERE s.StudenteId = v.StudenteId
);

select * from Voti;

/*
5
*/
-- Media voti
SELECT
AVG(Voto) [Media dei voti]
FROM Voti

-- query completa
SELECT
Nome,
Cognome
FROM Studenti s
INNER JOIN Voti v
ON s.StudenteId = v.StudenteId
WHERE v.Voto > (SELECT
AVG(Voto) 
FROM Voti);
/*
 Sottoquery con join
Mostrare i corsi che hanno una media superiore alla media di tutti
*/

/*
Mostrare
*/

