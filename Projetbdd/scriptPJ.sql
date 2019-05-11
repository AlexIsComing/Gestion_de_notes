#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

-- drop database GestionNotes;
-- create database GestionNotes;
use GestionNotes;

#------------------------------------------------------------
# Table: Contact
#------------------------------------------------------------

CREATE TABLE Contact(
        ContactID       Int NOT NULL ,
        NomC            Varchar (50) NOT NULL ,
        PrenomC         Varchar (50) NOT NULL ,
        NumRueC         Varchar (50) NOT NULL ,
        CodePostC       Int NOT NULL ,
        VilleC          Varchar (50) NOT NULL ,
        TelC            numeric NOT NULL ,
        EmailC          Varchar (100) NOT NULL ,
        DateNaissanceC  Date NOT NULL ,
        VilleNaissanceC Varchar (50) NOT NULL ,
        PaysNaissanceC  Varchar (50) NOT NULL ,
        SexeC           Char (50) NOT NULL ,
        Photo           Blob NOT NULL
	,CONSTRAINT Contact_PK PRIMARY KEY (ContactID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Administrateur
#------------------------------------------------------------

CREATE TABLE Administrateur(
        AdminID         Int NOT NULL ,
        NomA            Varchar (50) NOT NULL ,
        PrenomA         Varchar (50) NOT NULL ,
        NumRueA         Varchar (50) NOT NULL ,
        CodePostA       Int NOT NULL ,
        VilleA          Varchar (50) NOT NULL ,
        TelA            Int NOT NULL ,
        EmailA          Varchar (100) NOT NULL ,
        DateNaissanceA  Date NOT NULL ,
        VilleNaissanceA Varchar (50) NOT NULL ,
        PaysNaissanceA  Varchar (50) NOT NULL ,
        SexeA           Char (50) NOT NULL ,
        Photo           Blob NOT NULL
	,CONSTRAINT Administrateur_PK PRIMARY KEY (AdminID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Groupe
#------------------------------------------------------------

CREATE TABLE Groupe(
        NomG   Varchar (50) NOT NULL ,
        AnneeG INT NOT NULL
	,CONSTRAINT Groupe_PK PRIMARY KEY (NomG)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Promotion
#------------------------------------------------------------

CREATE TABLE Promotion(
        NomPromo   Varchar (50) NOT NULL
	,CONSTRAINT Groupe_PK PRIMARY KEY (NomPromo)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Eleve
#------------------------------------------------------------

CREATE TABLE Eleve(
        EleveMat        Int NOT NULL ,
        NomE            Varchar (50) NOT NULL ,
        PrenomE         Varchar (50) NOT NULL ,
        NumRueE         Varchar (50) NOT NULL ,
        CodePostE       Int NOT NULL ,
        VilleE          Varchar (50) NOT NULL ,
        TelE            Int NOT NULL ,
        EmailE          Varchar (100) NOT NULL ,
        DateNaissanceE  Date NOT NULL ,
        VilleNaissanceE Varchar (50) NOT NULL ,
        PaysNaissanceE  Varchar (50) NOT NULL ,
        SexeE           Char (50) NOT NULL ,
        Photo           Blob NOT NULL ,
        NomG            Varchar (50) NOT NULL,
        NomPromo		Varchar (50) NOT NULL,
        ContactID       Int NOT NULL		
	,CONSTRAINT Eleve_PK PRIMARY KEY (EleveMat)
	,CONSTRAINT Eleve_Groupe_FK FOREIGN KEY (NomG) REFERENCES Groupe(NomG)
    ,CONSTRAINT Eleve_Promo_FK FOREIGN KEY (NomPromo) REFERENCES Promotion(NomPromo)
    ,CONSTRAINT Eleve_ContactID_FK FOREIGN KEY (ContactID) REFERENCES Contact(ContactID)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Cours
#------------------------------------------------------------

CREATE TABLE Cours(
        CodeCours      Int NOT NULL ,
        NomCours       Varchar (50) NOT NULL ,
        Description    Varchar (50) NOT NULL ,
        Annee          Varchar (50) NOT NULL ,
        CoefCours      Int NOT NULL ,
        PourcentageDE  float NOT NULL ,
        PourcentageTP  float NOT NULL ,
        PourcentagePJT float NOT NULL ,
        NomG           Varchar (50) NOT NULL,
        NomPromo       Varchar (50) NOT NULL
	,CONSTRAINT Cours_PK PRIMARY KEY (CodeCours)
	,CONSTRAINT Cours_Groupe_FK FOREIGN KEY (NomG) REFERENCES Groupe(NomG)
    ,CONSTRAINT Cours_Promo_FK FOREIGN KEY (NomPromo) REFERENCES Promotion(NomPromo)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Professeurs
#------------------------------------------------------------

CREATE TABLE Professeurs(
        ProfMat         Int NOT NULL ,
        NomP            Varchar (50) NOT NULL ,
        PrenomP         Varchar (50) NOT NULL ,
        NumRueP         Varchar (50) NOT NULL ,
        CodePostP       Int NOT NULL ,
        VilleP          Varchar (50) NOT NULL ,
        TelP            Int NOT NULL ,
        EmailP          Varchar (100) NOT NULL ,
        DateNaissanceP  Date NOT NULL ,
        VilleNaissanceP Varchar (50) NOT NULL ,
        PaysNaissanceP  Varchar (50) NOT NULL ,
        SexeP           Char (50) NOT NULL ,
        Photo           Blob NOT NULL
	,CONSTRAINT Professeurs_PK PRIMARY KEY (ProfMat)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Enseigne
#------------------------------------------------------------

CREATE TABLE Enseigne(
        ProfMat   Int NOT NULL ,
        CodeCours Int NOT NULL
	,CONSTRAINT Enseigne_PK PRIMARY KEY (ProfMat,CodeCours)
	,CONSTRAINT Enseigne_Professeurs_FK FOREIGN KEY (ProfMat) REFERENCES Professeurs(ProfMat)
	,CONSTRAINT Enseigne_Cours0_FK FOREIGN KEY (CodeCours) REFERENCES Cours(CodeCours)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Possède
#------------------------------------------------------------

/*
CREATE TABLE Possede(
        ContactID Int NOT NULL ,
        EleveMat  Int NOT NULL
	,CONSTRAINT Possede_PK PRIMARY KEY (ContactID,EleveMat)
	,CONSTRAINT Possede_Contact_FK FOREIGN KEY (ContactID) REFERENCES Contact(ContactID)
	,CONSTRAINT Possede_Eleve0_FK FOREIGN KEY (EleveMat) REFERENCES Eleve(EleveMat)
)ENGINE=InnoDB;
*/

#------------------------------------------------------------
# Table: Avoir
#------------------------------------------------------------

CREATE TABLE Avoir(
        ProfMat  Int NOT NULL ,
		EleveMat INT NOT NULL 
	,CONSTRAINT Avoir_PK PRIMARY KEY (ProfMat,EleveMat)
	,CONSTRAINT Avoir_Professeur_FK FOREIGN KEY (ProfMat) REFERENCES Professeurs(ProfMat)
	,CONSTRAINT AVoir_Eleve0_FK FOREIGN KEY (EleveMat) REFERENCES Eleve(EleveMat)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Note
#------------------------------------------------------------

CREATE TABLE Note(
        CodeCours  Int NOT NULL ,
		EleveMat INT NOT NULL,
        NoteDE float NOT NULL,
        NoteTP float NOT NULL,
        NotePJT float NOT NULL
	,CONSTRAINT Note_PK PRIMARY KEY (CodeCours,EleveMat)
	,CONSTRAINT Note_Cours_FK FOREIGN KEY (CodeCours) REFERENCES Cours(CodeCours)
	,CONSTRAINT Note_Eleve0_FK FOREIGN KEY (EleveMat) REFERENCES Eleve(EleveMat)
)ENGINE=InnoDB;
