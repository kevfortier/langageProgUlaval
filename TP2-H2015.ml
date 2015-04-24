(***********************************************************************)
(* Langages de Programmation: IFT 3000 NRC 11775                       *)
(* TP2 HIVER 2015. Date limite: Vendredi 24 avril à 17h                *)
(* Implanter un système permettant de chercher des activités gratuites *)
(* et payantes en utilisant les données ouvertes de la ville de Québec *)
(***********************************************************************)
(*                                                                     *)
(* NOM: Fortier                     PRÉNOM: Kevin                      *)
(* MATRICULE: 111 119 245           PROGRAMME: _______________________ *)
(*                                                                     *)
(***********************************************************************)
(*                                                                     *)
(* NOM: Desbiens                    PRÉNOM: Alexandre                  *)
(* MATRICULE: 111 105 772           PROGRAMME: IFT____________________ *)
(*                                                                     *)
(***********************************************************************)

#load "unix.cma";; (* Charger le module unix *)
#load "str.cma";;  (* Charger le module Str  *)

(* Charger la signature du système d'activités *)
#use "TP2-SIG-H2015.mli";;

(********************************************************************) 
(* Implantation du système en utilisant                             *)
(* la programmation orientée objet                                  *) 
(********************************************************************)

module Tp2h15 : TP2H15 = struct

  open List
  open Str

  (* Fonctions manipulant les listes et/ou les chaînes de caractères *)

  (* appartient : 'a -> 'a list -> bool                   *)
  (* Retourner si un élément existe ou non dans une liste *)

  let appartient e l = exists (fun x -> x = e) l

  (* enlever : 'a -> 'a list -> 'a list *)
  (* Enlever un élément dans une liste  *)

  let enlever e l = 
    let (l1, l2) = partition (fun x -> x = e) l
    in l2

  (* remplacer : 'a -> 'a -> 'a list -> 'a list       *)
  (* Remplacer un élément par un autre dans une liste *)

  let remplacer e e' l =
    map (fun x -> (if (x = e) then e' else x)) l 

  (* uniques : string list -> string list                         *)
  (* Retourner une liste ne contenant que des éléments uniques    *) 
  (* Les chaînes vides sont également enlevées de la liste        *)
  (* ainsi que les espaces inutiles avant et/ou après les chaînes *)

  let uniques liste =
    let res = ref [] in
    let rec fct l = match l with
     | [] -> !res
     | x::xs -> if (not (mem x !res) && (x <> "")) then res := (!res)@[String.trim x]; fct xs
    in fct liste

  (* decouper_chaine : string -> string -> string list                          *)
  (* Retourner une liste en découpant une chaîne selon un séparateur (p.ex "|") *)

  let decouper_chaine chaine separateur = split (regexp separateur) chaine

  (* formater_chaine : string list -> string                                  *)
  (* Construire une chaîne selon un certain formatage pour les besoins du TP  *)

  let formater_chaine liste = 
    let res = ref "" in
    let n = (length liste) - 1  in
      for i = 0 to n do
	res := !res ^ ((string_of_int i) ^ " - " ^ (nth liste i) ^ "\n")
      done;
      res := !res ^ ((string_of_int (n+1)) ^ " - Tous \n"); !res

  (* retourner_epoque_secondes : string -> string -> string -> string -> float                 *)
  (* Retourne le nombre de secondes depuis l'année 1970 jusqu'à une date et une heure précises *)
  (* Exemple: let ep = retourner_epoque_secondes "2015-03-31" "-" "15:30:00" ":";;             *)
  (* val ep : float = 1427830200.                                                              *)

  let retourner_epoque_secondes (date:string) (sdate: string) (hms:string) (shms: string) =
    let d = decouper_chaine date sdate in
    let yyyy = int_of_string (nth d 0) and mm = int_of_string (nth d 1) and dd = int_of_string (nth d 2) in
    let tmp = decouper_chaine hms shms in
    let h = int_of_string (nth tmp 0) and m = int_of_string (nth tmp 1) and s = int_of_string (nth tmp 2) in
    let eg = {Unix.tm_sec = s; tm_min = m; tm_hour = h; tm_mday = dd; tm_mon = mm-1;
	      tm_year = yyyy-1900; tm_wday = 0; tm_yday = 0; tm_isdst = false} in fst(Unix.mktime eg)

  (* Classes du TP *)

  class activite (lch:string list) (ta:bool) = 
    object(self)
      val type_activite = ta
      val code_session : string = nth lch 0
      val description : string = nth lch 1
      val description_act : string = nth lch 2
      val description_nat : string = nth lch 3
      val nom_cour : string = nth lch 4
      val tarif_base : float = if ta then 0.0 else float_of_string (replace_first (regexp ",") "." (nth lch 5))
      val lieu_1 : string = if ta then nth lch 5 else nth lch 6
      val lieu_2 : string = if ta then nth lch 6 else nth lch 7
      val arrondissement : string = if ta then nth lch 7 else nth lch 8
      val adresse : string = if ta then nth lch 8 else nth lch 9
      val date_deb : string = if ta then nth lch 9 else nth lch 10
      val date_fin : string = if ta then nth lch 10 else nth lch 11
      val jour_semaine : string = if ta then nth lch 11 else nth lch 12
      val heure_deb : string = if ta then nth lch 12 else nth lch 13
      val heure_fin : string = if ta then nth lch 13 else nth lch 14
      method get_type_activite = type_activite
      method get_description = description
      method get_lieu_1 = lieu_1
      method get_adresse = adresse
      method get_jour_semaine = jour_semaine
      method get_arrondissement = arrondissement
      method get_description_nat = description_nat
      method get_tarif_base = tarif_base
      method get_date_deb = date_deb
      method get_heure_deb = heure_deb
      method get_date_fin = date_fin
      method get_heure_fin = heure_fin

      (* Méthode à implanter *)
      
      (* afficher_activite : unit *)
	  (* Affiche true au lieu du type -- À MODIFIER *)
      method afficher_activite =
	    print_string ("Description: " ^ self#get_description ^
		  "\nType: " ^ self#get_description_nat ^ 
		  "\nLieu: " ^ self#get_lieu_1 ^
		  "\nAdresse: " ^ self#get_adresse ^ 
		  "\nArrondissement: " ^ self#get_arrondissement ^
		  "\nDates:" ^ self#get_date_deb ^  " au " ^ self#get_date_fin ^
		  "\nJour de la semaine: " ^ self#get_jour_semaine ^
		  "\nHeures: " ^ self#get_heure_deb ^ " au " ^ self#get_heure_fin ^ "\n\n")

    end

  class sysactivites (od:string) =
    object(self)
      val origine_donnees : string = od
      val mutable liste_activites : activite list = []
      method get_origine_donnees = origine_donnees
      method get_liste_activites = liste_activites
      method set_liste_activites (la:activite list) = liste_activites <- la
      method activite_existe (a:activite) = appartient a liste_activites
      method retourner_nbr_activites = length liste_activites

      (* Méthodes à implanter *)
      
      (* ajouter_activite : activite -> unit *)
      method ajouter_activite (a:activite) = self#set_liste_activites (liste_activites @ [a]);

      (* supprimer_activite : activite -> unit *)
      method supprimer_activite (a:activite) = 
	    if self#activite_existe a then 
	      ignore (enlever a self#get_liste_activites)
	    else failwith ("Le systeme d'activites ne contient pas cette activite")

      (* afficher_systeme_activites : unit *)
      method afficher_systeme_activites = match self#get_liste_activites with
	    | [] -> failwith "Le systeme d'activites est vide"
		| _ -> List.iter (fun (x:activite) -> x#afficher_activite) self#get_liste_activites

      (* lire_fichier : in_channel -> string -> string list list *)
	  method lire_fichier (flux:in_channel) (separateur:string) = 
	    let lines = ref [] in
		  try
		    while true; do
		      lines := decouper_chaine (input_line flux) separateur :: !lines
		    done; []
		  with End_of_file ->
		    List.rev !lines

      (* trouver_selon_arrondissement : string -> activite list *)
      method trouver_selon_arrondissement (na:string) = match self#get_liste_activites with
	    | [] -> failwith "Le systeme d'activites est vide"
	    | _ -> List.filter (fun (x:activite) -> x#get_arrondissement = na) self#get_liste_activites

      (* trouver_selon_type : string -> activite list *)
      method trouver_selon_type (ta:string) = match self#get_liste_activites with
	    | [] -> failwith "Le systeme d'activites est vide"
	    | _ -> List.filter (fun (x:activite) -> x#get_description_nat = ta) self#get_liste_activites

      (* lister_arrondissements : string list *)
      method lister_arrondissements = match self#get_liste_activites with
	    | [] -> failwith "Le systeme d'activites est vide"
	    | _ -> uniques (List.map (fun (x:activite) -> x#get_arrondissement) self#get_liste_activites)
      
      (* lister_types_activites : string list *)
      method lister_types_activites =match self#get_liste_activites with
	    | [] -> failwith "Le systeme d'activites est vide"
	    | _ -> uniques (List.map (fun (x:activite) -> x#get_description_nat) self#get_liste_activites)

    end

  class sysactivites_gratuites (au:string) (od:string) =
    object(self)
      inherit sysactivites od as parent
      val systeme_utilisees : string = au
      method get_systeme_utilisees = systeme_utilisees

      (* Méthodes à implanter *)

      (* ajouter_liste_activites : string list list -> unit *)
      method ajouter_liste_activites (lla:string list list) = 
	    parent#set_liste_activites (List.map (fun (x:string list) -> (new activite x true)) lla)
	
      (* charger_donnees_sysactivites : string -> unit *)
      method charger_donnees_sysactivites (fichier:string) = 
	    let liste = parent#lire_fichier (open_in fichier) "|" in
	      self#ajouter_liste_activites (enlever (nth liste 0) liste)

      (* trier_activites : int -> unit *)
      method trier_activites (ordre:int) = match ordre with
        |1 -> parent#set_liste_activites (List.sort (fun (x:activite) (y:activite) -> 
		  compare (retourner_epoque_secondes x#get_date_deb "-" x#get_heure_deb ":") (retourner_epoque_secondes y#get_date_deb "-" y#get_heure_deb ":")) parent#get_liste_activites)
        |2 -> parent#set_liste_activites (List.sort (fun (x:activite) (y:activite) -> 
		  compare (retourner_epoque_secondes x#get_date_fin "-" x#get_heure_fin ":") (retourner_epoque_secondes y#get_date_fin "-" y#get_heure_fin ":")) parent#get_liste_activites)
        |3 -> ()
        |_ -> failwith "trier_activites: ordre incorrect!"

      initializer print_string ("Recherche dans un " ^ (self#get_systeme_utilisees) ^ 
				" utilisant les " ^ (parent#get_origine_donnees) ^ ".");
				print_newline()
    end

  class sysactivites_payantes (au:string) (od:string) =
    object(self)
      inherit sysactivites od as parent
      val systeme_utilisees : string = au
      method get_systeme_utilisees = systeme_utilisees

      (* Méthodes à implanter *)

      (* ajouter_liste_activites : string list list -> unit *)
      method ajouter_liste_activites (lla:string list list) =
	    parent#set_liste_activites (List.map (fun (x:string list) -> (new activite x false)) lla)

      (* charger_donnees_sysactivites : string -> unit *)
      method charger_donnees_sysactivites (fichier:string) = 
		let liste = parent#lire_fichier (open_in fichier) "|" in
	      self#ajouter_liste_activites (enlever (nth liste 0) liste)

      (* trier_activites : int -> unit *)
      method trier_activites (ordre:int) = match ordre with
        |1 -> parent#set_liste_activites (List.sort (fun (x:activite) (y:activite) -> 
		  compare (retourner_epoque_secondes x#get_date_deb "-" x#get_heure_deb ":") (retourner_epoque_secondes y#get_date_deb "-" y#get_heure_deb ":")) parent#get_liste_activites)
        |2 -> parent#set_liste_activites (List.sort (fun (x:activite) (y:activite) -> 
		  compare (retourner_epoque_secondes x#get_date_fin "-" x#get_heure_fin ":") (retourner_epoque_secondes y#get_date_fin "-" y#get_heure_fin ":")) parent#get_liste_activites)
        |3 -> ()
        |_ -> failwith "trier_activites: ordre incorrect!"
 
      initializer print_string ("Recherche dans un " ^ (self#get_systeme_utilisees) ^ 
		" utilisant les " ^ (parent#get_origine_donnees) ^ ".");
		print_newline()
    end

  class app_sysactivites (nfa:string) (nfp:string) =
    object(self)
      val nom_fichier_agratuites = nfa
      val nom_fichier_apayantes = nfp

      (* Méthodes à implanter *)

	  (* A VERIFIER *)
      (* sauvegarder_liste_activites : activite list -> out_channel -> unit *)      
      method sauvegarder_liste_activites (la:activite list) (flux:out_channel) = 
	    match la with
		  | [] -> failwith "La liste d'activites est vide"
		  | _ -> let n = (length la) in
		    for i = 0 to n do
			  let e = nth la i in
			    output_string flux ("Description: " ^ e#get_description ^
		          "\nType: " ^ string_of_bool e#get_type_activite ^ 
		          "\nLieu: " ^ e#get_lieu_1 ^
		          "\nAdresse: " ^ e#get_adresse ^ 
		          "\nArrondissement: " ^ e#get_arrondissement ^
		          "\n:Dates:" ^ e#get_date_deb ^  " au " ^ e#get_date_fin ^
		          "\nJour de la semaine: " ^ e#get_jour_semaine ^
		          "\nHeures: " ^ e#get_heure_deb ^ " au " ^ e#get_heure_fin ^ "\n\n");
			done
			    

	  (* A FAIRE *)
      (* lancer_systeme_activites : unit *) 
      method lancer_systeme_activites = 
            print_string "Bienvenue a l'outil de recherche du Centre de Losirs de Quebec\n";
	    print_string "Quel type d'activites vous interessent?\n1- Activites gratuites.\n2- Activites payantes.\n";
	    print_string "Veuillez choisir une option (1 ou 2):? ";
	    let choix = read_int() in
	      match choix with
	      |1 -> let sag = new sysactivites_gratuites "systeme d'activites gratuites" "donnees ouvertes de la ville de Quebec" in let _ = sag#charger_donnees_sysactivites nom_fichier_agratuites in
          let lst_type = sag#lister_types_activites in
          print_string ("Quel type (nature) d'activites vous interessent?\n");
          print_string (formater_chaine lst_type);
          print_string ("\n\nVeuillez entrer un nombre entre 0 et " ^ string_of_int (length lst_type) ^ "? ");
          let choix = read_int() in
          if choix >= 0 && choix <= length lst_type then 
            let strType = nth lst_type choix in
            print_string ("\n\nQuel arrondissement vous interesse:?");
            let lst_arr = sag#lister_arrondissements in
            print_string (formater_chaine lst_arr);
            print_string ("Veuillez entrer un nombre entre 0 et " ^ string_of_int (length lst_arr) ^ " :");
            let choix = read_int() in
            if choix >= 0 && choix <= length lst_arr then
              print_string ("Voici le resultat de la recherche:\n");
              let strArr = nth lst_arr choix in
              if strType == "Tous" && strArr == "Tous" then
                sag#afficher_systeme_activites
              else if strType == "Tous" then begin
                sag#set_liste_activites (sag#trouver_selon_arrondissement strArr);
				sag#afficher_systeme_activites
				end
              else if strArr == "Tous" then begin
                sag#set_liste_activites (sag#trouver_selon_type strType);
				sag#afficher_systeme_activites
				end
              else begin
                sag#set_liste_activites (sag#trouver_selon_arrondissement strArr);
                sag#set_liste_activites (sag#trouver_selon_type strType);
				sag#afficher_systeme_activites
				end
            else
              print_string "Erreur"
          
	      |2 -> let sap = new sysactivites_payantes "systeme d'activites payantes" "donnees ouvertes de la ville de Quebec" in let _ = sap#charger_donnees_sysactivites nom_fichier_apayantes in
          let lst_type = sap#lister_types_activites in
          print_string ("Quel type (nature) d'activites vous interessent?\n");
          print_string (formater_chaine lst_type);
          print_string ("\n\nVeuillez entrer un nombre entre 0 et " ^ string_of_int (length lst_type) ^ "? ");
          let choix = read_int() in
          if choix >= 0 && choix <= length lst_type then 
            if choix == length lst_type then
            let strType = nth lst_type choix in
            print_string ("\n\nQuel arrondissement vous interesse:?");
            let lst_arr = sap#lister_arrondissements in
            print_string (formater_chaine lst_arr);
            print_string ("Veuillez entrer un nombre entre 0 et " ^ string_of_int (length lst_arr) ^ " :");
            let choix = read_int() in
            if choix >= 0 && choix <= length lst_arr then
              print_string ("Voici le resultat de la recherche:\n");
              let strArr = nth lst_arr choix in
              if strType == "Tous" && strArr == "Tous" then
                sap#afficher_systeme_activites
              else if strType == "Tous" then begin
                sap#set_liste_activites (sap#trouver_selon_arrondissement strArr);
				sap#afficher_systeme_activites
				end
              else if strArr == "Tous" then begin
                sap#set_liste_activites (sap#trouver_selon_type strType);
				sap#afficher_systeme_activites
				end
              else begin
                sap#set_liste_activites (sap#trouver_selon_arrondissement strArr);
                sap#set_liste_activites (sap#trouver_selon_type strType);
				sap#afficher_systeme_activites
				end
            else
              print_string "Erreur"
	      |_ -> print_string "Erreur"


      initializer self#lancer_systeme_activites
    end
end