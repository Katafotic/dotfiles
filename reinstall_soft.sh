# Kubunutu 20.04.1
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install wget curl apt-transport-https
# Add spotify repository
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# Add sublime repository
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#
#
sudo apt-get update
sudo apt-get install vim emacs git sublime-text sublime-merge
#
sudo apt-get install spotify-client qbittorrent htop telegram-desktop safeeyes
#
sudo apt-get install build-essential valgrind texlive-full texmaker llvm
sudo apt-get install python3.9 ipython3
sudo apt-get install octave maxima wxmaxima cantor
sudo apt-get install libreoffice okular calibre 
