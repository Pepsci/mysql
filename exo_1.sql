create database exercice1;
use exercice1;

drop table examen;

create table etudiant (matricule int not null, nom varcharacter(30), prenom varcharacter(30), date_naissante date, niveau varcharacter(10));
create table cours (code CHARACTER , nom_du_cours varcharacter(30), enseigant varcharacter(30));
create table examen (matricule character , code character, note character);

select * from examen;

show columns from etudiant;
select * from etudiant where nom;
select * from etudiant group by nom;
select * from cours where nom_du_cours;
select * from etudiant order by date_naissante;
select * from etudiant where niveau='CAP' and niveau='BAC';
select * from examen where note;
select note from examen;
select * from examen where note >= 10;
SELECT COUNT(*) FROM etudiant;
select etudiant.nom from etudiant;

SELECT note, AVG(matricule) FROM examen GROUP BY note >= 10;
SELECT note, AVG(matricule) FROM examen GROUP BY note;


SELECT * FROM etudiant NATURAL JOIN examen natural join cours;
SELECT note, AVG(nom) FROM etudiant GROUP BY note >= 10;
select * from etudiant 




