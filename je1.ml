(***************************************************************************) 
(* Jeu d'essai pour sysactivites_gratuites - TP2 - HIVER 2015              *) 
(***************************************************************************)

(* On charge le fichier ml du Tp après avoir implanté 
les méthodes demandées pour realiser les tests  *)
#use "TP2-H2015.ml";;

(* Résultat:
module type TP2H15 =
  sig
    class activite :
      string list ->
      bool ->
      object
        val adresse : string
        val arrondissement : string
        val code_session : string
        val date_deb : string
        val date_fin : string
        val description : string
        val description_act : string
        val description_nat : string
        val heure_deb : string
        val heure_fin : string
        val jour_semaine : string
        val lieu_1 : string
        val lieu_2 : string
        val nom_cour : string
        val tarif_base : float
        val type_activite : bool
        method afficher_activite : unit
        method get_adresse : string
        method get_arrondissement : string
        method get_date_deb : string
        method get_date_fin : string
        method get_description : string
        method get_description_nat : string
        method get_heure_deb : string
        method get_heure_fin : string
        method get_jour_semaine : string
        method get_lieu_1 : string
        method get_tarif_base : float
        method get_type_activite : bool
      end
    class sysactivites :
      string ->
      object
        val mutable liste_activites : activite list
        val origine_donnees : string
        method activite_existe : activite -> bool
        method afficher_systeme_activites : unit
        method ajouter_activite : activite -> unit
        method get_liste_activites : activite list
        method get_origine_donnees : string
        method lire_fichier : in_channel -> string -> string list list
        method lister_arrondissements : string list
        method lister_types_activites : string list
        method retourner_nbr_activites : int
        method set_liste_activites : activite list -> unit
        method supprimer_activite : activite -> unit
        method trouver_selon_arrondissement : string -> activite list
        method trouver_selon_type : string -> activite list
      end
    class sysactivites_gratuites :
      string ->
      string ->
      object
        val mutable liste_activites : activite list
        val origine_donnees : string
        val systeme_utilisees : string
        method activite_existe : activite -> bool
        method afficher_systeme_activites : unit
        method ajouter_activite : activite -> unit
        method ajouter_liste_activites : string list list -> unit
        method charger_donnees_sysactivites : string -> unit
        method get_liste_activites : activite list
        method get_origine_donnees : string
        method get_systeme_utilisees : string
        method lire_fichier : in_channel -> string -> string list list
        method lister_arrondissements : string list
        method lister_types_activites : string list
        method retourner_nbr_activites : int
        method set_liste_activites : activite list -> unit
        method supprimer_activite : activite -> unit
        method trier_activites : int -> unit
        method trouver_selon_arrondissement : string -> activite list
        method trouver_selon_type : string -> activite list
      end
    class sysactivites_payantes :
      string ->
      string ->
      object
        val mutable liste_activites : activite list
        val origine_donnees : string
        val systeme_utilisees : string
        method activite_existe : activite -> bool
        method afficher_systeme_activites : unit
        method ajouter_activite : activite -> unit
        method ajouter_liste_activites : string list list -> unit
        method charger_donnees_sysactivites : string -> unit
        method get_liste_activites : activite list
        method get_origine_donnees : string
        method get_systeme_utilisees : string
        method lire_fichier : in_channel -> string -> string list list
        method lister_arrondissements : string list
        method lister_types_activites : string list
        method retourner_nbr_activites : int
        method set_liste_activites : activite list -> unit
        method supprimer_activite : activite -> unit
        method trier_activites : int -> unit
        method trouver_selon_arrondissement : string -> activite list
        method trouver_selon_type : string -> activite list
      end
    class app_sysactivites :
      string ->
      string ->
      object
        val nom_fichier_agratuites : string
        val nom_fichier_apayantes : string
        method lancer_systeme_activites : unit
        method sauvegarder_liste_activites :
          activite list -> out_channel -> unit
      end
  end
module Tp2h15 : TP2H15
*)

(* On ouvre le module du TP *) 
open Tp2h15;;

(* On exécute maintenant les méthodes une à une *)

let sag = new sysactivites_gratuites "systeme d'activites gratuites" "donnees ouvertes de la ville de Quebec";;

(* Résultat:
Recherche dans un systeme d'activites gratuites utilisant les donnees ouvertes de la ville de Quebec.
val sag : Tp2h15.sysactivites_gratuites = <obj>
*)

let ag = new activite ["P2015";"Aquaforme";"Aquaforme";"Activites aquatiques";"YWCA Quebec";"Y.W.C.A";
			 "Y.W.C.A. piscine";"Arrondissement de La Cite-Limoilou";
			 "855, avenue Holland, Quebec (QC) G1S 3S5";
			 "2015-05-01";"2015-06-19";"Vendredi";"10:30:00";"11:25:00"] true;;

(* Résultat:
val ag : Tp2h15.activite = <obj>
*)

sag#ajouter_activite ag;;

(* Résultat:
- : unit = ()
*)

sag#activite_existe ag;;

(* Résultat:
- : bool = true
*)

let na = sag#retourner_nbr_activites;;

(* Résultat:
val na : int = 1
*)


ag#afficher_activite;;

(*
Description: Aquaforme.
Type: Activites aquatiques.
Lieu: Y.W.C.A.
Adresse: 855, avenue Holland, Quebec (QC) G1S 3S5.
Arrondissement: Arrondissement de La Cite-Limoilou.
Dates: 2015-05-01 au 2015-06-19.
Jour de la semaine: Vendredi.
Heures: 10:30:00 a 11:25:00.

- : unit = ()
*)


sag#supprimer_activite ag;;

(* Résultat:
- : unit = ()
*)

sag#ajouter_liste_activites [["P2015";"Aquaforme";"Aquaforme";"Activites aquatiques";
				   "YWCA Quebec";"Y.W.C.A";"Y.W.C.A. piscine";
				   "Arrondissement de La Cite-Limoilou";
				   "855, avenue Holland, Quebec (QC) G1S 3S5";
				   "2015-04-25";"2015-05-01";"Vendredi";"10:30:00";"11:25:00"];
				  ["H2015";"Billard libre";"Billard libre";"Loisirs recreatifs";
				   "Club FADOQ Bonne-Entente inc.";"Centre de loisirs Saint-Benoit";
				   "Salle RC03-01";"Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
				   "909, boulevard Pie-XII, Quebec (QC) G1X 3T4";
				   "2015-02-12";"2015-05-15";"Jeudi";"09:00:00";"11:30:00"]];;


(* Résultat:
- : unit = ()
*)



let (selon_date_deb, selon_date_fin) = (1,2);;

sag#trier_activites selon_date_deb;;
sag#afficher_systeme_activites;;

(* Résultat:
Description: Billard libre.
Type: Loisirs recreatifs.
Lieu: Centre de loisirs Saint-Benoit.
Adresse: 909, boulevard Pie-XII, Quebec (QC) G1X 3T4.
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-02-12 au 2015-05-15.
Jour de la semaine: Jeudi.
Heures: 09:00:00 a 11:30:00.

Description: Aquaforme.
Type: Activites aquatiques.
Lieu: Y.W.C.A.
Adresse: 855, avenue Holland, Quebec (QC) G1S 3S5.
Arrondissement: Arrondissement de La Cite-Limoilou.
Dates: 2015-04-25 au 2015-05-01.
Jour de la semaine: Vendredi.
Heures: 10:30:00 a 11:25:00.

- : unit = ()
*)

sag#trier_activites selon_date_fin;;
sag#afficher_systeme_activites;;

(* Résultat:
Description: Aquaforme.
Type: Activites aquatiques.
Lieu: Y.W.C.A.
Adresse: 855, avenue Holland, Quebec (QC) G1S 3S5.
Arrondissement: Arrondissement de La Cite-Limoilou.
Dates: 2015-04-25 au 2015-05-01.
Jour de la semaine: Vendredi.
Heures: 10:30:00 a 11:25:00.

Description: Billard libre.
Type: Loisirs recreatifs.
Lieu: Centre de loisirs Saint-Benoit.
Adresse: 909, boulevard Pie-XII, Quebec (QC) G1X 3T4.
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-02-12 au 2015-05-15.
Jour de la semaine: Jeudi.
Heures: 09:00:00 a 11:30:00.

- : unit = ()
*)


let fileg = open_in "LOISIR_LIBRE.CSV";;

(* Résultat:
val fileg : in_channel = <abstr>
*)

let llag = sag#lire_fichier fileg "|";;
close_in fileg;;

(* Résultat:
  [["ï»¿CODE_SESSION"; "DESCRIPTION"; "DESCRIPTION_ACT"; "DESCRIPTION_NAT";
    "NOM_COUR"; "LIEU_1"; "LIEU_2"; "ARRONDISSEMENT"; "ADRESSE"; "DATE_DEB";
    "DATE_FIN"; "JOUR_SEMAINE"; "HEURE_DEBUT"; "HEURE_FIN"];
   ["P2015"; "Maison des jeunes Neufchatel"; "Maison des jeunes Neufchatel";
    "Loisirs jeunesse"; "Maison des jeunes de St-Andre de Neufchatel (La)";
    "Pavillon de service Saint-Andre";
    "Pav. de service Saint-Andre - salle rez-de-chaussee";
    "Arrondissement des Rivieres";
    "2125, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-04-01";
    "2015-06-30"; "Vendredi"; "17:00:00"; "23:00:00"];
   ["H2015"; "Activites sociales"; "Activites sociales";
    "Loisirs recreatifs"; "Centre Social de la Croix Blanche";
    "Centre social Croix blanche"; "Centre Social Croix Blanche salle 2";
    "Arrondissement de La Cite-Limoilou";
    "960, avenue Dessane, Quebec (QC) G1S 3J9 "; "2015-01-06"; "2015-05-29";
    "Mardi"; "13:30:00"; "17:00:00"];
   ["H2015"; "Peinture acrylique"; "Peinture acrylique"; "Arts visuels";
    "Centre Social de la Croix Blanche"; "Centre social Croix blanche";
    "Centre Social Croix Blanche salle 3";
    "Arrondissement de La Cite-Limoilou";
    "960, avenue Dessane, Quebec (QC) G1S 3J9 "; "2015-01-08"; "2015-04-30";
    "Jeudi"; "14:00:00"; "16:00:00"];
   ["E2015"; "Evenement special - Fete nationale"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Ecole primaire de l'Escabelle A - gymnase simple";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-06-24";
    "2015-06-24"; "Mercredi"; "08:00:00"; "23:59:00"];
   ["E2015"; "Evenement special - Fete nationale"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Parc Saint-Andre - aire de jeux"; "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-06-24";
    "2015-06-24"; "Mercredi"; "08:00:00"; "23:59:00"];
   ["E2015"; "Evenement special - Fete nationale"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Parc Saint-Andre - terrain de balle - Savard";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-06-24";
    "2015-06-24"; "Mercredi"; "08:00:00"; "23:59:00"];
   ["E2015"; "Evenement special - Festi-Parc"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Parc Saint-Andre - patinoire exterieure 4 saisons";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-08-13";
    "2015-08-16"; "Samedi"; "18:00:00"; "23:59:00"];
   ["E2015"; "Evenement special - Festi-Parc"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - p. salle SS-104-1";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-08-13";
    "2015-08-16"; "Vendredi"; "18:00:00"; "23:59:00"];
   ["E2015"; "Evenement special - Festi-Parc"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Parc Saint-Andre - aire de jeux"; "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-08-13";
    "2015-08-16"; "Vendredi"; "18:00:00"; "23:59:00"];
   ["E2015"; "Evenement special - Festi-Parc"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Parc Saint-Andre - aire de jeux"; "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-08-13";
    "2015-08-16"; "Samedi"; "08:00:00"; "23:59:00"];
   ["E2015"; "Evenement special - Festi-Parc"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Parc Saint-Andre - terrain de balle - Savard";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-08-13";
    "2015-08-16"; "Samedi"; "08:00:00"; "23:59:00"];
   ["E2015"; "Evenement special - Festi-Parc"; "Evenement special";
    "Evenement special"; "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Parc Saint-Andre - terrain de balle - Savard";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-08-13";
    "2015-08-16"; "Dimanche"; "08:00:00"; "23:59:00"];
   ["H2015"; "Basketball - Groupe communautaire";
    "Basketball - Groupe communautaire"; "Sports et de plein air";
    "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - gymnase simple SS109-2-3-4";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-01-04";
    "2015-03-29"; "Dimanche"; "08:00:00"; "11:00:00"];
   ["H2015"; "Hockey interieur - Groupe communautaire";
    "Hockey interieur - Groupe communautaire"; "Sports et de plein air";
    "Loisirs et Sports Neufchatel inc.";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - gymnase simple SS109-2-3-4";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-01-14";
    "2015-05-27"; "Mercredi"; "17:30:00"; "19:00:00"];
   ["H2015"; "Club de marche Select"; "Club de marche";
    "Activites physiques"; "Loisirs Montcalm inc (Les)";
    "Centre des loisirs Montcalm"; "Centre des loisirs Montcalm";
    "Arrondissement de La Cite-Limoilou";
    "265, boulevard Rene-Levesque Ouest, Quebec (QC) G1R 2A7 "; "2015-01-14";
    "2015-04-27"; "Mercredi"; "09:30:00"; "10:30:00"];
   ["H2015"; "Conditionnement physique - programme PIED";
    "Conditionnement physique - Programme PIED"; "Activites physiques";
    "Centre des loisirs Saint-Sacrement inc.";
    "Centre des loisirs Saint-Sacrement";
    "Centre des loisirs Saint-Sacrement salle communautaire";
    "Arrondissement de La Cite-Limoilou";
    "1360, boulevard de l'Entente, Quebec (QC) G1S 2T9 "; "2015-01-13";
    "2015-04-09"; "Mardi"; "13:30:00"; "14:30:00"];
   ["H2015"; "Conditionnement physique - programme PIED";
    "Conditionnement physique - Programme PIED"; "Activites physiques";
    "Centre des loisirs Saint-Sacrement inc.";
    "Centre des loisirs Saint-Sacrement";
    "Centre des loisirs Saint-Sacrement salle communautaire";
    "Arrondissement de La Cite-Limoilou";
    "1360, boulevard de l'Entente, Quebec (QC) G1S 2T9 "; "2015-01-13";
    "2015-04-09"; "Jeudi"; "13:30:00"; "15:00:00"];
   ["P2015"; "Travailleurs de parc"; "Travailleurs de parc";
    "Loisirs jeunesse"; "Loisirs Du Plateau de Charlesbourg inc.";
    "Parc Maurice-Dorion"; "Parc Maurice-Dorion";
    "Arrondissement de Charlesbourg";
    "8815, avenue Jean-Paquin, Quebec (QC) G1G 4W7 "; "2015-05-05";
    "2015-08-03"; "Jeudi"; "17:00:00"; "23:00:00"];
   ["P2015"; "Patinage a roues alignees"; "Patinage a roues alignees";
    "Sports et de plein air"; "Loisirs Du Plateau de Charlesbourg inc.";
    "Parc Maurice-Dorion"; "Parc Maurice-Dorion";
    "Arrondissement de Charlesbourg";
    "8815, avenue Jean-Paquin, Quebec (QC) G1G 4W7 "; "2015-05-04";
    "2015-11-06"; "Mercredi"; "08:00:00"; ...];
   ...]
# - : unit = ()
*)

let sag = new sysactivites_gratuites "systeme d'activites gratuites" "donnees ouvertes de la ville de Quebec";;

sag#charger_donnees_sysactivites "LOISIR_LIBRE.CSV";;

(* Résultat:
- : unit = ()
*)

let na = sag#retourner_nbr_activites;;

(* Résultat:
val na : int = 1116
*)

let lag = sag#trouver_selon_arrondissement "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";;
let nag = List.length lag;;

(* Résultat:
val lag : Tp2h15.activite list =
  [<obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>]
# val nag : int = 28
*)

let ltg = sag#trouver_selon_type "Sports et de plein air";;
let ntg = List.length ltg;;

(*
val ltg : Tp2h15.activite list =
  [<obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>;
   <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; <obj>; ...]
# val ntg : int = 210
*)

let liste_arrondg = sag#lister_arrondissements;;
let nag = List.length liste_arrondg;;

(*
val liste_arrondg : string list =
  ["Arrondissement des Rivieres"; "Arrondissement de La Cite-Limoilou";
   "Arrondissement de Charlesbourg"; "Arrondissement de Beauport";
   "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
   "Arrondissement de La Haute-Saint-Charles"]
# val nag : int = 6
*)

let liste_typesg = sag#lister_types_activites;;
let ntg = List.length liste_typesg;;

(*
val liste_typesg : string list =
  ["Loisirs jeunesse"; "Loisirs recreatifs"; "Arts visuels";
   "Evenement special"; "Sports et de plein air"; "Activites physiques";
   "Sports de glace"; "Arts de la scene"; "Programme d'aide";
   "Activites aquatiques"; "Relache"; "Patrimoine"; "Clubs de natation";
   "Artisanat"; "Activites-Physiques"; "Camp specialise"; "Sports de combat";
   "Exposition"; "Loisir scientifique"; "Loisir educatif"; "Metiers d'art";
   "Cours de natation"; "Mieux-etre"; "Formation"]
# val ntg : int = 24
*)

let app = new app_sysactivites "LOISIR_LIBRE.CSV" "LOISIR_PAYANT.CSV";;

(* Résultat:
Bienvenue a l'outil de recherche du Centre de Losirs de Quebec
Quel type d'activites vous interessent?
1- Activites gratuites.
2- Activites payantes.
Veuillez choisir une option (1 ou 2):? 1
Recherche dans un systeme d'activites gratuites utilisant les donnees ouvertes de la ville de Quebec.
Quel type (nature) d'activites vous interessent?
0 - Loisirs jeunesse
1 - Loisirs recreatifs
2 - Arts visuels
3 - Evenement special
4 - Sports et de plein air
5 - Activites physiques
6 - Sports de glace
7 - Arts de la scene
8 - Programme d'aide
9 - Activites aquatiques
10 - Relache
11 - Patrimoine
12 - Clubs de natation
13 - Artisanat
14 - Activites-Physiques
15 - Camp specialise
16 - Sports de combat
17 - Exposition
18 - Loisir scientifique
19 - Loisir educatif
20 - Metiers d'art
21 - Cours de natation
22 - Mieux-etre
23 - Formation
24 - Tous 
Veuillez entrer un nombre entre 0 et 24:? 0

Quel arrondissement vous interesse?
0 - Arrondissement des Rivieres
1 - Arrondissement de La Cite-Limoilou
2 - Arrondissement de Charlesbourg
3 - Arrondissement de Beauport
4 - Arrondissement Sainte-Foy-Sillery-Cap-Rouge
5 - Arrondissement de La Haute-Saint-Charles
6 - Tous 
Veuillez entrer un nombre entre 0 et 6:? 0

Voici le resultat de la recherche:
Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-04-01 au 2015-06-30.
Jour de la semaine: Vendredi.
Heures: 17:00:00 a 23:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-04-01 au 2015-06-30.
Jour de la semaine: Jeudi.
Heures: 18:00:00 a 22:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-04-01 au 2015-06-30.
Jour de la semaine: Samedi.
Heures: 17:00:00 a 23:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-01-01 au 2015-03-31.
Jour de la semaine: Mercredi.
Heures: 18:00:00 a 22:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-01-01 au 2015-03-31.
Jour de la semaine: Vendredi.
Heures: 17:00:00 a 23:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-04-01 au 2015-06-30.
Jour de la semaine: Mercredi.
Heures: 18:00:00 a 22:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-01-01 au 2015-03-31.
Jour de la semaine: Samedi.
Heures: 17:00:00 a 23:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-01-01 au 2015-03-31.
Jour de la semaine: Jeudi.
Heures: 18:00:00 a 22:00:00.


Nombre d'activites trouvees: 8

Voulez-vous trier le resultat de la recherche?
1- Selon la date et l'heure de début.
2- Selon la date et l'heure de fin.
3- Non, merci!.
Veuillez choisir une option (1 a 3):? 1

Voici la liste triee:

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-01-01 au 2015-03-31.
Jour de la semaine: Vendredi.
Heures: 17:00:00 a 23:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-01-01 au 2015-03-31.
Jour de la semaine: Samedi.
Heures: 17:00:00 a 23:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-01-01 au 2015-03-31.
Jour de la semaine: Mercredi.
Heures: 18:00:00 a 22:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-01-01 au 2015-03-31.
Jour de la semaine: Jeudi.
Heures: 18:00:00 a 22:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-04-01 au 2015-06-30.
Jour de la semaine: Vendredi.
Heures: 17:00:00 a 23:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-04-01 au 2015-06-30.
Jour de la semaine: Samedi.
Heures: 17:00:00 a 23:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-04-01 au 2015-06-30.
Jour de la semaine: Jeudi.
Heures: 18:00:00 a 22:00:00.

Description: Maison des jeunes Neufchatel.
Type: Loisirs jeunesse.
Lieu: Pavillon de service Saint-Andre.
Adresse: 2125, boulevard Bastien, Quebec (QC) G2B 1B8 .
Arrondissement: Arrondissement des Rivieres.
Dates: 2015-04-01 au 2015-06-30.
Jour de la semaine: Mercredi.
Heures: 18:00:00 a 22:00:00.


Voulez-vous sauvegarder le resultat de recherche?
1- Dans un fichier 'Resultats.txt'.
2- Non merci!.
Veuillez choisir une option (1 ou 2):? 1

Veuillez consulter le fichier 'Resultats.txt' dans votre repertoire courant!

Merci est au revoir!

val app : Tp2h15.app_sysactivites = <obj>
*)


(***************************************)
(* Verification des messages d'erreurs *)
(***************************************)

let sag = new sysactivites_gratuites "systeme d'activites gratuites" "donnees ouvertes de la ville de Quebec";;
let ag2 = new activite ["P2015";"Aquaforme";"Aquaforme";"Activites aquatiques";"YWCA Quebec";"Y.W.C.A";
			 "Y.W.C.A. piscine";"Arrondissement de La Cite-Limoilou";
			 "855, avenue Holland, Quebec (QC) G1S 3S5";
			 "2015-05-01";"2015-06-19";"Vendredi";"10:30:00";"11:25:00"] true;;

sag#ajouter_activite ag;;

try 
  sag#supprimer_activite ag2
with
  Failure s -> print_endline s;;

(* Résultat:
Le systeme d'activites ne contient pas cette activite
- : unit = ()
*)

let sag = new sysactivites_gratuites "systeme d'activites gratuites" "donnees ouvertes de la ville de Quebec";;

try 
  sag#afficher_systeme_activites
with
  Failure s -> print_endline s;;

(* Résultat:
Le systeme d'activites est vide
- : unit = ()
*)


try 
  sag#charger_donnees_sysactivites "TestTP2.CSV"
with
  Sys_error s -> print_endline s;;

(* Résultat:
TestTP2.CSV: No such file or directory
- : unit = ()
*)

try 
  ignore (sag#trouver_selon_arrondissement "test")
with
  Failure s -> print_endline s;;

(* Résultat:
Le systeme d'activites est vide
- : unit = ()
*)


try 
  ignore (sag#trouver_selon_type "test")
with
  Failure s -> print_endline s;;

(* Résultat:
Le systeme d'activites est vide
- : unit = ()
*)


try 
  ignore (sag#lister_arrondissements)
with
  Failure s -> print_endline s;;

(* Résultat:
Le systeme d'activites est vide
- : unit = ()
*)


try 
  ignore (sag#lister_types_activites)
with
  Failure s -> print_endline s;;

(* Résultat:
Le systeme d'activites est vide
- : unit = ()
*)


try 
  sag#trier_activites 4
with
  Failure s -> print_endline s;;

(* Résultat:
trier_activites: ordre incorrect!
- : unit = ()
*)

let fluxg = open_out "Resultats2.txt";;

try 
  app#sauvegarder_liste_activites [] fluxg
with
  Failure s -> print_endline s;;

close_out fluxg;;

(* Résultat:
val fluxg : out_channel = <abstr>
La liste d'activites est vide
- : unit = ()
- : unit = ()
*)


try 
  app#lancer_systeme_activites
with
  Failure s -> print_endline s;;

(* Résultat:
Bienvenue a l'outil de recherche du Centre de Losirs de Quebec
Quel type d'activites vous interessent?
1- Activites gratuites.
2- Activites payantes.
Veuillez choisir une option (1 ou 2):? 3
Choix incorrect, veuillez recommencer!
- : unit = ()
*)
