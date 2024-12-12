-- 1. Afficher tous les membres du BDE avec leur rôle et leur date d’adhésion.
SELECT
    Membres_BDE.Id_Membre_du_BDE,
    Membres_BDE.nom_membre,
    Membres_BDE.date_adhesion_membre,
    Roles_BDE.role
FROM
    Membres_BDE
    INNER JOIN Roles_BDE ON Membres_BDE.Id_Role_BDE = Roles_BDE.Id_Role_BDE;

-- 2. Lister tous les événements prévus après une date donnée.
SELECT
    *
FROM
    Evenements
WHERE
    date_evenement > '2024-06-20';

-- 3. Afficher les informations des événements ayant un budget supérieur à 5000 MAD.
SELECT
    *
FROM
    Evenements
WHERE
    budget > 5000.00;

-- 4. Lister les participants inscrits à un événement spécifique.
SELECT Evenements_Participants.Id_Evenement, Evenements_Participants.Id_Participant, Participants.nom_participant FROM Evenements_Participants
INNER JOIN Participants ON Evenements_Participants.Id_Participant = Participants.Id_Participant  WHERE Id_Evenement = 1;

-- 5. Afficher les sponsors qui ont contribué à des événements ayant un budget supérieur à 3500 MAD.
