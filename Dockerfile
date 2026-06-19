FROM httpd:alpine

# Page d'accueil de la bibliothèque
COPY index.html /usr/local/apache2/htdocs/

# Logiciels, liens et images (servis directement par Apache)
COPY Lien_zip_images/ /usr/local/apache2/htdocs/Lien_zip_images/

EXPOSE 80
