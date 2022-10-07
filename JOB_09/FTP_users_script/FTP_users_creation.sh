#!/bin/bash
# Script pour créer un ou plusieurs utilisateurs FTP
# création du groupe administrateur du serveur FTP
sudo groupadd ftpgroupadm
# Afficher et parcourir le fichier.csv pour récupérer les mots de passes et prénoms 
cat FTP_users.csv | while read varligne
do
	password=`echo $varligne |cut -d ',' -f4`
	username=`echo $varligne |cut -d ',' -f2`
	username=`echo ${username,,}`
	role=`echo $varligne |cut -d ',' -f5`
	echo $role
# Condition "utilisateur administrateur" ou "utilisateur standard" avec création de l'utilisateur/mot de passe et encryptage du mot de passe	
	if [ ${role:0:5} = "Admin" ]
	then
		echo "creation de l'utilisateur : $username"     	
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password) 
		useradd -m -p "$pass" "$username"
      		echo "changement du role de : $username"
     		sudo usermod -aG sudo $username
        	sudo adduser $username ftpgroupadm
    	else 
       	 	echo "creation de l'utilisateur : $username"       	
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)       
        	useradd -m -p "$pass" "$username"        	   

    fi
# Je signale que la 1ère ligne n'est pas à prendre en compte    
done < <(tail -n +2 FTP_users.csv)
