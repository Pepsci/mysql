create database immobilier;
use immobilier;

show tables;


drop table personne;
truncate table logement_agence;

create table agence (
	idAgence int auto_increment primary key not null,
	nom varchar(20),
    adresse varchar(20)
    );
    
create table demande (
	idDemande int(10) auto_increment primary key not null,
	idPersonne int,
    type varchar (20),
    ville varchar (20),
    budget int (10),
    superficie int(10),
    categorie varchar(15),
	foreign key (idPersonne) references personne(idPersonne)
	);

create table logement_agence(
	idLogementAgence int auto_increment primary key not null,
	idAgence  int,
    idLogement int,
    frais int(10),
    foreign key (idAgence) references agence(idAgence),
    foreign key (idLogement) references logement(idLogement)
	);

create table logement (
	idLogement int auto_increment primary key not null,
	type varchar (20),
    ville varchar (20),
    prix int (10),
    superficie int(10),
    categorie varchar (20)
    );

create table logement_personne (
	idlogement_personne int(10) auto_increment primary key not null,
    idPersonne int,
    idLogement int,
    foreign key (idPersonne) references personne(idPersonne),
    foreign key (idLogement) references logement(idLogement)
	);

create table personne (
	idPersonne int auto_increment primary key not null,
	nom varchar(40),
    prenom varchar(40),
    email varchar(250) unique
	);
    
call remplissage_table;
call procedure_logement_agence;
call new_personne_logement_personne;

select * from agence;
select * from demande;
select * from logement_agence;
select * from logement;
select * from logement_personne;
select * from personne;
 
#1. Affichez le nom des agences
select nom from agence;

#2. Affichez le numéro de l’agence « Orpi »
select idAgence from agence where nom='orpi';

#3. Affichez le premier enregistrement de la table logement
select * from logement limit 1;

#4. Affichez le nombre de logements (Alias : Nombre de logements)
select count(*) as 'Nombre de logements' from logement;

#5. Affichez les logements à vendre à moins de 150 000 € dans l’ordre croissant des prix.
select * from logement where prix < 150000 and categorie = 'vente' order by prix;

#6. Affichez le nombre de logements à la location (alias : nombre)
select count(*) as nombre from logement where categorie = 'location';

#7. Affichez les villes différentes recherchées par les personnes demandeuses d'un logement
select distinct ville from demande;

# 8. Affichez le nombre de biens à vendre par ville 
select ville, count(ville) as 'nombre' from demande where categorie = 'vente' group by ville;

#9. Quelles sont les id des logements destinés à la location ?
select idLogement from logement where categorie =  'location';

#10.Quels sont les id des logements entre 20 et 30m² ?
select idLogement from logement where superficie between 20 and 30; 
select idLogement from logement where superficie between 10 and 30;

#11.Quel est le prix vendeur (hors frais) du logement le moins cher à vendre ? (Alias : prix minimum)
select min(prix) as 'prix minimum' from logement where categorie = 'vente';

#12.Dans quelles villes se trouve les maisons à vendre ?
select distinct ville from logement where type = 'maison' and categorie =  'vente';

#13. L’agence Orpi souhaite diminuer les frais qu’elle applique sur le logement ayant l'id « 3 ». Passer les frais de ce logement de 800 à 730€
select * from logement;
select * from logement_agence;
update logement_agence set frais = '730' where idLogement = '5' and idAgence = ( select idAgence from agence where nom = 'orpi');

#14.Quels sont les logements gérés par l’agence « seloger »
select * from logement_agence inner join  agence on logement_agence.idAgence = agence.idAgence  where nom = 'seloger';

#15.Affichez le nombre de propriétaires dans la ville de Paris (Alias : Nombre)
select count(distinct(idPersonne)) as 'nombre' from logement_personne lp, logement l where lp.idLogement = l.idLogement and ville = 'paris';

#16.Affichez les informations des trois premières personnes souhaitant acheter un logement
select * from personne p, demande d where p.idPersonne = d.idPersonne and d.categorie = 'vente' limit 3;

#17.Affichez les prénoms, email des personnes souhaitant accéder à un logement en location sur la ville de Paris
select prenom, email from personne p, demande d where p.idPersonne = d.idPersonne and ville = 'paris' and categorie = 'location';

#18. Si l’ensemble des logements étaient vendus ou loués demain, quel serait le bénéfice généré grâce aux frais d’agence et pour chaque agence (Alias : bénéfice,
#classement : par ordre croissant des gains)
select nom, sum(frais) as bénéfice from agence a, logement_agence la  where a.idAgence = la.idAgence group by la.idAgence order by bénéfice;

#19.Affichez le prénom et la ville où se trouve le logement de chaque propriétaire
select prenom, ville from personne p, logement l, logement_personne lp where p.idPersonne = lp.idPersonne and  l.idLogement = lp.idLogement;

#20.Affichez le nombre de logements à la vente dans la ville de recherche de « hugo » (alias : nombre)
select count(idLogement) as nombre from logement l, personne p, demande d where p.idPersonne = d.idPersonne and l.ville = d.ville ;


select * from agence;
select * from demande;
select * from logement_agence;
select * from logement;
select * from logement_personne;
select * from personne;

#Exercice 4

create user 'afpa' identified by '';
create user 'cda314' identified by '';

#ajouter des droits  #all tout les droits 'select insert update delete === CRUD

grant select, update on immobilier.logement to 'afpa';
grant select, update on immobilier.personne to 'afpa';

grant delete on immobilier.demande to cda314;
grant delete on immobilier.logement to cda314;








