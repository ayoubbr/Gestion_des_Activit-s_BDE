CREATE TABLE Evenements (
   Id_Evenement INT AUTO_INCREMENT,
   nom_evenement VARCHAR(50) NOT NULL,
   date_evenement DATE NOT NULL,
   budget DECIMAL(15,2) DEFAULT 0.00,
   lieu VARCHAR(150),
   description VARCHAR(250),
   PRIMARY KEY (Id_Evenement)
);

CREATE TABLE Participants (
   Id_Participant INT AUTO_INCREMENT,
   nom_participant VARCHAR(50) NOT NULL,
   prenom_participant VARCHAR(50) NOT NULL,
   email_participant VARCHAR(50) UNIQUE,
   status_participant VARCHAR(50),
   PRIMARY KEY (Id_Participant)
);

CREATE TABLE Sponsors (
   Id_Sponsor INT AUTO_INCREMENT,
   nom_entreprise VARCHAR(50) NOT NULL,
   nom_contact_principal VARCHAR(50) NOT NULL,
   email_sponsor VARCHAR(50) UNIQUE,
   numero_sponsor VARCHAR(15),
   montant_sponsorise DECIMAL(15,2) DEFAULT 0.00,
   PRIMARY KEY (Id_Sponsor)
);

CREATE TABLE Roles_BDE (
   Id_Role_BDE INT AUTO_INCREMENT,
   title VARCHAR(50) NOT NULL,
   PRIMARY KEY (Id_Role_BDE)
);

CREATE TABLE Membres_BDE (
   Id_Membre_du_BDE INT AUTO_INCREMENT,
   nom_membre VARCHAR(50) NOT NULL,
   prenom_membre VARCHAR(50) NOT NULL,
   email_membre VARCHAR(100) UNIQUE NOT NULL,
   date_adhesion_membre DATE NOT NULL,
   Id_Role_BDE INT NOT NULL,
   PRIMARY KEY (Id_Membre_du_BDE),
   FOREIGN KEY (Id_Role_BDE) REFERENCES Roles_BDE(Id_Role_BDE)
);

CREATE TABLE Evenements_Membres (
   Id_Evenement INT NOT NULL,
   Id_Membre_du_BDE INT NOT NULL,
   PRIMARY KEY (Id_Evenement, Id_Membre_du_BDE),
   FOREIGN KEY (Id_Evenement) REFERENCES Evenements(Id_Evenement),
   FOREIGN KEY (Id_Membre_du_BDE) REFERENCES Membres_BDE(Id_Membre_du_BDE)
);

CREATE TABLE Evenements_Sponsors (
   Id_Evenement INT NOT NULL,
   Id_Sponsor INT NOT NULL,
   PRIMARY KEY (Id_Evenement, Id_Sponsor),
   FOREIGN KEY (Id_Evenement) REFERENCES Evenements(Id_Evenement),
   FOREIGN KEY (Id_Sponsor) REFERENCES Sponsors(Id_Sponsor)
);

CREATE TABLE Evenements_Participants (
   Id_Evenement INT NOT NULL,
   Id_Participant INT NOT NULL,
   PRIMARY KEY (Id_Evenement, Id_Participant),
   FOREIGN KEY (Id_Evenement) REFERENCES Evenements(Id_Evenement),
   FOREIGN KEY (Id_Participant) REFERENCES Participants(Id_Participant)
);