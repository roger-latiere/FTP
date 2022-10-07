#!/bin/bash
# Suppression deu serveur ProFTPD
echo "Suppression du serveur ProFTPD"
sudo apt remove proftpd* && sudo apt auto-remove proftpd* && sudo apt purge proftpd*
echo "Suppression du serveur ProFTPD effectuée"

# Suppression du client Filezilla
echo "Suppression du client Filezilla"
sudo apt remove filezilla && sudo apt auto-remove filezilla
echo "Client Filezilla supprimé"
echo "Désinstallation finie"
