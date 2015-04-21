(***********************************************************************)
(* Langages de Programmation: IFT 3000 NRC 11775                       *)
(* TP2 HIVER 2015. Date limite: Vendredi 24 avril à 17h                *) 
(* Implanter un système permettant de chercher des activités gratuites *)
(* et payantes en utilisant les données ouvertes de la ville de Québec *)
(***********************************************************************) 
(* Signature du TP2                                                    *)  
(***********************************************************************)

module type TP2H15 = sig

  class activite : string list -> bool ->
    object
      val type_activite : bool
      val code_session : string
      val description : string
      val description_act : string
      val description_nat : string
      val nom_cour : string
      val tarif_base : float
      val lieu_1 : string
      val lieu_2 : string
      val arrondissement : string
      val adresse : string
      val date_deb : string
      val date_fin : string
      val jour_semaine : string
      val heure_deb : string
      val heure_fin : string
      method get_type_activite : bool
      method get_description : string
      method get_lieu_1 : string
      method get_adresse : string
      method get_jour_semaine : string
      method get_arrondissement : string
      method get_description_nat : string
      method get_tarif_base : float
      method get_date_deb : string
      method get_heure_deb : string
      method get_date_fin : string
      method get_heure_fin : string
      method afficher_activite : unit
    end

  class sysactivites : string ->
    object
      val origine_donnees : string
      val mutable liste_activites : activite list
      method get_origine_donnees : string
      method get_liste_activites : activite list
      method set_liste_activites : activite list -> unit
      method activite_existe : activite -> bool
      method retourner_nbr_activites : int
      method ajouter_activite : activite -> unit
      method supprimer_activite : activite -> unit
      method afficher_systeme_activites : unit
      method lire_fichier : in_channel -> string -> string list list
      method trouver_selon_arrondissement : string -> activite list      
      method trouver_selon_type : string -> activite list
      method lister_arrondissements : string list
      method lister_types_activites : string list
    end

  class sysactivites_gratuites : string -> string ->
    object
      inherit sysactivites
      val systeme_utilisees : string
      method get_systeme_utilisees : string
      method ajouter_liste_activites : string list list -> unit
      method charger_donnees_sysactivites : string -> unit
      method trier_activites : int -> unit
    end

  class sysactivites_payantes : string -> string ->
    object
      inherit sysactivites
      val systeme_utilisees : string
      method get_systeme_utilisees : string
      method ajouter_liste_activites : string list list -> unit
      method charger_donnees_sysactivites : string -> unit
      method trier_activites : int -> unit
    end

  class app_sysactivites : string -> string ->
    object
      val nom_fichier_agratuites : string
      val nom_fichier_apayantes : string
      method sauvegarder_liste_activites : activite list -> out_channel -> unit
      method lancer_systeme_activites : unit
    end

end
