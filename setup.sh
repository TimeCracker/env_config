new_home=$1
cur_script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
ori_home="/home/panyunpeng"

if [[ "$#" -ne 1 ]] || [[ ! -d "${new_home}" ]]; then
	echo "Useage: $0 directory_to_be_new_home"
	exit 1
fi

export HOME=${ori_home}

echo "home variable:"$HOME
echo "new home:"${new_home}

rm ${ori_home}/.zshrc
rm ${new_home}/.zshrc
rm -rf ${new_home}/.oh-my-zsh

bash zsh_install.sh

bash zsh_conf.sh

mv ${ori_home}/.oh-my-zsh ${new_home}
mv ${ori_home}/.zshrc ${new_home} 
touch ${ori_home}/.zshrc
echo HOME=${new_home} >> ${ori_home}/.zshrc
echo 'cd $HOME && source .zshrc' >> ${ori_home}/.zshrc
echo 'home variable:'$HOME

bash ${cur_script_dir}/neovim_install.sh

if [[ -d "${new_home}/.config" ]]; then
    rm -rf ${new_home}/.config/*
	echo "copy config"
    cp -rf ${cur_script_dir}/nvim ${new_home}/.config
    cp -rf ${cur_script_dir}/coc ${new_home}/.config
else
    mkdir ${new_home}/.config
	echo "copy config"
    cp -rf ${cur_script_dir}/nvim ${new_home}/.config
    cp -rf ${cur_script_dir}/coc ${new_home}/.config
fi


echo "Now you need to run: zsh -> source ~/.zshrc -> :PlugInstall in nvim"
echo "Now you need to run: zsh -> source ~/.zshrc -> :PlugInstall in nvim"
echo "Now you need to run: zsh -> source ~/.zshrc -> :PlugInstall in nvim"

exit 0




