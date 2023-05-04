#!/bin/bash

apt update && apt upgrade -y

apt install -y sudo nano wget tzdata dbus-x11 tigervnc-standalone-server
apt update -y && apt upgrade -y && apt install wget -y && apt install sudo nano -y && apt install wget -y

# apt install tango-icon-theme

apt clean && apt autoremove -y

mkdir ~/.vnc &> /dev/null

echo '#!/bin/bash
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
taskset -c 4-7 startxfce4' > ~/.vnc/xstartup

echo 'vncserver -name remote-desktop -geometry 960x540 -localhost no :1' > /usr/local/bin/vnc-start
echo 'vncserver -kill :1' > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop

# echo "export DISPLAY=:1
# export PULSE_SERVER=127.0.0.1" >> ~/.bash_profile
# source ~/.bash_profile

echo ""
echo "Install XFCE"
echo ""
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-xfce.sh ; chmod +x de-xfce.sh ; ./de-xfce.sh


echo ""
echo "Install Windows 11 Theme"
echo ""
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/Windows/win11.sh ; chmod +x win11.sh ; ./win11.sh
