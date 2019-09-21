#!/bin/bash

setup_ubuntu () {
    # using old aliases because 
    # I might install old version of Ubuntu that
    # doesn't use "apt" alias
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
    cp .zshrc ~/.zshrc
    cp .vimrc ~/.vimrc
    mkdir ~/.vim
}
configure_vim() {
    # vim package installer <3
    curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
    # installing vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}
configure_plugins_vim(){
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
