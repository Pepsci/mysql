#////////////////////////////////////

#voir les user
select user from mysql.user;
select * from mysql.user;

#Utilisateur courant
select current_user() from mysql.user;

# voir les droits de l'utilisateur
show grants for 'cda314@localhost';

#Ajouter un utilisateur
create user 'cda' identified by 'test';

 #changer de mdp
alter user 'cda314@localhost' identified by 'test1'; 

alter user 'cda' identified by 'test1';

#supprimer un user
drop user 'cda314@localhost';

#ajouter des droits  #all tout les droits 'select insert update delete === CRUD

grant all on *.* to 'cda314@localhost';
grant update on Exo_Bon_week_end.* to 'cda';
#grant all on "'nomdelabase'.'latable'" to 'utilisateur';

#voir les droits utilisateur 
show grants for 'cda314@localhost';

#retirer des droits
revoke all, grant option from 'cda314@localhost';

#mise a jour des privileges 
flush privileges;

#////////////////////////////////

#purger

drop table nomdelatable;















