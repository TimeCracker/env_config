sudo apt-get --purge remove zsh
sudo apt-get update && sudo apt-get -y install zsh
sudo chsh $USER -s $(which zsh)

