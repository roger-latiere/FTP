# Installation automatisée d'un serveur FTP configuré et fonctionnel

# Installation du serveur ProFTPD et de ses dépendances
echo "Installation du serveur ProFTPD et de ses dépendances"
sudo apt install proftpd*
echo "ProFTPD et dépendances installés"

# Installation du client Filezilla
echo "Installation du client Filezilla"
sudo apt update
sudo apt install filezilla
echo "Client Filezilla installé"

# Modifications du fichier "proftpd.conf"
echo "Paramétrage du serveur ProFTPD"
echo proftpd_config.txt > /etc/proftpd/proftpd.conf
echo "Paramétrage ProFTPD effectué"

# Création du dossier SSL
echo "Mise à jour SSL"
sudo apt install openssl
echo "Mise à jour SSL réussie"
echo "Création du dossier SSL"
mkdir /etc/proftpd/ssl
echo "Dossier SSL crée"

# Création du certificat et de la clé SSL
echo "Création du certificat et de la clé SSL"
sudo openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem
echo "Certificat et clé SSL crée"
sudo chmod -R 750 /etc/proftpd/ssl
echo "Validation poour utilisation de la clé vérifiée"

# Modification du fichier "tls.conf"
echo "Paramétrage TLS"
echo tls_config.txt > /etc/proftpd/tls.conf
echo "Paramétrage TLS effectué"

# Modification du fichier "modules.conf"
echo "Paramétrage des modules"
echo modules_config.txt > /etc/proftpd/modules.conf
echo "Paramétrage des modules effectué"

# Redémarrage du serveur pour valider les paramétrages
echo "Redémarrage du Serveur ProFTPD pour valider les paramétrages"
sudo service proftpd restart

