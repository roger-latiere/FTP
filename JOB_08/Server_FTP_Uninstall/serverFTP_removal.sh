#!/bin/bash
# Suppression deu serveur ProFTPD et de ses dépendances ("-y" pour répondre "oui" automatiquement)
echo "Suppression du serveur ProFTPD et de ses dépendances"
sudo apt remove -y proftpd* && sudo apt auto-remove -y proftpd* && sudo apt purge -y proftpd*
echo "Suppression du serveur ProFTPD et de ses dépendances effectuée"

# Suppression du client Filezilla
echo "Suppression du client Filezilla"
sudo apt --purge remove -y filezilla && sudo apt auto-remove -y filezilla
echo "Client Filezilla supprimé"
echo "Désinstallation finie"
