#!/bin/sh
echo "This script will install below\n\n1) XRDP\n2) Apache\n3) PHP\n4) KingPhisher\n5) Sendmail\n"

sudo apt-get update
echo -e "\n\n"
echo "###### Installing XRDP ######\n"
sleep 5
yes Y | sudo apt-get install xrdp
sudo apt-get update
echo "\n\n"

echo "###### Installing MATE Desktop ######\n"
sleep 5
yes Y |sudo apt-get install mate-core mate-desktop-environment mate-notification-daemon
sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n mate-session \n' /etc/xrdp/startwm.sh
sudo service xrdp restart
echo "\n\n"

echo "###### Installing Apache2 & PHP Stack ######\n"
sleep 5
yes Y | sudo apt install apache2
yes Y | sudo apt install php libapache2-mod-php php-mysql
echo "\n\n"

echo "###### Installing KingPhisher ######\n"
sleep 5
sudo mkdir KP
yes Y | wget -q https://github.com/securestate/king-phisher/raw/master/tools/install.sh
chmod 755 install.sh
yes Y | ./install.sh
echo "\n\n"

echo "###### Installing Sendmail ######\n"
sleep 5
yes Y | sudo apt-get install sendmail
echo "\n\n"

echo "###### Starting Services ######\n"
sleep 5
sudo service sendmail start
sudo service apache2 stop
cd /opt/king-phisher && ./KingPhisherServer server_config.yml
echo "\n\n"

echo -e "#####################################################\nInstallation completed for :\n\n1) XRDP\n2) Apache\n3) PHP\n4) KingPhisher\n5) Sendmail\n#####################################################\n\n#####################################################\nKingPhisher Server is running on port 80\nYou can modify the configuration in /opt/kingphisher/server_config.yml\n\nSendmail running on port 25\nYou can modify sendmail configuration in /etc/mail/sendmail.cf\n#####################################################\n\n"
echo -e "Note: Make sure your ports 25 & 80 are open if services fail to start\n\n"
echo -e "~~~~Follow me @paU1i_root on twitter~~~~\n"









