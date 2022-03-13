-- Ajouter une colonne nom:
ALTER TABLE prestation
ADD COLUMN nom VARCHAR (20);


-- inserer les  données:

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
INNER JOIN ass_personne_maladie AS AssPM
ON personne.numidentite = assPM.numidentite
INNER JOIN maladie 
ON maladie.idmaladie = assPM.idmaladie
;

-- 4-lister les personnes  ayant que des  maladie  « Osseuse » :
SELECT personne.numidentite,
       personne.nom_personne,
       personne.prenom,
       maladie.nom_maladie,
       maladie.gravité,
       maladie.type_maladie
FROM personne 
INNER JOIN ass_personne_maladie AS AssPM
ON personne.numidentite = assPM.numidentite
INNER JOIN maladie 
ON maladie.idmaladie = assPM.idmaladie
WHERE type_maladie LIKE 'Osseuse';

-- 5- donner le prix moyen des prestation : 

SELECT AVG(prix) AS prix_moyen_des_prestation 
FROM prestation;

-- 6- lister les personnes n'ayant pas valider leurs vacances : 

SELECT personne.nom_personne, personne.prenom, validation
FROM personne 
inner JOIN ass_personne_conges AS ass_PC 
ON 
personne.numidentite = ass_PC.numidentite 
WHERE ass_PC.validation LIKE 'NON';
