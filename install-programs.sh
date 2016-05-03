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
sudo apt-get -y install build-essential libqt4-dev libx11-6 libx11-dev
sudo apt-get -y install wget
mkdir auto-downloads && cd auto-downloads
git clone https://github.com/Raffarti/Touchegg-gce.git
cd Touchegg-gce
mkdir build && cd build
sudo qmake ..
sudo make && make install

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


#############################
### Sublime Text Settings ###
#############################

echo "open sublime to initialize filepaths"
subl

git config --global core.editor "subl -n -w"


wget --no-check-certificate https://packagecontrol.io/Package%20Control.sublime-package -O ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package

cp ./assets/Package\ Control.sublime-settings ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings
cp ./assets/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

echo "sublime text 3 configuring done"
