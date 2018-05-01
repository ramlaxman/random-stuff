#!/usr/bin/sh
echo "Enter your username: "
read u_name
cd /home/$u_name/Downloads
echo "Enter Firefox version to download like 59.0: "
read ver_num
wget https://ftp.mozilla.org/pub/firefox/releases/$ver_num/linux-x86_64/en-GB/firefox-$ver_num.tar.bz2
tar -xjf firefox-$ver_num.tar.bz2
sudo root
cd /home/$u_name/Downloads
mv firefox /opt/
mv /usr/bin/firefox /usr/bin/firefox-backup #to make backup of default web browser
ln -s /opt/firefox/firefox /usr/bin/firefox
exit
firefox
 