#!/bin/bash

setup_ubuntu () {
    echo "[0] updating submodules"
    git submodule update --init --recursive
    echo "[1] Installing runtime packages"
    install_essential_runtime_packages_ubuntu
    echo "[2] copying my beloved backup settings <3"
    copy_settings
    echo "[3] configuring vim"
    configure_vim
    echo "[4] configuring the awesome plugins!"
    configure_plugins_vim
}
copy_settings() {
    echo "\t copying bashrc settings"
    cp oh-my-bash/templates/bashrc.osh-template ~/.bashrc
    echo "\t copying vimrc settings"
    cp .vimrc ~/.vimrc
    echo "\t creating directory ~/.vim for plugins"
    mkdir ~/.vim
    echo "\t copying tmux settings"
    cp .tmux/.tmux.conf ~/.tmux.conf
}
configure_vim() {
    # vim package installer <3
    curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
    # installing vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}
configure_plugins_vim(){
    # source first
    source ~/.bashrc || source ~/.bash_profile' or 'source ~/.zshrc
    # neeerd treeeeeeeeeee
    apt-vim install -y https://github.com/scrooloose/nerdtree.git
}
install_essential_runtime_packages_ubuntu (){
    # some packages that I would need in the beginning
    apt-get install vim
    apt-get install git
    apt-get install build-essentials
    apt-get install curl
}
setup_ubuntu
