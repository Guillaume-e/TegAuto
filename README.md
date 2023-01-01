# TegAuto

## Le Projet

Ce projet a été réalisé par 3 étudiants en Flutter.
C'est une application permettant la vente de voiture.
Elle est disponible en format Web, IOS et Android.

Sur cette application, vous pouvez :
- Acheter des nouvelles voitures
- Mettre des voitures en vente
- Gérer votre profil
- Ajouter des voitures en favoris

## Architecture

Tous nos fichiers se trouvent dans le dossier **lib/**.

Le dossier **lib/widgets** contient tous les petits composants de notre applications réutilisables au besoin.

Le dossier **lib/models** répertorie les classes que nous utiliserons dans l'application. Ces classes nous permettent de gérer l'utilisateur ou encore la liste des voiture.

Le dossier **lib/pages** regroupe toutes les pages de notre application.

Le dossier **lib/pages/authentication** gère tous les composants propres à la connexion et création de compte. Ces composants ne seront pas utilisés dans d'autres pages de l'application.

## Libraries externes utilisées

Pour ce projet, nous avons utilisés les libraries externes suivantes:
- blackfoot_flutter_lint: Bonnes pratiques
- provider : Gestion d'état
- firebase_auth: Authentification

## Déploiement local android et web sur linux et mac os

 outils version :
    Flutter : 3.3.7+ channel stable
    Android SDK 31.0+
    Visual Studio Code

**Sur Vscode**
Depuis la racine du dossier **teg_auto** :
* Lancer la commande **flutter doctor** pour voir si tous les packages sont installés avec la bonne version.

* Lancer la commande **flutter clean** entre chaque changement de plateform.

* Lancer la commande **flutter pub get** pour installer les packages nécessaires.

* Choisir un émulateur web, android ou téléphone, taper la commander **flutter run** pour build le projet et lancer l'application sur l'émulateur chosi.

## Déploiement local ios sur mac os

Outils version :
    Flutter : 3.3.7+ channel stable
    Xcode : 14.2
    Cocoapods : 1.11.3
    ios : 16.2

**Sur Xcode**
Ouvrir le dossier **teg_auto/ios** dans Xcode
Lancer le build en cliquant sur le bouton run


**Sur Vscode**
Depuis la racine du dossier **teg_auto** :
* Lancer la commande **flutter doctor** pour voir si tous les packages sont installés avec la bonne version.

* Lancer la commande **flutter pub get** pour installer les packages nécessaires.

* Choisir le simulateur iphone (ios 16.2) , taper la commander **flutter run** pour build le projet et lancer l'application
