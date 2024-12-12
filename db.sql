CREATE TABLE Evenements (
   Id_Evenement INT AUTO_INCREMENT,
   nom_evenement VARCHAR(50) NOT NULL,
   date_evenement DATE NOT NULL,
   budget DECIMAL(15, 2) DEFAULT 0.00,
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
   montant_sponsorise DECIMAL(15, 2) DEFAULT 0.00,
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

INSERT INTO
   Evenements (
      nom_evenement,
      date_evenement,
      budget,
      lieu,
      description
   )
VALUES
   (
      'Concert Rock',
      '2024-03-15',
      15000.00,
      'Salle Polyvalente, Paris',
      'Un concert de rock avec des artistes internationaux'
   ),
   (
      'Conférence Tech',
      '2024-05-10',
      30000.00,
      'Centre des Congrès, Lyon',
      "Une conférence sur les nouvelles technologies et l'intelligence artificielle"
   ),
   (
      'Foire Artisanale',
      '2024-06-20',
      5000.00,
      'Place Centrale, Marseille',
      'Une foire mettant en avant les artisans locaux'
   ),
   (
      'Marathon Annuel',
      '2024-09-05',
      20000.00,
      'Parc Municipal, Toulouse',
      'Un marathon annuel avec des coureurs de toute la région'
   ),
   (
      'Spectacle Comédie',
      '2024-12-10',
      8000.00,
      'Théâtre Municipal, Nice',
      'Un spectacle humoristique avec des comédiens renommés'
   );

INSERT INTO
   Participants (
      nom_participant,
      prenom_participant,
      email_participant,
      status_participant
   )
VALUES
   (
      'Dupont',
      'Marie',
      'marie.dupont@example.com',
      'Confirmé'
   ),
   (
      'Martin',
      'Jean',
      'jean.martin@example.com',
      'En attente'
   ),
   (
      'Lemoine',
      'Sophie',
      'sophie.lemoine@example.com',
      'Confirmé'
   ),
   (
      'Durand',
      'Paul',
      'paul.durand@example.com',
      'Annulé'
   ),
   (
      'Bernard',
      'Claire',
      'claire.bernard@example.com',
      'Confirmé'
   );

INSERT INTO
   Sponsors (
      nom_entreprise,
      nom_contact_principal,
      email_sponsor,
      numero_sponsor,
      montant_sponsorise
   )
VALUES
   (
      'TechCorp',
      'Alice Morel',
      'alice.morel@techcorp.com',
      '0612345678',
      10000.00
   ),
   (
      'GreenPlanet',
      'Marc Durand',
      'marc.durand@greenplanet.com',
      '0623456789',
      15000.00
   ),
   (
      'UrbanStyle',
      'Sophie Dupuis',
      'sophie.dupuis@urbanstyle.com',
      '0634567890',
      5000.00
   ),
   (
      'BlueWave',
      'Julien Lambert',
      'julien.lambert@bluewave.com',
      '0645678901',
      20000.00
   ),
   (
      'FastTrack',
      'Emma Leroy',
      'emma.leroy@fasttrack.com',
      '0656789012',
      12000.00
   );

INSERT INTO
   Roles_BDE (title)
VALUES
   ('Président'),
   ('Vice-président'),
   ('Trésorier'),
   ('Secrétaire'),
   ('Responsable événementiel');

INSERT INTO
   Membres_BDE (
      nom_membre,
      prenom_membre,
      email_membre,
      date_adhesion_membre,
      Id_Role_BDE
   )
VALUES
   (
      'Dupont',
      'Alice',
      'alice.dupont@example.com',
      '2023-01-15',
      1
   ),
   (
      'Martin',
      'Lucas',
      'lucas.martin@example.com',
      '2023-01-20',
      2
   ),
   (
      'Lemoine',
      'Sophie',
      'sophie.lemoine@example.com',
      '2023-02-05',
      3
   ),
   (
      'Durand',
      'Paul',
      'paul.durand@example.com',
      '2023-03-10',
      4
   ),
   (
      'Bernard',
      'Claire',
      'claire.bernard@example.com',
      '2023-04-01',
      5
   );

INSERT INTO
   Evenements_Membres (Id_Evenement, Id_Membre_du_BDE)
VALUES
   (1, 1),
   (1, 5),
   (2, 2),
   (3, 4),
   (4, 3);

INSERT INTO
   Evenements_Sponsors (Id_Evenement, Id_Sponsor)
VALUES
   (1, 1),
   (2, 2),
   (3, 3),
   (4, 4),
   (5, 5);

INSERT INTO
   Evenements_Participants (Id_Evenement, Id_Participant)
VALUES
   (1, 1),
   (1, 3),
   (2, 2),
   (3, 5),
   (4, 4);

SELECT
   *
FROM
   Evenements;

SELECT
   *
FROM
   Evenements_Membres;

SELECT
   *
FROM
   Evenements_Participants;

SELECT
   *
FROM
   Evenements_Sponsors;

SELECT
   *
FROM
   Membres_BDE;

SELECT
   *
FROM
   Participants;

SELECT
   *
FROM
   Roles_BDE;

SELECT
   *
FROM
   Sponsors;