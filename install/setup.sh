#Actualitzar el sistema
sudo apt-get update && sudo apt-get upgrade -y
# Instal·lar dependències necessàries (webserver, php, unzip)
sudo apt-get install -y apache2 php8.3 php8.3-curl php8.3-dom php8.3-gd php8.3-mbstring php8.3-xml php8.3-zip unzip
# Descarregar i descomprimir el GravCMS
# Preguntar a l'usuari si vol la versió Grav Admin
read -p "Vols la versió Grav Admin? (yes/no): " grav_admin

# Establir l'URL de descàrrega segons la resposta de l'usuari
if [ "$grav_admin" == "yes" ]; then
    download_url="https://getgrav.org/download/core/grav-admin/1.7.48"
else
    download_url="https://getgrav.org/download/core/grav/1.7.48"
fi

# Descarregar i descomprimir el GravCMS la ruta on correspon
wget $download_url 
unzip 1.7.48 -d /var/www/html/
#Configurar virtualhost nou per al GravCMS amb https i certificat autogenerat
sudo a2enmod ssl
sudo a2ensite default-ssl
sudo systemctl restart apache2  
# Crear un certificat letsencrypt
sudo apt-get install -y certbot python3-certbot-apache
sudo certbot --apache
# Reiniciar el servei d'apache
sudo systemctl restart apache2
# Informar a l'usuari de la finalització de la instal·lació
echo "Instal·lació finalitzada. Ja pots accedir al teu nou lloc web amb GravCMS a https://localhost"




