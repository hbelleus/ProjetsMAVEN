--Script de creation des tables de la base COMPTE

Prompt *************************************************************************************
Prompt CONNEXION A LA BASE DE DONNEES 

connect system/bourne;
drop user Hattmann cascade;
create user Hattmann identified by hattmann;
grant connect, create view, resource to Hattmann;
connect Hattmann/hattmann;

Prompt *************************************************************************************
Prompt LANCEMENT DU SCRIPT DE CREATION DE LA BASE COMPTE-VERSION 2017



--SUPPRESSION DES TABLES
Prompt *************************************************************************************
Prompt SUPPRESSION DES TABLES
Prompt *************************************************************************************

drop table conseiller cascade constraints purge;
drop table client cascade constraints purge;
drop table compte_courant cascade constraints purge;
drop table compte_epargne cascade constraints purge;
drop table virement cascade constraints purge;



--CREATION DES TABLES

Prompt *************************************************************************************
Prompt CREATION DES TABLES
Prompt *************************************************************************************


Prompt CREATION DE LA TABLE CONSEILLER

create table conseiller
( logincons  	  varchar(30) constraint pk_logcons primary key, 
  password		  varchar(5) UNIQUE,
  prenomcons      varchar(20),
  nomcons         varchar(20));
 

Prompt CREATION DE LA TABLE CLIENT

drop sequence sequencecli;
create sequence sequencecli
start with 1;

create table client
( idcli          number constraint pk_idcli primary key,
  typecli        varchar(11),
  prenomcli      varchar(20),
  nomcli         varchar(20),
  raisonsociale  varchar(30) UNIQUE,
  nSiret		 number(14) UNIQUE, 
  Adresse        varchar(60),
  codepostal     varchar(5),
  Ville          varchar(30),
  Telephone      varchar(10),
  Email			 varchar(40),
  logincons      varchar(30) constraint fk_logconscl references conseiller(logincons));
  
Prompt CREATION DE LA TABLE COMPTE_COURANT

create table compte_courant
( numcomptecc    number(6) constraint pk_ncc primary key,
  idcli          number constraint fk_idclcc references client(idcli),
  dateouv		 date,
  solde          number(10,2), 
  decouvert      number(10,2));

Prompt CREATION DE LA TABLE COMPTE_EPARGNE

create table compte_epargne
( numcomptece    number(6) constraint pk_nce primary key,
  idcli          number constraint fk_idclce references client(idcli),
  dateouv		 date,
  solde          number(10,2), 
  tauxrem        number(1,2));
  

Prompt CREATION DE LA TABLE VIREMENT

drop sequence sequencevir;
create sequence sequencevir
start with 1;

create table virement
( numvir         number constraint pk_nvir primary key,
  logincons      varchar(30) constraint fk_logconsvir references conseiller(logincons),
  compteemetteur number(6),
  comptecible    number(6),
  montantvir     number (8,2),
  datevir        date,
  libelle		 varchar(30));



Prompt *************************************************************************************

--INSERTION DES DONNEES

Prompt INSERTION DES DONNEES
Prompt *************************************************************************************


Prompt INSERTION DANS CONSEILLER

DELETE FROM CONSEILLER;
insert into conseiller values ('pdupond','toto','Paul','Dupond'); 
insert into conseiller values ('jfontaine','tutu','Jean','Fontaine');
insert into conseiller values ('rhoareau','titi','Remi','Hoareau');
insert into conseiller values ('psanchez','tata','Pierre','Sanchez');
insert into conseiller values ('pierre.sanchez','tyty','Pierre','Sanchez');


Prompt INSERTION DANS CLIENT

delete from client;
insert into client values(sequencecli.nextval,'entreprise',null,null,'DARTY',54208661600035,'145 boulevard des capucins',75005,'paris','0126597820','contact@darty.com','pierre.sanchez');
insert into client values(sequencecli.nextval,'entreprise',null,null,'INFO SYSTEM',80796904300015,'15 rue de la boeme',75007,'PARIS','0135678712','contact@infosystem.com','rhoareau');
insert into client values(sequencecli.nextval,'particulier','Richard','FOSTER',null,null,'9 RUE DU lac',45900,'LA SOURCE','0302345698','r.foster@forbes.com','pdupond');
insert into client values(sequencecli.nextval,'particulier','Jean-Filipo ','DE LATTRE DE FRANCE',null,null,'13 avenue des Tilleuls',92310,'SEVRES','0134568934',null,'jfontaine');
insert into client values(sequencecli.nextval,'entreprise',null,null,'CARREFOUR',65201405100724,'67 rue des maraichers',13008,'MARSEILLE','0456788932','contact@carrefour.com','psanchez');
insert into client values(sequencecli.nextval,'particulier','Paul','PRAT',null,null,'89 rue des chevreaux',33000,'BORDEAUX','0455237806','p.prat@oticien.com','jfontaine');
insert into client values(sequencecli.nextval,'particulier','Lucien','VIGOT',null,null,'78 rue eisenberg',75005,'paris','0126597820',null,'psanchez');
insert into client values(sequencecli.nextval,'particulier','Hattmann','BELLEUS',null,null,'15 rue de la boheme',75007,'PARIS','0135678712','h.belleus@gmail.com','pierre.sanchez');
insert into client values(sequencecli.nextval,'entreprise',null,null,'CD PRO',79171217700017,'1 RUE JEAN MERMOZ',45980,'VILLEGRAND','0302345698','contact@cd-pro.com','psanchez');
insert into client values(sequencecli.nextval,'particulier','Loriane','EYMANN',null,null,'13 avenue des Tilleuls',92310,'SEVRES','0134568934',null,'psanchez');
insert into client values(sequencecli.nextval,'particulier','Stanislas','DESORGES',null,null,'60 rue de Biarritz',13008,'MARSEILLE','0456788932','desorges@desorges.fr','rhoareau');
insert into client values(sequencecli.nextval,'entreprise',null,null,'123 Multimedia',79807337500031,'85 place de la Republique',33000,'BORDEAUX','0486746478','contact@123multimedia.com','psanchez');
insert into client values(sequencecli.nextval,'entreprise',null,null,'123 Multimedia Consulting',96573337583453,'150 boulevard Saint-Etienne',95400,'Villiers-le-bel','0455237806','contact@123multimedia.com','psanchez');
insert into client values(sequencecli.nextval,'entreprise',null,null,'Gamba Acoustique',11113337947938,'909 rue de la ligne droite',33000,'BORDEAUX','0466668066','contact@123gambacoustique.com','psanchez');
insert into client values(sequencecli.nextval,'entreprise',null,null,'SYSTRA',57643337588822,'110 place de la Bastille',33000,'BORDEAUX','0455230265','contact@systra.com','psanchez');
insert into client values(sequencecli.nextval,'particulier','John','SMITH',null,null,'square du petit marin',13008,'MARSEILLE','0356999013','jsmith@hotmail.fr','psanchez');

prompt INSERTION DANS COMPTE_COURANT

delete from compte_courant;

insert into compte_courant values (711010,1,'26/11/2017',300000.00,500.00);
insert into compte_courant values (918303,3,'26/11/2017',1000000.50,500.00);
insert into compte_courant values (916562,6,'26/11/2017',2500.00,500.00);
insert into compte_courant values (917417,7,'26/11/2017',-100.00,500.00);
insert into compte_courant values (718456,2,'26/11/2017',6400.78,500.00);
insert into compte_courant values (914302,8,'26/11/2017',-300.00,500.00);
insert into compte_courant values (714878,9,'26/11/2017',15000.00,500.00);
insert into compte_courant values (911045,10,'26/11/2017',3530.00,500.00);
insert into compte_courant values (718167,12,'26/11/2017',7530.00,500.00);
insert into compte_courant values (912264,11,'26/11/2017',112000.90,500.00);
insert into compte_courant values (717694,5,'26/11/2017',12500.00,500.00);
insert into compte_courant values (713879,12,'26/11/2017',12500.00,500.00);
insert into compte_courant values (711987,13,'26/11/2017',125000.00,500.00);
insert into compte_courant values (719485,14,'26/11/2017',7139.36,500.00);
insert into compte_courant values (714009,15,'26/11/2017',1190.07,500.00);

prompt INSERTION DANS COMPTE_EPARGNE

delete from compte_epargne;

insert into compte_epargne values (728457,2,'26/11/2017',75000.00,.03);
insert into compte_epargne values (924695,4,'26/11/2017',10000000.00,.03);
insert into compte_epargne values (727610,5,'26/11/2017',800000.00,.03);
insert into compte_epargne values (924545,3,'26/11/2017',3000000.10,.03);
insert into compte_epargne values (927646,8,'26/11/2017',100000.09,.03);
insert into compte_epargne values (921026,10,'26/11/2017',45000.00,.03);
insert into compte_epargne values (728181,11,'26/11/2017',958000.37,.03);
insert into compte_epargne values (728246,12,'26/11/2017',8601.98,.03);
insert into compte_epargne values (729930,13,'26/11/2017',7823.09,.03);
insert into compte_epargne values (728327,14,'26/11/2017',802223.74,.03);
insert into compte_epargne values (722892,15,'26/11/2017',320937,.03);
insert into compte_epargne values (928263,16,'26/11/2017',8609483.25,.03);

Prompt *************************************************************************************



commit;



Prompt FIN DE CREATION DE LA BASE COMMANDE.


Prompt *************************************************************************************
Prompt *****************************************************BONNE FORMATION*****************                             
