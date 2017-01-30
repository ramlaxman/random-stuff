#!/usr/bin/sh
su -
yum install httpd php
yum install gcc glibc glibc-common
yum install gd gd-devel
useradd -m nagios
passwd nagios
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd apache
cd /home/$USER/Downloads
mkdir demo && cd demo
# to change the value automatically
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' sysctl.conf
wget https://sourceforge.net/projects/nagios/files/latest/download?source=files
tar xzf *.tar.gz nagios-extract/ 
cd nagios-extract/
./configure --with-command-group=nagcmd
make all
make install
make install-init
make install-config
make install-commandmode
vi /usr/local/nagios/etc/objects/contacts.cfg
'to enter email ID of Nagios Admin'
make install-webconf
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagios
service httpd restart

print "Enter plugin no from Nagios Tur" 
tar -zxvf nagios-plugins-2.1.4.tar.gz nagios-plugins-2.1.4/
cd nagios-plugins-2.1.4/
./configure --with-nagios-user=nagios --with-nagios-group=nagios
make
chkconfig --add nagios
chkconfig nagios on
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg 
service nagios start
getenforce 
vi /etc/sysconfig/selinux
'Set SELINUX=enforcing to SELINUX=disabled'
chcon -R -t httpd_sys_content_t /usr/local/nagios/bin
chcon -R -t httpd_sys_content_t /usr/local/nagios/sbin
chcon -R -t httpd_sys_content_t /usr/local/nagios/share

'
*** Compile finished ***

If the main program and CGIs compiled without any errors, you
can continue with installing Nagios as follows (type ''make''
without any arguments for a list of all possible options):
###read this to understand that its not a magic
  make install
     - This installs the main program, CGIs, and HTML files

  make install-init
     - This installs the init script in /etc/rc.d/init.d

  make install-commandmode
     - This installs and configures permissions on the
       directory for holding the external command file

  make install-config
     - This installs *SAMPLE* config files in /usr/local/nagios/etc
       You will have to modify these sample files before you can
       use Nagios.  Read the HTML documentation for more info
       on doing this.  Pay particular attention to the docs on
       object configuration files, as they determine what/how
       things get monitored!

  make install-webconf
     - This installs the Apache config file for the Nagios
       web interface

  make install-exfoliation
     - This installs the Exfoliation theme for the Nagios
       web interface

  make install-classicui
     - This installs the classic theme for the Nagios
       web interface
  make install
'
'
*** Main program, CGIs and HTML files installed ***

You can continue with installing Nagios as follows (type ''make''
without any arguments for a list of all possible options):

  make install-init
     - This installs the init script in /etc/rc.d/init.d

  make install-commandmode
     - This installs and configures permissions on the
       directory for holding the external command file

  make install-config
     - This installs sample config files in /usr/local/nagios/etc
'