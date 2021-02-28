create database Exo_Bon_week_end;
use Exo_Bon_week_end;

#Exercice 1: 

#1 La liste des titres des représentations.
select titre_Rep from Representation;

#2 La liste des titres des représentations ayant lieu au « théâtre JCC »
select titre_Rep from Representation where lieu='théâtre JCC';

#3 La liste des noms des musiciens et des titres et les titres des représentations auxquelles ils participent
select nom, Num_Rep from Musicien where titre_Rep in (select titre_Rep from Representation);

#4 La liste des titres des représentations, les lieux et les tarifs du 28/02/2021
select titre_Rep, lieu from Representation where tarif in ( DATEDIFF( tarif, 2021-02-28 ) from Programmer);

#5 - Le nombre des musiciens qui participent à la représentations n°15.
select count(Num_mus) from Musicien where Num_rep=15 in (select Num_rep from Representation);

#6 - Les représentations et leurs dates dont le tarif ne dépasse pas 30Euros. 
select date, Num_Rep from Programmer having (tarif <= 30);

#/////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Exercice 2: 


# 1- Donnez la liste des employés ayant une commission
select COMM from Employés;

#2 Donnez les noms, emplois et salaires des employés par emploi croissant, et pour chaque emploi, par salaire décroissant
select

#3- Donnez le salaire moyen des employés
select SAL from Employés having avg(SAL);

#4- Donnez le salaire moyen du département Production
select DNOM from Départements where SAL in (select SAL from Employés );

#5- Donnez les numéros de département et leur salaire maximum
select DNOM from Départements where max (SAL) in (select SAL from Employés );

#6- Donnez les différentes professions et leur salaire moyen
select SAL, PROF from Employés having avg(SAL);

#7- Donnez le salaire moyen par profession le plus bas
SELECT PROF, min (sal) FROM Employés GROUP BY PROF;

#8- Donnez le ou les emplois ayant le salaire moyen le plus bas, ainsi que ce salaire moyen
SELECT PROF, min (sal), avg(sal) FROM Employés GROUP BY PROF;

#/////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Exercice 3: 

select * from Client;
create table Client (
	Numcli int(10) auto_increment primary key,
    Nomcli varchar(20) NOT NULL,
    Prenomcli varchar(20) NOT NULL,
    Adressecli varchar(200) NOT NULL,
    Mailcli varchar(150) unique NOT NULL
    );

select * from Produit;
create table Produit (
	Numprod int(10) auto_increment primary key,
	Designation varchar(40) NOT NULL,
	Prix int(10),
	Qte_stock int
        );

select * from Vendeur;
create table Vendeur (
	Idvendeur int(10) auto_increment primary key,
    Nomvendeur varchar(20) not null,
    Adresse_vend varchar(50) not null
    );	

select * from Commande;
create table Commande (
	Numcom int(10) auto_increment primary key,
    Numcli int(10),
    Idvendeur int(10),
    Numprod int(10),
    constraint fk_Numcli foreign key (Numcli) references Client(Numcli),
    constraint fk_Idvendeur foreign key (Idvendeur) references Vendeur(Idvendeur),
    constraint fk_Numprod foreign key (Numprod) references Produit(Numprod),
    Date_com date,
    Qte_com int
    );
    
    
#1- Créer les tables : Client, Produit, Vendeur et Commande.

# 2- la liste des clients de Paris.
select * from Client where adressecli='Paris';

# 3- la liste des produits (Numprod, désignation, prix) classés de plus cher au moins cher.
select Numprod, Designation, Prix from Produit order by max(prix);

# 4- noms et adresses des vendeurs dont le nom commence par la lettre ‘M’.
select Nomcli, Adressecli from Client where Nomcli like 'M%';

# 5- la liste des commandes effectuées par le vendeur "Moussa" entre le 1er et 28 février.
select Numcom from Commande where Numcli='moussa' in (select Numcli from Client) and Date_com >= 2021-01-02 AND Date_com <= 2021-28-02;

# 6- le nombre des commandes contenant le produit n° 365.
select count(qte_com) from Commande where Numprod='365';



#/////////////////////////////////////////////////////////////////////////////////////////////////////////////

#Exercice 4

# 1. Quelles sont les dates du concert de Corneille au Zenith ?
#select date from Concert where ;

# 2. Quels sont les noms des salles ayant la plus grande capacité ?
select Nom from Salle where Capacité (SELECT (MAX(Capacité) from Salle);

# 3 Quels sont les chanteurs n’ayant jamais réalisé de concert à la Cygale ?
select Chanteur from Spectacle where Chanteur not in (select Chanteur from Spectacle where Salle_ID and Nom='Cygale');

# 4. Quels sont les chanteurs ayant réalisé au moins un concert dans toutes les salles ?


# 5. Quels sont les dates et les identificateurs des concerts pour lesquels il ne reste aucun billet invendu ?



