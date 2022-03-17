-- Creation des tables:

CREATE TABLE Personne(
numidentite INT NOT NULL PRIMARY KEY,
nom_personne VARCHAR(20),
prenom VARCHAR(20),
date_de_naissance DATE,
sexe VARCHAR(10)
);

CREATE TABLE Programme(
nom_progrramme VARCHAR(20) NOT NULL PRIMARY KEY,
date_debut DATE,
date_fin DATE
);


CREATE TABLE Prestation(
idprestation INT NOT NULL PRIMARY KEY,
duree INT,
prix DECIMAL,
nom VARCHAR(20)
);

CREATE TABLE maladie(
idmaladie INT NOT NULL PRIMARY KEY,
type_maladie VARCHAR(20),
nom_maladie VARCHAR(20),
traitement VARCHAR(20),
gravité VARCHAR(20)
);

CREATE TABLE Personne_maladie (
numidentite INT NOT NULL,
idmaladie INT NOT NULL,
PRIMARY KEY(numidentite,idmaladie),
FOREIGN KEY fk_personne(numidentite) REFERENCES Personne(numidentite),
FOREIGN KEY fk_maladie(idmaladie) REFERENCES maladie(idmaladie)
);

CREATE TABLE Quartier(
idquartier INT NOT NULL PRIMARY KEY,
nomquartier VARCHAR(20),
codepostal INT
);

CREATE TABLE conges(
idconges INT NOT NULL PRIMARY KEY,
datedebut DATE,
datefin DATE
);
	

CREATE TABLE Adresse(
idadresse INT NOT NULL PRIMARY KEY ,
num_rue INT ,
nom_rue VARCHAR(40),
idquartier INT NOT NULL,
FOREIGN KEY fk_quartier(idquartier) REFERENCES Quartier(idquartier)
);

CREATE TABLE Personne_conges (
numidentite INT NOT NULL,
idconges INT NOT NULL,
validation VARCHAR(20),
PRIMARY KEY(numidentite,idconges),
FOREIGN KEY fk_personne(numidentite) REFERENCES Personne(numidentite),
FOREIGN KEY fk_conges(idconges) REFERENCES conges(idconges)
);

-- Ajouter une colonne nom:
ALTER TABLE prestation
ADD COLUMN nom VARCHAR (20);


-- Inserer les  données:

INSERT INTO prestation (idprestation, nom, prix, duree)
VALUES
(1,"Massage tonique",56,10),
(2,"Bain moussant",67,15),
(3,"Jet d'eau",78,20),
(4,"Massage relax",89,25),
(5,"Argile",100,30),
(6,"Luminothérapie",110,35)
;

/*
 REQUÊTE :
 1-Lister l’ensembles des caracteristiques de la table prestation: 
*/
SELECT *
FROM prestation; 

-- 2-Lister les caracteristiques des  4 dernieres  adresses: 

SELECT *
FROM ADRESSE 
ORDER BY idadresse DESC 
LIMIT 4;

-- 3-Lister les personne et les caracteristique de leurs maladie 

SELECT personne.numidentite,
       personne.nom_personne, 
       personne.prenom, 
       maladie.nom_maladie, 
       maladie.gravité
FROM personne 
INNER JOIN personne_maladie AS PM
ON personne.numidentite = PM.numidentite
INNER JOIN maladie 
ON maladie.idmaladie = PM.idmaladie
;

-- 4-lister les personnes  ayant que des  maladie  « Osseuse » :

SELECT personne.numidentite,
       personne.nom_personne,
       personne.prenom,
       maladie.nom_maladie,
       maladie.gravité,
       maladie.type_maladie
FROM personne 
INNER JOIN personne_maladie AS PM
ON personne.numidentite = PM.numidentite
INNER JOIN maladie 
ON maladie.idmaladie = PM.idmaladie
WHERE type_maladie LIKE 'Osseuse';

-- 5- donner le prix moyen des prestation : 

SELECT AVG(prix) AS prix_moyen_des_prestation 
FROM prestation;

-- 6- lister les personnes n'ayant pas valider leurs vacances : 

SELECT personne.nom_personne, personne.prenom, validation
FROM personne 
inner JOIN personne_conges AS PC 
ON 
personne.numidentite = PC.numidentite 
WHERE PC.validation LIKE 'NON';
