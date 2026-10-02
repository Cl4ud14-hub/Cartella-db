<<<<<<< HEAD
/*
JOIN/ INNER JOIN
LEFT JOIN <-- Parte da sinistra
RIGHT JOIN <-- Parte da destra
FULL JOIN 
---------------------------------------

    JOIN — PERCHÉ SERVE?

    Fino a questo punto abbiamo lavorato principalmente con una tabella.

    Ma un database relazionale è composto da più tabelle collegate tra loro.

    Nel nostro database "ScuolaDb" abbiamo, per esempio:

    Studenti
       |
       ↓
    Iscrizioni
       |
       ↓
    Corsi

    Uno studente può essere iscritto a un corso.

    Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.

    Sintassi base per la Join/ INNER JOIN unisce 2 tabelle che hanno 
    un elemento in comune

    SELECT
        t1 colonne1
        t1 colonne 2
        t1 colonne 3
        t2 colonne 1
        ...
        from tabella1 as t1
        Inner join tabella 2 as t2
            ON Condizione (t1.id = t2.Id)

if (tl.id= t2.id):
print (t1.colonne1
        t2 colonne 2
        t1 colonne 3
        t2 colonne 1


*/

--  Restituire la lista degli studenti iscritti
SELECT *
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId

-- Nome completo
-- Data di Nascita
-- Codice fiscale
-- data di iscrizione

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
s.DatadiNascita,
s.CodiceFiscale,
i.DataIscrizione
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId;

-- esempio 2
-- restituisce la lista degli studenti iscritti ad un corso

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
s.DatadiNascita,
s.CodiceFiscale,
i.DataIscrizione,
c.Nomedelcorso + ' ' + c.Descrizione as [Corso],
c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
ON i.CorsoID = c.CorsoID

-- studenti iscritti ad un corso senza la data di nascita

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
s.DatadiNascita,
s.CodiceFiscale,
i.DataIscrizione,
c.Nomedelcorso + ' ' + c.Descrizione as [Corso],
c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
ON i.CorsoID = c.CorsoID
WHERE s.DatadiNascita IS NULL;


-- esempio 4
-- restituisce la lista degli studenti iscritti ad un corso con la data di nascita

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
s.DatadiNascita,
s.CodiceFiscale,
i.DataIscrizione,
c.Nomedelcorso + ' ' + c.Descrizione as [Corso],
c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
ON i.CorsoID = c.CorsoID
WHERE s.DatadiNascita IS NOT NULL;

/*
-- Docenti, Corsi Aule, Lezioni
lezioni <-> aule <- corsi
Iscrizioni <-> Studenti <- corsi
docenticorsi <- docenti

Restituire:
    il nome dello studente, 
    il corso,
    l'aula
    il docente, 
    lezioni

*/

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
c.Nomedelcorso + ' ' + c.Descrizione as [Corso],
a.NomeAula,
d.docenteId,
l.lezioneId
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
ON i.CorsoID = c.CorsoID
INNER JOIN DocentiCorso as dc
on dc.CorsoId = c.CorsoID
INNER JOIN Docenti as d
on d.DocenteId = dc.docenteId
Inner Join Lezioni as l
on c.CorsoID = l.CorsoId
Inner Join Aule as a
on a.AulaId = l.aulaId;


SELECT DISTINCT 
    s.Nome + ' ' + s.Cognome as [Nome Studente],
    s.DatadiNascita as [Data di nascita],
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione],
    c.Nomedelcorso + ' - ' + c.Descrizione as [Corso],
    c.Durata,
    d.Nome + ' ' + d.Cognome as [Nome Docente],
    d.Specializzazione,
    a.NomeAula as [Nome Aula],
    a.Capacita as [Capacità]
FROM Studenti as s
JOIN Iscrizioni as i
    ON s.StudenteId = i.StudenteId
JOIN Corsi as c
    ON c.CorsoId = i.CorsoId
JOIN DocentiCorso as dc
    ON dc.CorsoId = c.CorsoId
JOIN Docenti as d
    ON d.DocenteId = dc.DocenteId
JOIN Lezioni as l
    ON c.CorsoId = l.CorsoId
JOIN Aule as a
    ON a.AulaId = l.AulaId;

    SELECT TOP 10 * 
FROM Studenti AS S
INNER JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId
WHERE DatadiNascita IS NOT NULL
AND DatadiNascita <>'2000'
ORDER BY DatadiNascita ASC

/*
LEFT JOIN
Mostra i record della tabella sinistra anche se non esiste una 
corrispondenza nella tabella destra.
*/
    SELECT TOP 10 * 
FROM Studenti AS S
LEFT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi AS C
ON i.CorsoID = c.CorsoID
WHERE DatadiNascita IS NOT NULL
AND DatadiNascita <>'2000'
ORDER BY DatadiNascita ASC;

-----------------------------------------------------
-- restituisce la lista degli studenti non iscritti

SELECT
     s.Nome,
     s.Cognome,
     s.CodiceFiscale,
     s.Email,
     s.Telefono,
     c.Nomedelcorso,
     c.Descrizione,
     c.Crediti,
     c.Durata,
     i.DataIscrizione
FROM Studenti s
LEFT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
ON i.CorsoID = c.CorsoID

-------------------------------------------------

-- La funzione ISNULL() restituisce il valore specificato se l'espressione è null
-- La funzione CONVERT () sostituisce il valore specificato

SELECT 
Nome,
Cognome,
ISNULL(CONVERT(VARCHAR,DatadiNascita, 104), 'ND') AS [Data di Nascita]
FROM Studenti
WHERE DatadiNascita IS NULL;



SELECT
    ISNULL(s.Nome + ' ' + s.Cognome, 'Studente non assegnato') AS Studente,
    ISNULL(s.CodiceFiscale, 'CF00000') AS [CF],
    ISNULL(s.Email, 'Email non fornita') AS Email,
    ISNULL(s.Telefono, '0000') AS Telefono,
    ISNULL(c.Nomedelcorso, 'Non definito') AS [Nome del corso],
    ISNULL(c.Descrizione, 'Non definito') AS [In arrivo],
    ISNULL(c.Crediti,0) AS Crediti,
    ISNULL(c.Durata, 0) AS Durata,
    ISNULL(CONVERT(VARCHAR,i.DataIscrizione,104),'ND') [Data d'iscrizione]
FROM Studenti s
LEFT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
ON i.CorsoID = c.CorsoID


-------------------------------------------------

-- La funzione ISNULL() restituisce il valore specificato se l'espressione è null
-- La funzione CONVERT () sostituisce il valore specificato


SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 2), 'nd') AS Ora
FROM Lezioni;

-- 09:00:00.0000000
 --DATEPART(MINUTE,OraInizio) as Minuti


SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 5), 'nd') AS Inizio
   DATEPART(MINUTE,OraInizio), AS Minuti,     
FROM Lezioni;


SELECT
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(CONVERT(VARCHAR, OraInizio, 108), 'N/D') AS Minuti,
    RIGHT('0' + CAST(DATEPART(MINUTE,OraInizio) AS NVARCHAR (2)), 2) AS Minuti
FROM Lezioni

 SELECT    Titolo + ' ' + Descrizione AS [Materia], 
'la lezione inizia alle ' +
CAST(DATEPART(HOUR, OraInizio) AS nvarchar(2)) + ':' +
RIGHT('0' + CAST(DATEPART(MINUTE, OraInizio) as nvarchar(2)), 2 ) as Orario
FROM Lezioni; -- 108 => 09:00 

SELECT Titolo + ' ' + Descrizione AS [Materia],    'la lezione inizia alle ' + 
ISNULL(CONVERT(VARCHAR(5), OraInizio, 108), 'N/D') AS Ora 
FROM Lezioni;


SELECT    Titolo + ' ' + Descrizione AS [Materia],    --
ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 2), 'N/D') as Ora,
ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 5), 'N/D') as Minuti,
ISNULL(DATEPART(HOUR, OraInizio), 2) AS Ora,
DATEPART(MINUTE, OraInizio) AS Minuti 
FROM Lezioni;



select
DATEPART(hour, OraInizio) as Ora,
datepart(Minute, OraInizio) as Minuti,
datepart(second, OraInizio) as Secondi
from Lezioni;



/*
RIGHT JOIN
 fa il contrario della "LEFT JOIN"
 Restituisce tutti i record della tabella destra
*/

SELECT *
FROM Studenti s
RIGHT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId

SELECT 
s.Nome + ' ' + s.Cognome AS Studente,
s.CodiceFiscale AS CF,
ISNULL (CONVERT(VARCHAR,i.dataiscrizione,104), 'Data non definita') AS [Data iscrizione]
FROM Studenti s
RIGHT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId

-------------------------------------------

=======
/*
JOIN/ INNER JOIN
LEFT JOIN <-- Parte da sinistra
RIGHT JOIN <-- Parte da destra
FULL JOIN 
---------------------------------------

    JOIN — PERCHÉ SERVE?

    Fino a questo punto abbiamo lavorato principalmente con una tabella.

    Ma un database relazionale è composto da più tabelle collegate tra loro.

    Nel nostro database "ScuolaDb" abbiamo, per esempio:

    Studenti
       |
       ↓
    Iscrizioni
       |
       ↓
    Corsi

    Uno studente può essere iscritto a un corso.

    Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.

    Sintassi base per la Join/ INNER JOIN unisce 2 tabelle che hanno 
    un elemento in comune

    SELECT
        t1 colonne1
        t1 colonne 2
        t1 colonne 3
        t2 colonne 1
        ...
        from tabella1 as t1
        Inner join tabella 2 as t2
            ON Condizione (t1.id = t2.Id)

if (tl.id= t2.id):
print (t1.colonne1
        t2 colonne 2
        t1 colonne 3
        t2 colonne 1


*/

--  Restituire la lista degli studenti iscritti
SELECT *
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId

-- Nome completo
-- Data di Nascita
-- Codice fiscale
-- data di iscrizione

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
s.DatadiNascita,
s.CodiceFiscale,
i.DataIscrizione
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId;

-- esempio 2
-- restituisce la lista degli studenti iscritti ad un corso

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
s.DatadiNascita,
s.CodiceFiscale,
i.DataIscrizione,
c.Nomedelcorso + ' ' + c.Descrizione as [Corso],
c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
ON i.CorsoID = c.CorsoID

-- studenti iscritti ad un corso senza la data di nascita

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
s.DatadiNascita,
s.CodiceFiscale,
i.DataIscrizione,
c.Nomedelcorso + ' ' + c.Descrizione as [Corso],
c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
ON i.CorsoID = c.CorsoID
WHERE s.DatadiNascita IS NULL;


-- esempio 4
-- restituisce la lista degli studenti iscritti ad un corso con la data di nascita

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
s.DatadiNascita,
s.CodiceFiscale,
i.DataIscrizione,
c.Nomedelcorso + ' ' + c.Descrizione as [Corso],
c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
ON i.CorsoID = c.CorsoID
WHERE s.DatadiNascita IS NOT NULL;

/*
-- Docenti, Corsi Aule, Lezioni
lezioni <-> aule <- corsi
Iscrizioni <-> Studenti <- corsi
docenticorsi <- docenti

Restituire:
    il nome dello studente, 
    il corso,
    l'aula
    il docente, 
    lezioni

*/

SELECT 
s.Nome + ' ' + s.Cognome AS [Nome Completo],
c.Nomedelcorso + ' ' + c.Descrizione as [Corso],
a.NomeAula,
d.docenteId,
l.lezioneId
FROM Studenti as s
INNER JOIN Iscrizioni as i
on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
ON i.CorsoID = c.CorsoID
INNER JOIN DocentiCorso as dc
on dc.CorsoId = c.CorsoID
INNER JOIN Docenti as d
on d.DocenteId = dc.docenteId
Inner Join Lezioni as l
on c.CorsoID = l.CorsoId
Inner Join Aule as a
on a.AulaId = l.aulaId;


SELECT DISTINCT 
    s.Nome + ' ' + s.Cognome as [Nome Studente],
    s.DatadiNascita as [Data di nascita],
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione],
    c.Nomedelcorso + ' - ' + c.Descrizione as [Corso],
    c.Durata,
    d.Nome + ' ' + d.Cognome as [Nome Docente],
    d.Specializzazione,
    a.NomeAula as [Nome Aula],
    a.Capacita as [Capacità]
FROM Studenti as s
JOIN Iscrizioni as i
    ON s.StudenteId = i.StudenteId
JOIN Corsi as c
    ON c.CorsoId = i.CorsoId
JOIN DocentiCorso as dc
    ON dc.CorsoId = c.CorsoId
JOIN Docenti as d
    ON d.DocenteId = dc.DocenteId
JOIN Lezioni as l
    ON c.CorsoId = l.CorsoId
JOIN Aule as a
    ON a.AulaId = l.AulaId;

    SELECT TOP 10 * 
FROM Studenti AS S
INNER JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId
WHERE DatadiNascita IS NOT NULL
AND DatadiNascita <>'2000'
ORDER BY DatadiNascita ASC

/*
LEFT JOIN
Mostra i record della tabella sinistra anche se non esiste una 
corrispondenza nella tabella destra.
*/
    SELECT TOP 10 * 
FROM Studenti AS S
LEFT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi AS C
ON i.CorsoID = c.CorsoID
WHERE DatadiNascita IS NOT NULL
AND DatadiNascita <>'2000'
ORDER BY DatadiNascita ASC;

-----------------------------------------------------
-- restituisce la lista degli studenti non iscritti

SELECT
     s.Nome,
     s.Cognome,
     s.CodiceFiscale,
     s.Email,
     s.Telefono,
     c.Nomedelcorso,
     c.Descrizione,
     c.Crediti,
     c.Durata,
     i.DataIscrizione
FROM Studenti s
LEFT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
ON i.CorsoID = c.CorsoID

-------------------------------------------------

-- La funzione ISNULL() restituisce il valore specificato se l'espressione è null
-- La funzione CONVERT () sostituisce il valore specificato

SELECT 
Nome,
Cognome,
ISNULL(CONVERT(VARCHAR,DatadiNascita, 104), 'ND') AS [Data di Nascita]
FROM Studenti
WHERE DatadiNascita IS NULL;



SELECT
    ISNULL(s.Nome + ' ' + s.Cognome, 'Studente non assegnato') AS Studente,
    ISNULL(s.CodiceFiscale, 'CF00000') AS [CF],
    ISNULL(s.Email, 'Email non fornita') AS Email,
    ISNULL(s.Telefono, '0000') AS Telefono,
    ISNULL(c.Nomedelcorso, 'Non definito') AS [Nome del corso],
    ISNULL(c.Descrizione, 'Non definito') AS [In arrivo],
    ISNULL(c.Crediti,0) AS Crediti,
    ISNULL(c.Durata, 0) AS Durata,
    ISNULL(CONVERT(VARCHAR,i.DataIscrizione,104),'ND') [Data d'iscrizione]
FROM Studenti s
LEFT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
ON i.CorsoID = c.CorsoID


-------------------------------------------------

-- La funzione ISNULL() restituisce il valore specificato se l'espressione è null
-- La funzione CONVERT () sostituisce il valore specificato


SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 2), 'nd') AS Ora
FROM Lezioni;

-- 09:00:00.0000000
 --DATEPART(MINUTE,OraInizio) as Minuti


SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 5), 'nd') AS Inizio
   DATEPART(MINUTE,OraInizio), AS Minuti,     
FROM Lezioni;


SELECT
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(CONVERT(VARCHAR, OraInizio, 108), 'N/D') AS Minuti,
    RIGHT('0' + CAST(DATEPART(MINUTE,OraInizio) AS NVARCHAR (2)), 2) AS Minuti
FROM Lezioni

 SELECT    Titolo + ' ' + Descrizione AS [Materia], 
'la lezione inizia alle ' +
CAST(DATEPART(HOUR, OraInizio) AS nvarchar(2)) + ':' +
RIGHT('0' + CAST(DATEPART(MINUTE, OraInizio) as nvarchar(2)), 2 ) as Orario
FROM Lezioni; -- 108 => 09:00 

SELECT Titolo + ' ' + Descrizione AS [Materia],    'la lezione inizia alle ' + 
ISNULL(CONVERT(VARCHAR(5), OraInizio, 108), 'N/D') AS Ora 
FROM Lezioni;


SELECT    Titolo + ' ' + Descrizione AS [Materia],    --
ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 2), 'N/D') as Ora,
ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 5), 'N/D') as Minuti,
ISNULL(DATEPART(HOUR, OraInizio), 2) AS Ora,
DATEPART(MINUTE, OraInizio) AS Minuti 
FROM Lezioni;



select
DATEPART(hour, OraInizio) as Ora,
datepart(Minute, OraInizio) as Minuti,
datepart(second, OraInizio) as Secondi
from Lezioni;



/*
RIGHT JOIN
 fa il contrario della "LEFT JOIN"
 Restituisce tutti i record della tabella destra
*/

SELECT *
FROM Studenti s
RIGHT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId

SELECT 
s.Nome + ' ' + s.Cognome AS Studente,
s.CodiceFiscale AS CF,
ISNULL (CONVERT(VARCHAR,i.dataiscrizione,104), 'Data non definita') AS [Data iscrizione]
FROM Studenti s
RIGHT JOIN Iscrizioni i
ON i.StudenteId = s.StudenteId

-------------------------------------------


