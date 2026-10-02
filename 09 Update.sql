
--UPDATE  è il commando sql che modifica i dati già esistenti dentro la tabella
/*
SELECT * FROM Studenti
where StudenteId = 3
UPDATE Studenti
SET Nome = 'Katya'
*/

UPDATE Studenti
SET Nome = 'Lucas'
where StudenteId = 3

SELECT * FROM Studenti
where StudenteId = 3;

UPDATE Studenti
SET Nome = 'Lucas',
Cognome = 'm.rossi@software.it'
where CodiceFiscale = 'BLURSA02B28H501E';