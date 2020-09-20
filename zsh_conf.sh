git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#cat ZSH_THEME="powerlevel10k/powerlevel10k" >> ~/.zshrc
sed 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k/powerlevel10k\"' ~/.zshrc
