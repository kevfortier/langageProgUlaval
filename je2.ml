(***************************************************************************) 
(* Jeu d'essai pour sysactivites_payantes - TP2 - HIVER 2015               *) 
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

let sap = new sysactivites_payantes "systeme d'activites payantes" "donnees ouvertes de la ville de Quebec";;

(* Résultat:
Recherche dans un systeme d'activites payantes utilisant les donnees ouvertes de la ville de Quebec.
val sap : Tp2h15.sysactivites_payantes = <obj>
*)

let ap = new activite ["P2015";"Danse country, avance";"Danse country";"Arts de la scene";
		       "Corporation des loisirs Sainte-Ursule Inc.";"45,00";"Centre de loisirs Sainte-Ursule";
		       "Salle pol. 208 centre de loisirs Ste-Ursule";"Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
		       "3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7";"2015-04-22";"2015-06-10";
		       "Mercredi";"20:15:00";"21:30:00"] false;;

(* Résultat:
val ap : Tp2h15.activite = <obj>
*)

sap#ajouter_activite ap;;

(* Résultat:
- : unit = ()
*)

sap#activite_existe ap;;

(* Résultat:
- : bool = true
*)

let na = sap#retourner_nbr_activites;;

(* Résultat:
val na : int = 1
*)

ap#afficher_activite;;

(*
Description: Danse country, avance.
Type: Arts de la scene.
Lieu: Centre de loisirs Sainte-Ursule.
Adresse: 3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7.
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-04-22 au 2015-06-10.
Jour de la semaine: Mercredi.
Heures: 20:15:00 a 21:30:00.
Prix de l'activite: 45.$

- : unit = ()
*)

sap#supprimer_activite ap;;

(* Résultat:
- : unit = ()
*)

sap#ajouter_liste_activites [["P2015";"Danse country, avance";"Danse country";"Arts de la scene";
		       "Corporation des loisirs Sainte-Ursule Inc.";"60,00";"Centre de loisirs Sainte-Ursule";
		       "Salle pol. 208 centre de loisirs Ste-Ursule";"Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
		       "3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7";"2015-04-22";"2015-06-10";
		       "Mercredi";"20:15:00";"21:30:00"];
		       ["H2015";"Taiji, avance";"Taiji";"Mieux-etre";"Centre de yoga de Sainte-Foy inc.";
			"45,00";"Centre de yoga";"Salle A Centre de yoga";"Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
			"844, rue Paradis, Québec (QC) G1V 4J5";"2015-01-14";"2015-04-01";
			"Mercredi";"13:30:00";"15:00:00"]];;

(* Résultat:
- : unit = ()
*)

let selon_traif_base = 3;;

sap#trier_activites selon_traif_base;;
sap#afficher_systeme_activites;;


(* Résultat:
Description: Taiji, avance.
Type: Mieux-etre.
Lieu: Centre de yoga.
Adresse: 844, rue Paradis, Québec (QC) G1V 4J5.
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-14 au 2015-04-01.
Jour de la semaine: Mercredi.
Heures: 13:30:00 a 15:00:00.
Prix de l'activite: 45.$

Description: Danse country, avance.
Type: Arts de la scene.
Lieu: Centre de loisirs Sainte-Ursule.
Adresse: 3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7.
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-04-22 au 2015-06-10.
Jour de la semaine: Mercredi.
Heures: 20:15:00 a 21:30:00.
Prix de l'activite: 60.$

- : unit = ()
*)


let filep = open_in "LOISIR_PAYANT.CSV";;

(* Résultat:
val filep : in_channel = <abstr>
*)

let llap = sap#lire_fichier filep "|";;
close_in filep;;

(* Résultat:
val llap : string list list =
  [["ï»¿CODE_SESSION"; "DESCRIPTION"; "DESCRIPTION_ACT"; "DESCRIPTION_NAT";
    "NOM_COUR"; "TARIF_BASE"; "LIEU_1"; "LIEU_2"; "ARRONDISSEMENT";
    "ADRESSE"; "DATE_DEB"; "DATE_FIN"; "JOUR_SEMAINE"; "HEURE_DEBUT";
    "HEURE_FIN"];
   ["H2015"; "Patinage Plus, initiation, 4 ans et +"; "Patinage artistique";
    "Sports de glace"; "Club de patinage artistique de Cap-Rouge"; "85,00";
    "Pavillon de l'education physique et des Sports (PEPS)";
    "Patinoire int. PEPS"; "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
    "2300, Rue de la Terrasse, Quebec (QC) G1V 0A6 "; "2015-01-10";
    "2015-03-28"; "Samedi"; "09:00:00"; "09:55:00"];
   ["E2015"; "Arts plastiques"; "Artisanat"; "Artisanat";
    "Centre Social de la Croix Blanche"; "0,50";
    "Centre social Croix blanche"; "Centre Social Croix Blanche salle 3";
    "Arrondissement de La Cite-Limoilou";
    "960, avenue Dessane, Quebec (QC) G1S 3J9 "; "2015-05-25"; "2015-08-24";
    "Lundi"; "14:00:00"; "16:00:00"];
   ["P2015"; "Activites sociales"; "Activites sociales";
    "Loisirs recreatifs"; "Centre Social de la Croix Blanche"; "0,50";
    "Centre social Croix blanche"; "Centre Social Croix Blanche salle 2";
    "Arrondissement de La Cite-Limoilou";
    "960, avenue Dessane, Quebec (QC) G1S 3J9 "; "2015-06-02"; "2015-08-27";
    "Mardi"; "13:30:00"; "17:00:00"];
   ["E2015"; "Petanque"; "Petanque"; "Loisirs recreatifs";
    "Centre Social de la Croix Blanche"; "0,50";
    "Centre social Croix blanche"; "Centre Social Croix Blanche";
    "Arrondissement de La Cite-Limoilou";
    "960, avenue Dessane, Quebec (QC) G1S 3J9 "; "2015-06-03"; "2015-09-02";
    "Mercredi"; "14:00:00"; "16:00:00"];
   ["H2015"; "Hockey interieur - participation"; "Hockey interieur";
    "Sports et de plein air"; "Loisirs du Faubourg inc."; "130,00";
    "Ecole Joseph-Francois-Perrault";
    "Ecole Joseph-Francois-Perrault gymnase";
    "Arrondissement de La Cite-Limoilou";
    "140, chemin Sainte-Foy, Quebec (QC) G1R 1T2 "; "2015-01-12";
    "2015-05-25"; "Lundi"; "21:00:00"; "22:30:00"];
   ["H2015"; "Danse en ligne, intermediaire"; "Danse en ligne";
    "Arts de la scene"; "Corporation des loisirs Sainte-Ursule Inc.";
    "65,00"; "Centre de loisirs Sainte-Ursule";
    "Salle pol. 208 centre de loisirs Ste-Ursule";
    "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
    "3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7 "; "2015-01-22";
    "2015-04-09"; "Jeudi"; "19:00:00"; "20:15:00"];
   ["H2015"; "Espagnol (conversation), intermediaire 3";
    "Espagnol (conversation)"; "Loisir educatif";
    "Corporation des loisirs Sainte-Ursule Inc."; "90,00";
    "Centre de loisirs Sainte-Ursule";
    "Salle 104 centre de loisirs Ste-Ursule";
    "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
    "3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7 "; "2015-01-26";
    "2015-04-13"; "Lundi"; "13:30:00"; "15:30:00"];
   ["P2015"; "Espagnol (conversation), intermediaire 1";
    "Espagnol (conversation)"; "Loisir educatif";
    "Corporation des loisirs Sainte-Ursule Inc."; "110,00";
    "Centre de loisirs Sainte-Ursule";
    "Salle 120 centre de loisirs Ste-Ursule";
    "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
    "3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7 "; "2015-04-21";
    "2015-05-21"; "Mardi"; "13:00:00"; "16:00:00"];
   ["P2015"; "Danse country, avance"; "Danse country"; "Arts de la scene";
    "Corporation des loisirs Sainte-Ursule Inc."; "45,00";
    "Centre de loisirs Sainte-Ursule";
    "Salle pol. 208 centre de loisirs Ste-Ursule";
    "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
    "3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7 "; "2015-04-22";
    "2015-06-10"; "Mercredi"; "20:15:00"; "21:30:00"];
   ["P2015"; "Danse en ligne, debutant plus"; "Danse en ligne";
    "Arts de la scene"; "Corporation des loisirs Sainte-Ursule Inc.";
    "45,00"; "Centre de loisirs Sainte-Ursule";
    "Salle pol. 208 centre de loisirs Ste-Ursule";
    "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
    "3224, rue Armand-Hamelin, Quebec (QC) G1W 2W7 "; "2015-04-23";
    "2015-06-11"; "Jeudi"; "13:30:00"; "14:45:00"];
   ["H2015"; "Langue anglaise - Debutant"; "Langue anglaise";
    "Loisir educatif"; "Loisirs et Sports Neufchatel inc."; "100,00";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - p. salle SS-102-1";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-01-20";
    "2015-03-24"; "Mardi"; "18:30:00"; "20:30:00"];
   ["H2015"; "Activites physiques - Renards debrouillards";
    "Activites physiques - Renards debrouillards"; "Loisirs pre-scolaire";
    "Loisirs et Sports Neufchatel inc."; "65,00";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - p. salle SS-104-1";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-01-17";
    "2015-03-21"; "Samedi"; "11:00:00"; "11:50:00"];
   ["H2015"; "Danse orientale Baladi - Debutant"; "Danse orientale Baladi";
    "Arts de la scene"; "Loisirs et Sports Neufchatel inc."; "112,00";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - p. salle SS-104-1";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-01-20";
    "2015-04-28"; "Mardi"; "20:30:00"; "21:30:00"];
   ["H2015"; "Karate"; "Karate"; "Sports de combat";
    "Loisirs et Sports Neufchatel inc."; "65,00";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - gymnase simple SS109-2-3-4";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-01-13";
    "2015-04-04"; "Jeudi"; "18:00:00"; "19:00:00"];
   ["H2015"; "Karate"; "Karate"; "Sports de combat";
    "Loisirs et Sports Neufchatel inc."; "52,00";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - gymnase simple SS109-2-3-4";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-01-13";
    "2015-04-04"; "Jeudi"; "19:00:00"; "20:30:00"];
   ["H2015"; "Karate"; "Karate"; "Sports de combat";
    "Loisirs et Sports Neufchatel inc."; "95,00";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - gymnase simple SS109-2-3-4";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-01-13";
    "2015-04-04"; "Jeudi"; "19:00:00"; "20:30:00"];
   ["P2015"; "Activites physiques - P'tits loups filous";
    "Activites physiques - P'tits loups filous"; "Loisirs pre-scolaire";
    "Loisirs et Sports Neufchatel inc."; "55,00";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - p. salle SS105-1";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; "2015-04-11";
    "2015-05-30"; "Samedi"; "10:00:00"; "10:50:00"];
   ["P2015"; "Golf - Niveau 1"; "Golf"; "Sports et de plein air";
    "Loisirs et Sports Neufchatel inc."; "80,00";
    "Centre communautaire Charles-Auguste-Savard";
    "Centre comm. C.-A.-Savard - gymnase simple SS109-2-3-4";
    "Arrondissement des Rivieres";
    "2155, boulevard Bastien, Quebec (QC) G2B 1B8 "; ...];
   ...]
# - : unit = ()
*)

let sap = new sysactivites_payantes "systeme d'activites payantes" "donnees ouvertes de la ville de Quebec";;

sap#charger_donnees_sysactivites "LOISIR_PAYANT.CSV";;

(* Résultat (ça peut prendre quelques secondes pour lire le fichier!):
- : unit = ()
*)

let na = sap#retourner_nbr_activites;;

(* Résultat:
val na : int = 18420
*)

let lap = sap#trouver_selon_arrondissement "Arrondissement Sainte-Foy-Sillery-Cap-Rouge";;
let nap = List.length lap;;

(* Résultat:
val lap : Tp2h15.activite list =
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
# val nap : int = 1818
*)

let ltp = sap#trouver_selon_type "Sports et de plein air";;
let ntp = List.length ltp;;

(* Résultat
val ltp : Tp2h15.activite list =
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
# val ntp : int = 1052
*)

let liste_arrondp = sap#lister_arrondissements;;
let nap = List.length liste_arrondp;;

(*
val liste_arrond : string list =
["Arrondissement Sainte-Foy-Sillery-Cap-Rouge";
   "Arrondissement de La Cite-Limoilou"; "Arrondissement des Rivieres";
   "Arrondissement de La Haute-Saint-Charles";
   "Arrondissement de Charlesbourg"; "Arrondissement de Beauport"]
# val nap : int = 6
*)

let liste_typesp = sap#lister_types_activites;;
let ntp = List.length liste_typesp;;

(*
  ["Sports de glace"; "Artisanat"; "Loisirs recreatifs";
   "Sports et de plein air"; "Arts de la scene"; "Loisir educatif";
   "Loisirs pre-scolaire"; "Sports de combat"; "Activites physiques";
   "Arts visuels"; "Service de garde"; "Programme vacance ete"; "Mieux-etre";
   "Evenement special"; "Activites-Physiques"; "Camp specialise";
   "Loisirs jeunesse"; "Programme d'aide"; "Cours de natation";
   "Clubs de natation"; "Cours de formation aquatiques"; "Formation";
   "Activites aquatiques"; "Metiers d'art"; "Patrimoine";
   "Loisir scientifique"; "Arts de la communication"; "Loisir litteraire";
   "Activites sociales"; "Exposition"; "Activites recreatives";
   "Activites culturelles"]
# val ntp : int = 32
*)

let app = new app_sysactivites "LOISIR_LIBRE.CSV" "LOISIR_PAYANT.CSV";;

(* Résultat (ça peut prendre quelques secondes pour lire le fichier!):
Bienvenue a l'outil de recherche du Centre de Losirs de Quebec
Quel type d'activites vous interessent?
1- Activites gratuites.
2- Activites payantes.
Veuillez choisir une option (1 ou 2):? 2
Recherche dans un systeme d'activites payantes utilisant les donnees ouvertes de la ville de Quebec.
Quel type (nature) d'activites vous interessent?
0 - Sports de glace
1 - Artisanat
2 - Loisirs recreatifs
3 - Sports et de plein air
4 - Arts de la scene
5 - Loisir educatif
6 - Loisirs pre-scolaire
7 - Sports de combat
8 - Activites physiques
9 - Arts visuels
10 - Service de garde
11 - Programme vacance ete
12 - Mieux-etre
13 - Evenement special
14 - Activites-Physiques
15 - Camp specialise
16 - Loisirs jeunesse
17 - Programme d'aide
18 - Cours de natation
19 - Clubs de natation
20 - Cours de formation aquatiques
21 - Formation
22 - Activites aquatiques
23 - Metiers d'art
24 - Patrimoine
25 - Loisir scientifique
26 - Arts de la communication
27 - Loisir litteraire
28 - Activites sociales
29 - Exposition
30 - Activites recreatives
31 - Activites culturelles
32 - Tous 
Veuillez entrer un nombre entre 0 et 32:? 0

Quel arrondissement vous interesse?
0 - Arrondissement Sainte-Foy-Sillery-Cap-Rouge
1 - Arrondissement de La Cite-Limoilou
2 - Arrondissement des Rivieres
3 - Arrondissement de La Haute-Saint-Charles
4 - Arrondissement de Charlesbourg
5 - Arrondissement de Beauport
6 - Tous 
Veuillez entrer un nombre entre 0 et 6:? 0

Voici le resultat de la recherche:
Description: Patinage Plus, initiation, 4 ans et +.
Type: Sports de glace.
Lieu: Pavillon de l'education physique et des Sports (PEPS).
Adresse: 2300, Rue de la Terrasse, Quebec (QC) G1V 0A6 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-10 au 2015-03-28.
Jour de la semaine: Samedi.
Heures: 09:00:00 a 09:55:00.
Prix de l'activite: 85.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Jeudi.
Heures: 17:00:00 a 17:30:00.
Prix de l'activite: 80.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Mardi.
Heures: 16:30:00 a 17:20:00.
Prix de l'activite: 100.$

Description: Patinage artistique - collegial/universitaire.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-06 au 2015-04-15.
Jour de la semaine: Mardi.
Heures: 07:15:00 a 08:15:00.
Prix de l'activite: 75.$

Description: Mise en forme (a l'exterieur de la patinoire).
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-17 au 2015-03-28.
Jour de la semaine: Samedi.
Heures: 10:20:00 a 11:20:00.
Prix de l'activite: 50.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-15 au 2015-04-05.
Jour de la semaine: Dimanche.
Heures: 11:25:00 a 12:20:00.
Prix de l'activite: 90.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-17 au 2015-04-04.
Jour de la semaine: Samedi.
Heures: 11:30:00 a 12:20:00.
Prix de l'activite: 70.$

Description: Mise en forme (a l'exterieur de la patinoire).
Type: Sports de glace.
Lieu: Centre communautaire Noel-Brulart.
Adresse: 1229, avenue du Chanoine-Morel, Quebec (QC) G1S 4B1 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-11 au 2015-03-15.
Jour de la semaine: Dimanche.
Heures: 12:00:00 a 13:15:00.
Prix de l'activite: 50.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Samedi.
Heures: 16:00:00 a 16:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Dimanche.
Heures: 07:30:00 a 08:30:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Vendredi.
Heures: 18:25:00 a 19:10:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Vendredi.
Heures: 16:45:00 a 17:30:00.
Prix de l'activite: 100.$

Description: Patinage Plus, initiation  3 a 5 ans.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-04-11.
Jour de la semaine: Dimanche.
Heures: 09:40:00 a 10:40:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Lundi.
Heures: 16:50:00 a 17:40:00.
Prix de l'activite: 100.$

Description: Patinage Plus, initiation, 3 ans.
Type: Sports de glace.
Lieu: Pavillon de l'education physique et des Sports (PEPS).
Adresse: 2300, Rue de la Terrasse, Quebec (QC) G1V 0A6 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-10 au 2015-03-28.
Jour de la semaine: Samedi.
Heures: 09:00:00 a 09:55:00.
Prix de l'activite: 85.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Lundi.
Heures: 17:00:00 a 19:50:00.
Prix de l'activite: 80.$

Description: Patinage artistique - collegial/universitaire.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-06 au 2015-04-15.
Jour de la semaine: Mercredi.
Heures: 07:15:00 a 08:15:00.
Prix de l'activite: 75.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Samedi.
Heures: 07:00:00 a 11:30:00.
Prix de l'activite: 80.$

Description: Patinage artistique - collegial/universitaire.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-06 au 2015-04-15.
Jour de la semaine: Mardi.
Heures: 07:15:00 a 08:15:00.
Prix de l'activite: 55.$

Description: Patinage artistique - collegial/universitaire.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-06 au 2015-04-15.
Jour de la semaine: Mercredi.
Heures: 07:15:00 a 08:15:00.
Prix de l'activite: 55.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Mardi.
Heures: 18:10:00 a 19:00:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Samedi.
Heures: 17:40:00 a 18:30:00.
Prix de l'activite: 100.$

Description: Patinage Plus, 5 a 17 ans.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-04-05.
Jour de la semaine: Vendredi.
Heures: 19:10:00 a 20:00:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Jeudi.
Heures: 19:00:00 a 19:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Dimanche.
Heures: 07:30:00 a 08:30:00.
Prix de l'activite: 100.$

Description: Ecole de patinage (apprentissage debutant).
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-03-22.
Jour de la semaine: Dimanche.
Heures: 11:40:00 a 12:30:00.
Prix de l'activite: 115.$

Description: Ecole de patinage (apprentissage avance).
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-03-22.
Jour de la semaine: Dimanche.
Heures: 12:40:00 a 13:30:00.
Prix de l'activite: 115.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Jeudi.
Heures: 18:40:00 a 21:10:00.
Prix de l'activite: 80.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-17 au 2015-04-04.
Jour de la semaine: Samedi.
Heures: 11:30:00 a 12:20:00.
Prix de l'activite: 285.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Mardi.
Heures: 17:20:00 a 18:20:00.
Prix de l'activite: 100.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Dimanche.
Heures: 07:00:00 a 10:55:00.
Prix de l'activite: 80.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Mercredi.
Heures: 17:30:00 a 20:20:00.
Prix de l'activite: 80.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-15 au 2015-04-05.
Jour de la semaine: Jeudi.
Heures: 17:35:00 a 18:25:00.
Prix de l'activite: 90.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-15 au 2015-04-05.
Jour de la semaine: Dimanche.
Heures: 11:25:00 a 12:20:00.
Prix de l'activite: 95.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Jeudi.
Heures: 18:10:00 a 19:00:00.
Prix de l'activite: 100.$

Description: Power skate hockey.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-04-05.
Jour de la semaine: Dimanche.
Heures: 09:40:00 a 10:50:00.
Prix de l'activite: 100.$

Description: Power skate hockey.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-07 au 2015-04-08.
Jour de la semaine: Samedi.
Heures: 18:30:00 a 19:20:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Vendredi.
Heures: 16:00:00 a 16:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Samedi.
Heures: 16:50:00 a 17:40:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Lundi.
Heures: 16:00:00 a 16:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Lundi.
Heures: 17:40:00 a 18:30:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Jeudi.
Heures: 16:30:00 a 17:20:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Dimanche.
Heures: 08:30:00 a 09:30:00.
Prix de l'activite: 100.$

Description: Patinage Plus, 5 a 17 ans.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-04-05.
Jour de la semaine: Dimanche.
Heures: 10:50:00 a 11:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-15 au 2015-04-05.
Jour de la semaine: Jeudi.
Heures: 17:35:00 a 18:25:00.
Prix de l'activite: 95.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-17 au 2015-04-04.
Jour de la semaine: Samedi.
Heures: 11:30:00 a 12:20:00.
Prix de l'activite: 65.$


Nombre d'activites trouvees: 46

Voulez-vous trier le resultat de la recherche?
1- Selon la date et l'heure de début.
2- Selon la date et l'heure de fin.
3- Selon le tarif de base.
4- Non, merci!.
Veuillez choisir une option (1 a 4):? 3

Voici la liste triee:

Description: Mise en forme (a l'exterieur de la patinoire).
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-17 au 2015-03-28.
Jour de la semaine: Samedi.
Heures: 10:20:00 a 11:20:00.
Prix de l'activite: 50.$

Description: Mise en forme (a l'exterieur de la patinoire).
Type: Sports de glace.
Lieu: Centre communautaire Noel-Brulart.
Adresse: 1229, avenue du Chanoine-Morel, Quebec (QC) G1S 4B1 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-11 au 2015-03-15.
Jour de la semaine: Dimanche.
Heures: 12:00:00 a 13:15:00.
Prix de l'activite: 50.$

Description: Patinage artistique - collegial/universitaire.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-06 au 2015-04-15.
Jour de la semaine: Mardi.
Heures: 07:15:00 a 08:15:00.
Prix de l'activite: 55.$

Description: Patinage artistique - collegial/universitaire.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-06 au 2015-04-15.
Jour de la semaine: Mercredi.
Heures: 07:15:00 a 08:15:00.
Prix de l'activite: 55.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-17 au 2015-04-04.
Jour de la semaine: Samedi.
Heures: 11:30:00 a 12:20:00.
Prix de l'activite: 65.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-17 au 2015-04-04.
Jour de la semaine: Samedi.
Heures: 11:30:00 a 12:20:00.
Prix de l'activite: 70.$

Description: Patinage artistique - collegial/universitaire.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-06 au 2015-04-15.
Jour de la semaine: Mardi.
Heures: 07:15:00 a 08:15:00.
Prix de l'activite: 75.$

Description: Patinage artistique - collegial/universitaire.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-06 au 2015-04-15.
Jour de la semaine: Mercredi.
Heures: 07:15:00 a 08:15:00.
Prix de l'activite: 75.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Jeudi.
Heures: 17:00:00 a 17:30:00.
Prix de l'activite: 80.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Lundi.
Heures: 17:00:00 a 19:50:00.
Prix de l'activite: 80.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Samedi.
Heures: 07:00:00 a 11:30:00.
Prix de l'activite: 80.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Jeudi.
Heures: 18:40:00 a 21:10:00.
Prix de l'activite: 80.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Dimanche.
Heures: 07:00:00 a 10:55:00.
Prix de l'activite: 80.$

Description: Patinage artistique - junior, interm., senior.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-03 au 2015-04-11.
Jour de la semaine: Mercredi.
Heures: 17:30:00 a 20:20:00.
Prix de l'activite: 80.$

Description: Patinage Plus, initiation, 4 ans et +.
Type: Sports de glace.
Lieu: Pavillon de l'education physique et des Sports (PEPS).
Adresse: 2300, Rue de la Terrasse, Quebec (QC) G1V 0A6 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-10 au 2015-03-28.
Jour de la semaine: Samedi.
Heures: 09:00:00 a 09:55:00.
Prix de l'activite: 85.$

Description: Patinage Plus, initiation, 3 ans.
Type: Sports de glace.
Lieu: Pavillon de l'education physique et des Sports (PEPS).
Adresse: 2300, Rue de la Terrasse, Quebec (QC) G1V 0A6 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-10 au 2015-03-28.
Jour de la semaine: Samedi.
Heures: 09:00:00 a 09:55:00.
Prix de l'activite: 85.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-15 au 2015-04-05.
Jour de la semaine: Dimanche.
Heures: 11:25:00 a 12:20:00.
Prix de l'activite: 90.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-15 au 2015-04-05.
Jour de la semaine: Jeudi.
Heures: 17:35:00 a 18:25:00.
Prix de l'activite: 90.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-15 au 2015-04-05.
Jour de la semaine: Dimanche.
Heures: 11:25:00 a 12:20:00.
Prix de l'activite: 95.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-15 au 2015-04-05.
Jour de la semaine: Jeudi.
Heures: 17:35:00 a 18:25:00.
Prix de l'activite: 95.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Mardi.
Heures: 16:30:00 a 17:20:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Samedi.
Heures: 16:00:00 a 16:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Dimanche.
Heures: 07:30:00 a 08:30:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Vendredi.
Heures: 18:25:00 a 19:10:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Vendredi.
Heures: 16:45:00 a 17:30:00.
Prix de l'activite: 100.$

Description: Patinage Plus, initiation  3 a 5 ans.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-04-11.
Jour de la semaine: Dimanche.
Heures: 09:40:00 a 10:40:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Lundi.
Heures: 16:50:00 a 17:40:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Mardi.
Heures: 18:10:00 a 19:00:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Samedi.
Heures: 17:40:00 a 18:30:00.
Prix de l'activite: 100.$

Description: Patinage Plus, 5 a 17 ans.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-04-05.
Jour de la semaine: Vendredi.
Heures: 19:10:00 a 20:00:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Jeudi.
Heures: 19:00:00 a 19:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Dimanche.
Heures: 07:30:00 a 08:30:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Mardi.
Heures: 17:20:00 a 18:20:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Jeudi.
Heures: 18:10:00 a 19:00:00.
Prix de l'activite: 100.$

Description: Power skate hockey.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-04-05.
Jour de la semaine: Dimanche.
Heures: 09:40:00 a 10:50:00.
Prix de l'activite: 100.$

Description: Power skate hockey.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-07 au 2015-04-08.
Jour de la semaine: Samedi.
Heures: 18:30:00 a 19:20:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Vendredi.
Heures: 16:00:00 a 16:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique, junior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Samedi.
Heures: 16:50:00 a 17:40:00.
Prix de l'activite: 100.$

Description: Patinage artistique, intermediaire.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Lundi.
Heures: 16:00:00 a 16:50:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Lundi.
Heures: 17:40:00 a 18:30:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Jeudi.
Heures: 16:30:00 a 17:20:00.
Prix de l'activite: 100.$

Description: Patinage artistique, senior.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-02 au 2015-03-31.
Jour de la semaine: Dimanche.
Heures: 08:30:00 a 09:30:00.
Prix de l'activite: 100.$

Description: Patinage Plus, 5 a 17 ans.
Type: Sports de glace.
Lieu: Arena Jacques-Cote.
Adresse: 2020, rue Narcisse-Roy, Quebec (QC) G1T 1V2 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-04-05.
Jour de la semaine: Dimanche.
Heures: 10:50:00 a 11:50:00.
Prix de l'activite: 100.$

Description: Ecole de patinage (apprentissage debutant).
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-03-22.
Jour de la semaine: Dimanche.
Heures: 11:40:00 a 12:30:00.
Prix de l'activite: 115.$

Description: Ecole de patinage (apprentissage avance).
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-04 au 2015-03-22.
Jour de la semaine: Dimanche.
Heures: 12:40:00 a 13:30:00.
Prix de l'activite: 115.$

Description: Patinage artistique - initiation PP+.
Type: Sports de glace.
Lieu: Centre Sportif de Sainte-Foy.
Adresse: 930, avenue Roland-Beaudin, Quebec (QC) G1V 4H8 .
Arrondissement: Arrondissement Sainte-Foy-Sillery-Cap-Rouge.
Dates: 2015-01-17 au 2015-04-04.
Jour de la semaine: Samedi.
Heures: 11:30:00 a 12:20:00.
Prix de l'activite: 285.$


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

(* Voir je1.ml pour les autres types d'erreurs *)

try 
  app#lancer_systeme_activites
with
  Failure s -> print_endline s;;

(* Résultat (ça peut prendre quelques secondes pour lire le fichier!):
Bienvenue a l'outil de recherche du Centre de Losirs de Quebec
Quel type d'activites vous interessent?
1- Activites gratuites.
2- Activites payantes.
Veuillez choisir une option (1 ou 2):? 2
Recherche dans un systeme d'activites payantes utilisant les donnees ouvertes de la ville de Quebec.
Quel type (nature) d'activites vous interessent?
0 - Sports de glace
1 - Artisanat
2 - Loisirs recreatifs
3 - Sports et de plein air
4 - Arts de la scene
5 - Loisir educatif
6 - Loisirs pre-scolaire
7 - Sports de combat
8 - Activites physiques
9 - Arts visuels
10 - Service de garde
11 - Programme vacance ete
12 - Mieux-etre
13 - Evenement special
14 - Activites-Physiques
15 - Camp specialise
16 - Loisirs jeunesse
17 - Programme d'aide
18 - Cours de natation
19 - Clubs de natation
20 - Cours de formation aquatiques
21 - Formation
22 - Activites aquatiques
23 - Metiers d'art
24 - Patrimoine
25 - Loisir scientifique
26 - Arts de la communication
27 - Loisir litteraire
28 - Activites sociales
29 - Exposition
30 - Activites recreatives
31 - Activites culturelles
32 - Tous 
Veuillez entrer un nombre entre 0 et 32:? 33
Nombre incorrect, veuillez recommencer!
- : unit = ()
*)
