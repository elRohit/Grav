# Actualitzar el sistema
sudo apt-get update > /dev/null && sudo apt-get upgrade -y > /dev/null
echo "Sistema actualitzat correctament."

# Instal·lar dependències necessàries (servidor web, php, unzip)
sudo apt-get install -y apache2 php8.1 php8.1-curl php8.1-dom php8.1-gd php8.1-mbstring php8.1-xml php8.1-zip unzip > /dev/null
echo "Dependències(apache,php,unzip) instal·lades correctament."

# Descarregar i descomprimir el GravCMS
# Preguntar a l'usuari si vol la versió Grav Admin
read -p "Vols la versió Grav Admin? (yes/no): " grav_admin

# Establir l'URL de descàrrega segons la resposta de l'usuari
if [ "$grav_admin" == "yes" ]; then
    download_url="https://getgrav.org/download/core/grav-admin/1.7.48"
else
    download_url="https://getgrav.org/download/core/grav/1.7.48"
fi

# Descarregar i descomprimir el GravCMS a la ruta corresponent
wget $download_url -O grav.zip > /dev/null
echo "GravCMS descarregat correctament."
unzip grav.zip -d /var/www/html/ > /dev/null
echo "GravCMS descomprimit correctament."

# Configurar un nou virtualhost per al GravCMS amb https i certificat autogenerat
sudo a2enmod ssl > /dev/null
echo "Mòdul SSL habilitat correctament."
sudo a2ensite default-ssl > /dev/null
echo "Lloc SSL habilitat correctament."
sudo systemctl restart apache2 > /dev/null
echo "Apache reiniciat correctament."

# Crear un certificat letsencrypt
sudo apt-get install -y certbot python3-certbot-apache > /dev/null
echo "Certbot instal·lat correctament."
sudo certbot --apache > /dev/null
echo "Certificat Let's Encrypt creat correctament."

# Reiniciar el servei d'apache
sudo systemctl restart apache2 > /dev/null
echo "Apache reiniciat correctament."

# Informar a l'usuari de la finalització de la instal·lació
echo "Instal·lació finalitzada. Ja pots accedir al teu nou lloc web amb GravCMS a https://localhost"
