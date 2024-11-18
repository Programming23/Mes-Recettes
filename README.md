# Mes Recettes - Application de Recherche de Recettes

## Introduction

**Mes Recettes** est une application qui aide les utilisateurs à rechercher des recettes de cuisine et à les afficher de manière détaillée et facile à comprendre. L'application contient plusieurs pages, telles que la page de recherche de recettes et la page des différentes catégories, qui comprennent un large éventail de recettes classées par catégorie. Les utilisateurs peuvent sauvegarder leurs recettes préférées et y accéder plus tard. L'application aide les utilisateurs à apprendre l'art de la cuisine, à varier les repas et à passer du temps agréable dans la cuisine.



## Sources des Graphiques

Les images utilisées dans l'application sont principalement le logo de l'application, qui a été modifié légèrement à partir de :  
[Logo original sur Pinterest](https://www.pinterest.com/pin/156289049557925409/)

La police utilisée est **Cairo**, disponible ici :  
[Cairo sur Google Fonts](https://fonts.google.com/specimen/Cairo)

Les icônes utilisées dans l'application sont spécifiques à Flutter.

## À propos des données

Dans cette application, vous pouvez soit travailler avec une API, soit écrire les données directement dans le fichier **lib/constants/data.dart**.

### Structure des données des recettes

Les données des recettes doivent contenir les champs suivants :

- **id** : Identifiant unique pour chaque recette (ne doit pas être dupliqué).
- **name** : Nom de la recette.
- **description** : Description de la recette.
- **category** : Catégorie dans laquelle la recette se trouve. Les catégories doivent être définies dans le fichier **lib/constants/data.dart**.
- **time** : Temps nécessaire pour la préparation de la recette.
- **imageUrl** : URL de l'image ou chemin relatif de l'image.
- **ingredients** : Liste des ingrédients nécessaires pour la recette.
- **steps** : Étapes de préparation de la recette.

## Préparation de l'application

Avant de modifier l'application, assurez-vous de préparer l'environnement de développement Flutter, d'installer toutes les bibliothèques et dépendances nécessaires, ainsi que de configurer les sources de données et d'avoir un serveur API pour stocker les recettes si nécessaire.

## Modification de l'application

L'application peut être modifiée en changeant les couleurs, les polices et les icônes utilisées.

- Vous pouvez changer la police en enregistrant la police de votre choix dans le dossier **assets** sous le nom **font.ttf**.
- Les images peuvent être modifiées et téléchargées dans le dossier **assets**.
- Les couleurs peuvent être modifiées dans le fichier **lib/constants/theme.dart**, en modifiant la variable nommée **theme**.

### Modification des données des recettes

Les textes des recettes peuvent être modifiés directement dans le fichier **data.dart**, où vous pouvez mettre à jour les informations des recettes et des catégories.

## Rôles des fichiers

Pour modifier l'application, vous devrez travailler avec les fichiers présents dans le dossier **lib**. Voici un aperçu des rôles des fichiers importants :

### Dossier `constants`
- **numbers.dart** : Permet de modifier la durée pendant laquelle la page de chargement reste affichée en secondes et les dimensions des images.
- **data.dart** : Contient les données des recettes et des catégories si vous ne souhaitez pas utiliser l'API. Même si vous utilisez une API, les catégories doivent être définies dans ce fichier. Si vous souhaitez ajouter une nouvelle catégorie, vous devez ajouter le nom et la couleur.
- **texts.dart** : Permet de changer les chemins des images et les textes de l'application.
- **theme.dart** : Permet de modifier les couleurs, la couleur de fond, la taille des polices, etc.

### Dossier `screens`
Ce dossier contient les pages principales de l'application. Vous trouverez six fichiers pour sept pages (la page principale et la page des favoris partagent la même interface) :

- **about_us.dart** : Fichier pour la page "À propos".
- **loading_page.dart** : Fichier pour la page de chargement.
- **page.dart** : Fichier pour la page principale et des favoris.
- **recipe_page.dart** : Fichier pour la page de détails de la recette.
- **categories.dart** : Fichier pour la page des catégories de recettes.
- **search.dart** : Fichier pour la page de recherche des recettes.

### Dossier `widgets`
Les petites interfaces de chaque page sont divisées pour faciliter la modification de l'application :

- **recipe_page** : Ce dossier contient deux fichiers spécifiques à la page de recette :
  - **top_recipe.dart** : Affiche l'icône et l'image en haut de la page.
  - **recipe_details.dart** : Affiche les détails de la recette.
