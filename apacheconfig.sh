#! /bin/bash

#---------------1st section: to create apache config and create web directory and download wordpress------------------
search="abc.com" 
replace=$1  # 1st argument domain-name 
replace_email=$2 # 2nd argument email  
search_email="webmaster@abc.com"
filename=$replace".conf"
cp template.conf $filename
sed -i "s/$search_email/$replace_email/" $filename
#sleep 2
sed -i "s/$search/$replace/" $filename  
sudo mv $filename /etc/apache2/sites-available/$filename
sudo mkdir /var/www/html/$replace
sudo wget -P /var/www/html/$replace https://wordpress.org/latest.tar.gz 
cd /var/www/html/$replace
sudo tar xzf latest.tar.gz
sudo mv /var/www/html/$replace/wordpress /var/www/html/$replace/public
sudo rm /var/www/html/$replace/latest.tar.gz
sudo chown -R www-data:www-data /var/www/html/$replace
sudo chmod -R 755 /var/www/html/$replace

#----------------------2nd section to enable site in apache and getting certificate from let's encript
sudo a2ensite $filename
sudo systemctl reload apache2
sudo certbot --apache --agree-tos --redirect -m $replace_email -d $replace
