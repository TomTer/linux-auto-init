echo "Asking for sudo"
sudo echo "lallaa"

# Add repositories
echo "Adding sublime text 3 repository"
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y

echo "Adding dropbox repo key"
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
echo "Adding dropbox repo"
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu precise main" -y

echo "Adding repo for KeePass2"
sudo apt-add-repository ppa:jtaylor/keepass -y

echo "Adding repo for VeraCrypt"
sudo add-apt-repository ppa:unit193/encryption -y

echo "Adding repo for Zotero"
sudo add-apt-repository ppa:smathot/cogscinl -y

sudo apt-get update

# Install programs
echo "Installin sublime text 3"
sudo apt-get -y install sublime-text-installer

echo "Installing dropbox"
sudo apt-get -y install dropbox

echo "Installing touchegg"
sudo apt-get -y install touchegg

echo "Installing git"
sudo apt-get -y install git

echo "Compiling touchegg-gce"
sudo apt-get -y install build-essential libqt4-dev libx11-6 libx11-dev libssl-dev
sudo apt-get -y install wget
mkdir auto-downloads && cd auto-downloads
git clone https://github.com/Raffarti/Touchegg-gce.git
cd Touchegg-gce
mkdir build && cd build
qmake ..
sudo make
sudo make install
cd ../../..

echo "Installing Chromium"
sudo apt-get -y install chromium-browser

echo "Installing KeePass2"
sudo apt-get -y install keepass2

echo "Installing VeraCrypt"
sudo apt-get -y install veracrypt

echo "Installing VirtualBox"
sudo apt-get -y install virtualbox

echo "Installing Double Commander"
sudo apt-get -y install doublecmd-gtk

echo "Installing powertop"
sudo apt-get -y install powertop

echo "Installing openvpn"
sudo apt-get -y install openvpn

echo "Installing Zotero"
sudo apt-get -y install zotero-standalone

echo "Saving touchegg settings"
synclient TapButton2=0
synclient TapButton3=0
synclient ClickFinger2=3
synclient ClickFinger3=0
synclient HorizTwoFingerScroll=1
synclient VertTwoFingerScroll=1

cp ./assets/touchegg.conf ~/.config/touchegg/

#############################
### Sublime Text Settings ###
#############################

echo "Saving sublime text 3 settings"
echo "open sublime to initialize filepaths"
subl

git config --global core.editor "subl -n -w"


wget --no-check-certificate https://packagecontrol.io/Package%20Control.sublime-package -O ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package

cp ./assets/Package\ Control.sublime-settings ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings
cp ./assets/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

echo "sublime text 3 configuring done"

echo "Installing Vagrant version 1.8.1"
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb -P auto-downloads

sudo dpkg -i ./auto-downloads/vagrant_1.8.1_x86_64.deb

echo "Installing ChefDK version 0.10.0"
wget https://packages.chef.io/stable/debian/6/chefdk_0.10.0-1_amd64.deb -P auto-downloads

sudo dpkg -i ./auto-downloads/chefdk_0.10.0-1_amd64.deb

echo "Installing vagrant-omnibus"
vagrant plugin install vagrant-omnibus

echo "Installing berkshelf"
chef gem install berkshelf

echo "Installing VirtualBox guest additions iso"
sudo apt-get -y install -y virtualbox-guest-additions-iso

echo "Installing chef gems"
chef gem install knife-solo
chef gem install knife-solo_data_bag
chef gem install knife-ec2

echo "Installing smartgit"
wget http://www.syntevo.com/static/smart/download/smartgit/smartgit-linux-7_1_3.tar.gz -P auto-downloads
tar -xzf ./auto-downloads/smartgit-linux-7_1_3.tar.gz -C ./auto-downloads
sudo mv ./auto-downloads/smartgit /opt/

echo "Installing Firefox Dev"
wget https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora/firefox-48.0a2.en-US.linux-x86_64.tar.bz2 -P auto-downloads
tar -jxf ./auto-downloads/firefox-48.0a2.en-US.linux-x86_64.tar.bz2 -C ./auto-downloads
mv ./auto-downloads/firefox ./auto-downloads/firefox-dev
sudo mv ./auto-downloads/firefox-dev /opt/

echo "Installing Webstorm EAP"
wget http://download.jetbrains.com/webstorm/WebStorm-EAP-145.969.8.tar.gz -P auto-downloads
tar -xzf ./auto-downloads/WebStorm-EAP-145.969.8.tar.gz -C ./auto-downloads
sudo mv ./auto-downloads/WebStorm-145.969.8 /opt/WebStorm-EAP

echo "Installing sshfs"
sudo apt -y install sshfs

echo "Installing Nodejs version manager"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
~/.nvm/nvm.sh
nvm i 6
nvm use 6


# ON MAC
# sudo apt-get install efibootmgr
# sudo efibootmgr
# sudo efibootmgr -o 0,80
# http://stackoverflow.com/questions/25000934/trouble-with-dual-boot-ubuntu-after-update-mac-os-yosemite

# SHOW GRUB
# http://askubuntu.com/questions/16042/how-to-get-to-the-grub-menu-at-boot-time
