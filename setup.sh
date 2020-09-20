new_home=$1
mv .zshrc ${new_home} 
touch .zshrc
echo 'HOME=${new_home}' >> .zshrc
echo 'cd $HOME && source .zshrc' >> .zshrc
source .zshrc


