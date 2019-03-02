echo deb http://ftp.debian.org/debian stretch-backports main contrib > /etc/apt/sources.list.d/stretch-backports.list
apt -y update
apt -y install libapache2-mod-php7.0
apt -y install virtualbox-guest-dkms virtualbox-guest-x11 linux-headers-$(uname -r)
#mv /var/www/html/index.html /var/www/html/index.html.old
#cp /vagrant/index.php /var/www/html/index.php
