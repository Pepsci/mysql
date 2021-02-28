create database afpa_paris;
use afpa_paris;
show databases;
show tables;

create table stagiaire(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,nom varchar(30), prenom varchar(30));
create table centre (id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, nom varchar(30), ville varchar(30), activitée varchar(30));

select * from centre;
select * from stagiaire;
select * from utilisateur;

insert into stagiaire (nom, prenom) values ('Paradis', 'Vanessa'),('Filippi','Joss'),('Camara','Moussa'),('Cage','Nicolas');
insert into centre (nom, ville, activitée) values ('Afpa', 'Paris', 'CDA'),('Afpa','Mareseille','Dev Mobile'),('Afpa','Lyon','Marketing');

update utilisateur set prenom = 'Joss' where nom = 'Filippi';
alter table utilisateur add id INT PRIMARY KEY NOT NULL AUTO_INCREMENT;

delete from stagiaire where nom='Paradis';
drop table stagiaire;

ALTER TABLE utilisateur MODIFY COLUMN ID VARCHAR(25) FIRST;  #envoie une colonne en premier 

select * from stagiaire group by prenom; /*tri ordre alpha betique*/
select * from stagiaire order by nom;	/*tri par ordre */

select * from stagiaire order by prenom limit 2; /*limte d'affichage*/

drop table stagiaires;

create table stagiaires (id int not null auto_increment, nom varchar(20), genre char(2) default 'Mr', primary key (id));
select * from stagiaires;
insert into stagiaires (nom) values ( 'Filippi');

#unique 
create table stagiaires (id int not null auto_increment, nom varchar(20), email varchar(50) unique, primary key (id));
insert into stagiaires (nom, email) values ( 'Filippi', 'jossfilippi@gmail.com');
insert into stagiaires (nom, email) values ( 'Camara', 'jossfilippi@gmail.com');
select * from stagiaires;

#check 
create table stagiaires (id int not null auto_increment, nom varchar(20), genre varchar(1), check(genre in('H','F')), primary key (id));
insert into stagiaires (nom, genre) values ( 'Vanessa','H');
insert into stagiaires (nom, genre) values ( 'Camille','F');
select * from stagiaires;



