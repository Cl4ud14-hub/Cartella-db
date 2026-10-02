/*
Esercizio 1
Restituire i voti medi degli studenti
Campi da visualizzare:
Nome Completo dello studente
Codice Fiscale
voto medio
*/

 SELECT
s.Nome + ' ' + s.Cognome AS Studente,
s.CodiceFiscale AS CF,
AVG(v.Voto) AS [Voto Medi]
FROM Studenti s 
RIGHT JOIN Voti v
ON s.StudenteId = v.StudenteId
GROUP BY s.Nome,s.Cognome,s.CodiceFiscale;


-- CONCAT()

 SELECT
	CONCAT(s.Nome , ' ', s.Cognome) AS Studente,
	s.CodiceFiscale AS CF,
	CAST(AVG(v.Voto) AS INT) AS [Voto Medi] -- CAST(INT) CONVERTE DA DECIMALE IN INTERO
FROM Studenti s 
RIGHT JOIN Voti v
	ON s.StudenteId = v.StudenteId
GROUP BY s.Nome,s.Cognome,s.CodiceFiscale;

/*
Restituire la lista degli studenti iscritti ad un corso senza data di nascita
con rinomina della data di nascita
Campi da visualizzare: 
Studente
data di nascita
codice fiscale
nome del corso
il voto 
e il docente
AULE
*/

SELECT 
CONCAT(s.Nome , ' ', s.Cognome) AS Studente,
	s.CodiceFiscale AS CF,
	ISNULL (CONVERT(VARCHAR,s.DatadiNascita,104), 'ND') AS [Data di Nascita],
	s.CodiceFiscale,
	v.Voto,
    c.Nomedelcorso,
	d.Cognome,
	l.LezioneId,
	l.AulaId
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
on a.AulaId = l.aulaId
INNER JOIN Voti AS V
ON s.StudenteId = v.StudenteId
 WHERE 
 s.DatadiNascita  IS NULL
 GROUP BY s.Nome, s.Cognome, s.DatadiNascita, s.CodiceFiscale, c.Nomedelcorso,v.Voto, d.Nome, d.Cognome, a.NomeAula;




SELECT 
    CONCAT(s.Nome, ' ', s.Cognome) AS NomeCompleto,
    ISNULL(CONVERT(VARCHAR(10), s.DatadiNascita, 120), 'Non registrata') AS Data_di_Nascita,
    s.CodiceFiscale AS CF,
    c.Nomedelcorso AS Corso,
    CAST(AVG(v.Voto) AS INT) AS Voto,
    CONCAT(d.Nome, ' ', d.Cognome) AS Docente,
    a.NomeAula AS Aula
FROM Studenti s
JOIN Iscrizioni i 
    ON s.StudenteId = i.StudenteId
JOIN Corsi c 
    ON i.CorsoId = c.CorsoId
JOIN Voti v 
    ON s.StudenteId = v.StudenteId 
    AND c.CorsoId = v.CorsoId
JOIN DocentiCorso dc 
    ON c.CorsoId = dc.CorsoId
JOIN Docenti d 
    ON dc.DocenteId = d.DocenteId
JOIN Lezioni l 
    ON c.CorsoId = l.CorsoId
JOIN Aule a 
    ON l.AulaId = a.AulaId
WHERE s.DatadiNascita IS NULL
GROUP BY s.Nome, s.Cognome, s.DatadiNascita, s.CodiceFiscale, c.Nomedelcorso, d.Nome, d.Cognome,l.LezioneId, a.NomeAula;




