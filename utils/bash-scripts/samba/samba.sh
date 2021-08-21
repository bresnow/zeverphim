#!/bin/bash
pkg=samba

aptcheck () {
dpkg -s $pkg &> /dev/null  

    if [ $? -ne 0 ]

        then
            echo "$pkg is not installed. Downloading."  
            sudo apt-get update && sudo apt-get install $pkg
        else
            echo    "$pkg is installed"
    fi
}



echo "Name of the share" 
read -r share
echo "Absolute path to share" 
read -r path

aptcheck

<<<<<<< HEAD
sudo cat > /etc/samba/smb.conf << EOF 
=======
sudo cat /etc/samba/smb.conf << EOF 
>>>>>>> c2bdea48ddd3c491f50b977bd31688fed56a0bbd
["$share"]
    comment = Samba on Ubuntu
    path = $path
    read only = no
    browsable = yes 
EOF

sudo service smbd restart

sudo ufw allow samba

sudo smbpasswd -a bresnow
