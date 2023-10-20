#!/bin/bash

 

# Menu principal

while true; do

    clear
    echo "                                   Gestionnaire de fichiers           "
    echo "                                                               "
    echo "                                   *Menu Principal*"
    echo "                                                               "
    echo "                           1. Créer un répertoire"
    echo "                           2. Créer un fichier"
    echo "                           3. Afficher le contenu d'un répertoire"
    echo "                           4. Afficher le contenu d'un fichier"
    echo "                           5. Déplacer un fichier ou répertoire"
    echo "                           6. Copier un fichier ou répertoire"
    echo "                           7. Renommer un fichier ou répertoire"
    echo "                           8. Supprimer un fichier ou répertoire"
    echo "                           9. Rechercher un fichier"
    echo "                           10. Compter les fichiers dans un répertoire"
    echo "                           0. Quitter"
    echo "                                                               "

 

    read -p "                           Choisissez une option : " choix

 

    case $choix in

        1)

            read -p "Entrez le nom du repertoire que vous souhaitez créer: : " nom_repertoire
            mkdir "$nom_repertoire"
            echo "Répertoire '$nom_repertoire' créé."
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
           2)
            
   	        read -p "Entrez le nom du fichier que vous souhaitez créer: " nom_fichier1
    	    repertoire_cible="/home/wail-8"       
            echo "Voici ci-dessous les repertoires et les fichiers disponibles :"
            ls "$repertoire_cible"
            read -p "Où souhaitez-vous le placer: " repertoire_selec
    
            if [ -d "$repertoire_selec" ]; then
            chemin_complet1="$repertoire_selec/$nom_fichier1"
            touch "$chemin_complet1"
            echo "Le fichier $nom_fichier1 a été créé dans le répertoire $repertoire_selec."
            break
            else
            echo "Le répertoire n'existe pas. Veuillez choisir un répertoire valide."
            fi
            
            read -p "Appuyez sur Entrée pour continuer..."
            ;;        
	
         3)
                    
            echo "Voici ci-dessous les repertoires et les fichiers disponibles :"
            repertoire_cible="/home/wail-8"
            ls "$repertoire_cible"
            read -p "Veuillez sélectionner le répertoire que vous souhaitez afficher : " repertoire1

    
            if [ -d "$repertoire1" ]; then
            ls "$repertoire1"
            read -p "Appuyez sur Entrée pour continuer..."
            elif [ -f "$fichier" ]; then
            echo "Le document selectionné n'est pas un répertoire."
            else
            cho "le repertoire n'existe pas"
            fi
                
            read -p "Appuyez sur Entrée pour continuer..."   
            ;;

	
      	4)
            echo "voici ci-dessous les repertoires et fichiers disponnibles"
            repertoire_cible="/home/wail-8"
            ls "$repertoire_cible"
            read -p "veuillez selectionner le fichier lequel vous souhaitez afficher : " fichier
            if [ -f "$fichier" ]; then
            if [ -s "$fichier" ]; then
            cat "$fichier"
            read -p "Appuyez sur Entrée pour continuer..."
            else
            echo "Le fichier est vide."
            fi
            else
            echo "Le document selectionne n'est pas un fichier."
            fi
            ;;
 
  
     	5)
            echo "Voici ci-dessous les repertoires et les fichiers disponibles :"
            repertoire_cible="/home/wail-8"
            ls "$repertoire_cible"
            read -p "Veuillez sélectionner le repertoire ou le fichier que vous souhaitez déplacer : " source

            if [ -d "$source" ]; then
            read -p "Veuillez sélectionner la destination du déplacement : " destination
            if [ -d "$destination" ]; then
            mv "$source" "$destination"
            echo "Déplacement effectué avec succès."
            else
            echo "La destination n'est pas un répertoire valide."
            fi
            else
            echo "Le fichier sélectionné n'existe pas."
            fi
            read -p "Appuyez sur Entrée pour continuer..."
            ;;


         6)
            echo "Voici ci-dessous les repertoires et les fichiers disponibles :"
            repertoire_cible="/home/wail-8"
            ls "$repertoire_cible"
            read -p "Veuillez sélectionner le repertoire ou le fichier que vous souhaitez copier : " origine
            read -p "Veuillez saisir le nouveau nom de votre copie : " copie
            cp "$repertoire_cible/$origine" "$copie"
            echo "Document copié avec succès."
            read -p "Appuyez sur Entrée pour continuer..."


            ;;

         7)
            echo "Voici ci-dessous les repertoires et les fichiers disponibles :"
            repertoire_cible="/home/wail-8"
            ls "$repertoire_cible"
            read -p "Veuillez sélectionner le repertoire ou le fichier que vous souhaitez renommer : " ancien_nom
            if [ -e "$ancien_nom" ]; then
            read -p "Veuillez saisir le nouveau nom : " nouveau_nom
            if [ -e "$nouveau_nom" ]; then
            echo "Le nom saisi existe déjà."
            else
            mv "$ancien_nom" "$nouveau_nom"
            echo "Document renommé avec succès."
            fi
            else
            echo "Le document n'existe pas."
            fi      
            read -p "Appuyez sur Entrée pour continuer..."

            ;;



            8)
            echo "Voici ci-dessous les repertoires et les fichiers disponibles :"
            repertoire_cible="/home/wail-8"
            ls "$repertoire_cible"
            read -p "Veuillez sélectionner le repertoire iu le fichier que vous souhaitez supprimer : " supprime

            if [ -e "$supprime" ]; then
            read -p "Êtes-vous sûr de vouloir supprimer '$supprime' ? (oui/non) " confirmation
            if [ "$confirmation" = "oui" ]; then
            rm -r "$supprime"
            echo "Document supprimé avec succès."
            else
            echo "Suppression annulée."
            fi
            else 
            echo "Le document sélectionné n'existe pas."
            fi

            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        9)
            echo "Voici ci-dessous les repertoires fichiers disponibles :"
            repertoire_cible="/home/wail-8"
            ls "$repertoire_cible"
            read -p "Veuillez sélectionner le répertoire dans lequel vous souhaitez effectuer la recherche : " repertoire
            if [ -e "$repertoire" ]; then
            read -p "Veuillez saisir le nom du fichier que vous souhaitez rechercher : " nom_fichier
            resultat_recherche=$(find "$repertoire" -type f -name "$nom_fichier")
            if [ -n "$resultat_recherche" ]; then
            echo "Résultat de la recherche :"
            echo "$resultat_recherche"
            else
            echo "Le fichier '$nom_fichier' n'existe pas dans le répertoire spécifié."
            fi
            else 
            echo "Le répertoire saisi n'existe pas."
            fi
            read -p "Appuyez sur Entrée pour continuer..."
            ;;

        10)
            echo "Voici ci-dessous les fichiers disponibles :"
            repertoire_cible="/home/wail-8"
            ls "$repertoire_cible"
            read -p "Répertoire à compter : " repertoire
            if [ -e "$repertoire" ]; then
            nombre_fichiers=$(find "$repertoire" -type f | wc -l)
            echo "Il y a $nombre_fichiers fichiers dans '$repertoire'."
            else 
            echo "le repertoire saisi n'existe pas "
            fi
            read -p "Appuyez sur Entrée pour continuer..."
            ;;

        0)
            echo "                           Merci pour avoir utilisé notre programme !"
            exit 0
            ;;

        *)

                                         echo "Option non valide. Veuillez réessayer."
                                         read -p "Appuyez sur Entrée pour continuer..."

            ;;
    esac
done

