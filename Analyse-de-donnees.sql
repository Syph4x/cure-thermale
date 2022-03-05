Ajouter une colonne  nom :
alter table prestation
ADD COLUMN nom VARCHAR (20)  ;


-- inserer less  donnees

INSERT into prestation (idprestation,nom,prix,duree )
VALUES
(1,"Massage tonique",56,10),
(2,"Bain moussant",67,15),
(3,"Jet d'eau",78,20),
(4,"Massage relax",89,25),
(5,"Argile",100,30),
(6,"Luminothérapie",110,35)
;
/*
ajouter l’attribut rôle dans table ass_personne_progrrame


ajouter les colonne manquante de programme  debut  fin   

III- requete 
 1-Lister l’ensembles des caracteristiques de la table prestation : 
*/
SELECT*
FROM prestation; 

-- 2- Lister les caracteristiques des  4 dernieres  adresse: 

select*
FROM ADRESSE 
ORDER by idadresse Desc 
limit 4 ;

3-lister les personne et les caracteristique de leurs maladie 

select personne.numidentite,personne.nom_personne,personne.prenom, maladie.nom_maladie,maladie.gravité
FROM personne 
INNER join ass_personne_maladie AS AssPM
ON personne.numidentite = assPM.numidentite
INNER JOIN maladie 
on maladie.idmaladie = assPM.idmaladie
;

4-lister les personnes  ayant que des  maladie  « Osseuse » :

select personne.numidentite,personne.nom_personne,personne.prenom, maladie.nom_maladie,maladie.gravité , maladie.type_maladie
FROM personne 
INNER join ass_personne_maladie AS AssPM
ON personne.numidentite = assPM.numidentite
INNER JOIN maladie 
on maladie.idmaladie = assPM.idmaladie
WHERE type_maladie LIKE 'Osseuse';
5- donner le prix moyen des prestation : 

select AVG(prix) as prix_moyen_des_prestation 
FROM prestation ;

6- lister les personnes n’ayant pas valider leurs vacances : 

select personne.nom_personne , personne.prenom, validation
FROM personne 
inner join ass_personne_conges AS ass_PC 
on 
personne.numidentite = ass_PC.numidentite 
where ass_PC.validation LIKE 'NON' ;