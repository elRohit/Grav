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
#sudo a2enmod ssl > /dev/null
#echo "Mòdul SSL habilitat correctament."
#sudo a2ensite default-ssl > /dev/null
#echo "Lloc SSL habilitat correctament."
#sudo systemctl restart apache2 > /dev/null
#echo "Apache reiniciat correctament."

# Crear un certificat letsencrypt
sudo apt-get install -y certbot  > /dev/null
echo "Certbot instal·lat correctament."
read -p "Introdueix el teu domini (extern): " domini
sudo certbot certonly -d $domini > /dev/null
echo "Certificat Let's Encrypt creat correctament."

#Variables VirtuaHost

# Crear un nou virtualhost per al GravCMS amb https i el certificat certbot
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/grav.conf
echo "Arxiu de configuració copiat correctament."
sudo sed -i 's|<VirtualHost *:80>|<VirtualHost *:443>|' /etc/apache2/sites-available/grav.conf
sudo sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/grav|' /etc/apache2/sites-available/grav.conf
sudo sed -i 's|ServerName localhost|ServerName '$domini'|' /etc/apache2/sites-available/grav.conf
sudo sed -i 's|ServerAdmin webmaster@localhost|ServerAdmin webmaster@'$domini'|' /etc/apache2/sites-available/grav.conf
sudo sed -i 's|#ServerAlias www.example.com|ServerAlias www.'$domini'|' /etc/apache2/sites-available/grav.conf
sudo sed -i 's|#SSLCertificateFile|SSLCertificateFile /etc/letsencrypt/live/'$domini'/fullchain.pem|' /etc/apache2/sites-available/grav.conf
sudo sed -i 's|#SSLCertificateKeyFile|SSLCertificateKeyFile /etc/letsencrypt/live/'$domini'/privkey.pem|' /etc/apache2/sites-available/grav.conf
sudo sed -i 's|#Include conf-available/serve-cgi-bin.conf|Include conf-available/serve-cgi-bin.conf\nSSLEngine on|' /etc/apache2/sites-available/grav.conf
echo "Arxiu de configuració modificat correctament."
# Reiniciar el servei d'apache
sudo systemctl restart apache2 > /dev/null
echo "Apache reiniciat correctament."

# Informar a l'usuari de la finalització de la instal·lació
echo "Instal·lació finalitzada. Ja pots accedir al teu nou lloc web amb GravCMS a https://$domini"
