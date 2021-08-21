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
read share
echo "Absolute path to share" 
read path

aptcheck

sudo cat > /etc/samba/smb.conf << EOF 
["$share"]
    comment = Samba on Ubuntu
    path = $path
    read only = no
    browsable = yes 
EOF

sudo service smbd restart

sudo ufw allow samba

sudo smbpasswd -a bresnow
