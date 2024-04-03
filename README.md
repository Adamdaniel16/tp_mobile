# TP Noté DÉVELOPPEMENT MOBILE - Et si on jouait ?

Membres:
- BIN ZULKORNAIN Adam Daniel
- LOISEAU Yohann

## Conseil
- Il vaut mieux utiliser Emulator pour que tout fonctionne correctement

## Présentation du jeu

- But du jeu: Deviner un nombre magique aléatoire entre deux bornes.

- Déroulement du jeu:
    - Niveau 1: Le nombre magique est compris entre 0 et 10. Le joueur a 5 vies.
    - Deviner le nombre: Le joueur propose un nombre
    - Perdre une vie: Le joueur propose un nombre incorrect.
    - Gagner un niveau: Le joueur trouve le nombre magique.
    - Le niveau suivant augmente de 10 (20 pour le niveau 2, etc.) et le nombre de vies du joueur est réinitialisé à 5.

## Fonctionnalités et contraintes

- Fonctionnalités implémentées
    - Page d’accueil avec une image sympa et trois boutons (démarrer une partie, voir mes scores, les règles)
    - Gestion de prénom pour la sauvegarde du score
    - Enregistrement de niveau avec le prénom
    - Gestion des niveaux de jeu (s'augmente après la réussite une partie)
    - Conservation de l’historique des scores
    - Reprise du jeu au dernier niveau non franchi

- Contraintes
    - Utilisation des Shared Preferences pour stocker de l’information (fonctionne sur Emulator et Chrome)
    - Utilisation de formulaires (entrer prénom), boites de dialogues (message d'erreur)
    - Insertion des images
    - Modification de style de police

## Technologies utilisés
- Projet Flutter et Dart
- Shared Preferences
- GitHub
