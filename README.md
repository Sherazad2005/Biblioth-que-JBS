# Bibliothèque de logiciels SVT — La Salle Saint-Denis

Page web statique listant les logiciels SVT (téléchargements `.zip` / `.exe` et liens
externes), servie par Apache dans un conteneur Docker.

Aucune dépendance externe : un seul fichier `index.html` (CSS + JS inline), aucun CDN,
aucun backend, aucune base de données. Fonctionne hors-ligne une fois servi par Apache.

## Aperçu

- Grille de **22 cartes**, une par logiciel.
- Chaque carte affiche une pastille avec les **initiales du nom**, le nom, et un bouton :
  - **Ouvrir** (vert) → ouvre un lien externe dans un nouvel onglet ;
  - **Télécharger** (jaune) → télécharge le `.zip` / `.exe` depuis `Lien_zip_images/`.
- **Barre de recherche** filtrant les cartes par nom (JavaScript, côté client).

## Structure

```
.
├── index.html            # La page (grille de cartes + recherche)
├── Dockerfile            # Image Apache (httpd:alpine)
├── README.md
└── Lien_zip_images/      # Un sous-dossier par logiciel (zip / exe / _lien.txt)
```

## Lancer avec Docker

```bash
docker build -t lasalle-biblio .
docker run -d -p 8090:80 --name lasalle-biblio lasalle-biblio
```

Puis ouvrir : http://localhost:8090

> Le port `8090` est utilisé car `8080` est déjà occupé sur la machine (WAMP/autre
> service). Choisissez n'importe quel port libre côté gauche du `:` si besoin.

## Relancer après une modification de `index.html`

```bash
docker rm -f lasalle-biblio
docker build -t lasalle-biblio .
docker run -d -p 8090:80 --name lasalle-biblio lasalle-biblio
```

## Arrêter / relancer / supprimer

```bash
docker stop lasalle-biblio     # arrêter
docker start lasalle-biblio    # relancer
docker rm -f lasalle-biblio    # supprimer le conteneur
```

## Tester sans Docker

Le dossier étant dans `www/`, WAMP le sert directement :

```
http://localhost/Sherazad/Biblioth-que-JBS/
```

## Note — logiciel « Ecosysteme »

Le dossier `Lien_zip_images/Ecosysteme/` ne contient pour l'instant **pas de `.zip`**.
La carte affiche donc un bouton **Fichier manquant** désactivé. Déposez le zip dans ce
dossier puis rebâtissez l'image Docker pour activer le téléchargement.
