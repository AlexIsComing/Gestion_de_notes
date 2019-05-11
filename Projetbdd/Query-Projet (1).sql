-- drop database GestionNotes;
-- create database GestionNotes;

use GestionNotes;


insert into Contact (ContactID, NomC, PrenomC, NumRueC, CodePostC, VilleC, TelC, EmailC, DateNaissanceC, VilleNaissanceC, PaysNaissanceC, SexeC ,Photo)
values			(1,'DUPONT','Jean','10 rue Jean Macé',91100,'Corbeil',0601015050,'dupont@free.fr', "1980-10-20",'Evry','France','M',54455354),
				(2,'PAYET','Sylvie','11 rue Grégoire Macé',75000,'Paris',0615248563,'payet@free.fr', "1986-10-12",'Paris','France','F',54455354),
				(3,'MARTIAL','Anthony','154 rue Grégoire London',75000,'Paris',0725154236,'martial@free.fr',"1982-10-12",'Villejuif','France','M',54455354);

insert into Administrateur (AdminID, NomA, PrenomA, NumRueA, CodePostA, VilleA, TelA, EmailA, DateNaissanceA, VilleNaissanceA, PaysNaissanceA, SexeA , Photo)
values			(1,'ADMIN','Admin','40 rue Jean Macé',94000,'Villejuif',0645635050,'admin@efrei.fr', "1975-10-20",'Paris','France','M',54455354);

insert into Groupe (NomG,AnneeG)
values			('A',2019),
				('B',2019);
                
insert into Promotion (NomPromo)
values			('L3'), ('M1');

insert into Eleve (EleveMat, NomE, PrenomE, NumRueE, CodePostE, VilleE, TelE, EmailE, DateNaissanceE, VilleNaissanceE, PaysNaissanceE, SexeE,Photo,NomG, NomPromo, ContactID)
values			(20190001,'BALANE','Brenden','10 rue Jean Macé',91100,'Corbeil',0601020304,'brenden@efrei.net',"1998-12-20",'Evry','France','M',54455354,'A','L3',1),
				(20190002,'BLUM','Alexia','40 rue Victor Hugo',91100,'Vilejuif',0601020304,'Alexia@efrei.net', "1998-12-15",'Paris','France','F',54455354,'A','L3',2),
                (20190003,'DALBAN','Max','10 rue Jean Macé',91100,'Corbeil',0601020304,'Max@efrei.net', "1998-12-20",'Evry','France','M',54455354,'A','M1',3),
				(20190004,'HERVE','François','40 rue Victor Hugo',91100,'Vilejuif',0601020304,'François@efrei.net',"1998-12-15",'Paris','France','M',54455354,'A','M1',1),
                (20190005,'KUKOVSKI','Stef','10 rue Jean Macé',91100,'Corbeil',0601020304,'Stef@efrei.net',"1998-12-20",'Evry','France','F',54455354,'B','L3',2),
				(20190006,'CHERIF','Lilia','40 rue Victor Hugo',91100,'Vilejuif',0601020304,'Lilia@efrei.net',"1998-12-15",'Paris','France','F',54455354,'B','L3',3),
                (20190007,'DAVID','Maximilien','10 rue Jean Macé',91100,'Corbeil',0601020304,'Maximilien@efrei.net',"1998-12-20",'Evry','France','M',54455354,'B','M1',1),
				(20190008,'RAKOTO','Victor','40 rue Victor Hugo',91100,'Vilejuif',0601020304,'Victor@efrei.net',"1998-12-15",'Paris','France','M',54455354,'B','M1',2);
		
insert into Cours (CodeCours, NomCours, Description, Annee, CoefCours, PourcentageDE, PourcentageTP, PourcentagePJT, NomG, NomPromo)
values			(1,'Base de données','BDD-GROUPE-A-L3','2019',2,0.5,0.2,0.3,'A','L3'),
				(2,'Java','Java-GROUPE-A-L3','2019',2,0.5,0.2,0.3,'A','L3'),
				(3,'Architecture des ordinateurs-M1','ADO-GROUPE-A','2019',2,0.5,0.2,0.3,'A','M1'),
                (4,'Cybersécurité','CS-GROUPE-A-M1','2019',2,0.5,0.2,0.3,'A','M1'),
                (5,'Canaux de transmission','CDT-GROUPE-B-L3','2019',2,0.5,0.2,0.3,'B','L3'),
                (6,'Electricité générale','EG-GROUPE-B-L3','2019',2,0.5,0.2,0.3,'B','L3'),
                (7,'Optique','OPT-GROUPE-B-M1','2019',2,0.5,0.2,0.3,'B','M1'),
                (8,'Théorie du signal','TDS-GROUPE-B-M1','2019',2,0.5,0.2,0.3,'B','M1');

insert into Professeurs (ProfMat, NomP, PrenomP, NumRueP, CodePostP, VilleP, TelP, EmailP, DateNaissanceP, VilleNaissanceP, PaysNaissanceP, SexeP ,Photo)
values			(1,'VELIKSON','Boris','10 rue Jean Macé',91100,'Corbeil',0601015050,'dupont@free.fr',"1970-10-20",'Evry','France','M',54455354),
				(2,'KHOURY','Claude','11 rue Grégoire Macé',75000,'Paris',0615248563,'claude@free.fr',"1976-10-12",'Paris','France','M',54455354),
				(3,'KHLAI','Kais','154 rue Grégoire London',75000,'Paris',0725154236,'kais@free.fr', "1982-10-12",'Villejuif','France','M',54455354),
                (4,'KHELLAF','Amar','124 rue Grégoire London',75000,'Paris',0725154236,'amar@free.fr', "1984-10-12",'Villejuif','France','M',54455354);

insert into Enseigne (ProfMat, CodeCours)
values			(1,1),
				(1,2),
                (2,3),
                (2,4),
                (3,5),
                (3,6),
                (4,7),
                (4,8);

insert into Avoir (ProfMat, EleveMat)
values			(1,20190001),
				(1,20190002),
                (2,20190003),
                (2,20190004),
                (3,20190005),
                (3,20190006),
                (4,20190007),
                (4,20190008);
                
insert into Note (CodeCours, EleveMat, NoteDE, NoteTP, NotePJT)
values			(1,20190001,15.0,14.5,10.0),
				(2,20190002,14.0,18.5,7.0),
                (3,20190003,15.0,14.5,10.0),
				(4,20190004,14.0,18.5,7.0),
                (5,20190005,15.0,14.5,10.0),
				(6,20190006,14.0,18.5,7.0),
                (7,20190007,15.0,14.5,10.0),
				(8,20190008,14.0,18.5,7.0);
                


select * from Eleve;

select e.NomE, e.EleveMat, c.CodeCours, c.NomCours, n.NoteDE, n.NoteTP, n.NotePJT
from Eleve as e join Note as n
join Cours as c
where n.EleveMat = e.EleveMat
and n.CodeCours = c.CodeCours;

select e.EleveMat, e.NomE, p.ProfMat, p.NomP
from Avoir as a join Eleve as e
join Professeurs as p
where a.ProfMat = p.ProfMat and e.EleveMat = a.EleveMat and a.ProfMat = 1;

select * from Groupe;
