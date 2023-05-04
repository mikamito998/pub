
#!/bin/bash
#Get the necessary components
apt-get update
apt-get upgrade
apt-get install sudo nano -y
apt-get install wget -y
apt-get install git -y
apt-get install unzip
apt-get install udisks2 -y
echo " " > /var/lib/dpkg/info/udisks2.postinst
apt-mark hold udisks2
apt-get install sudo tzdata -y
apt-get install xfce4 xfce4-goodies gnome-terminal nautilus parole -y
apt-get install tigervnc-standalone-server dbus-x11 -y
apt-get --fix-broken install
apt-get clean

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
startxfce4" > ~/.vnc/xstartup

echo "#!/bin/sh
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
rm -rf /run/dbus/dbus.pid
dbus-launch xfce4-session" > /usr/local/bin/vncstart
   echo "vncserver -geometry 1600x900 -name remote-desktop :1" > /usr/local/bin/vnc-start
   echo "vncserver -kill :*" > /usr/local/bin/vnc-stop
   chmod +x ~/.vnc/xstartup
   chmod +x /usr/local/bin/*
   clear
   echo ""
   echo "Installing Browser,.."
   echo ""
#Browser Fix
cp /etc/apt/sources.list ~/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/passwd -P .vnc/
echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 605C66F00D6C9793
apt update
apt install firefox-esr -y
vnc-start
sleep 5
DISPLAY=:1 firefox &
sleep 10
pkill -f firefox
vnc-stop
sleep 2

wget -O $(find ~/.mozilla/firefox -name *.default-esr)/user.js https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/user.js

rm -rf /etc/apt/sources.list
mv sources.list /etc/apt/
rm .vnc/passwd
   clear
   echo ""
   echo "Installing Modded,.."
   echo ""
#Ubuntu Modded = wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/modded.sh ; chmod +x modded.sh ; ./modded.sh
#Windows 10 = wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/Windows/win10.sh ; chmod +x win10.sh ; ./win10.sh
#Windows 11 = 
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/Windows/win11.sh ; chmod +x win11.sh ; ./win11.sh
   clear
   echo ""
   echo "Vnc Server address will run at 127.0.0.1:5901"
   echo "Start Vnc Server, run vnc-start"
   echo "Stop Vnc Server, run vnc-stop"
   echo ""
rm de-ubuntu.sh
apt-get update
apt-get upgrade
