new_home=$1

bash zsh_install.sh

mv .zshrc ${new_home} 
touch .zshrc
echo 'HOME=${new_home}' >> .zshrc
echo 'cd $HOME && source .zshrc' >> .zshrc
source .zshrc

bash zsh_conf.sh
bash neovim_install.sh

if [[ -d "~/.config" ]]; then
    rm -rf ~/.config/*
    cp -r nvim ~/.config
    cp -r coc ~/.config
else
    mkdir ~/.config
    cp -r nvim ~/.config
    cp -r coc ~/.config

exit 0




