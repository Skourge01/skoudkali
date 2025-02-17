#!/bin/bash 
# script para automatizar o debian disfarçado de kali kkj 
instalar_dependencias(){
    sudo apt install gnupg dirmngr 
    sudo apt install wget 
}
instalar_dependencias
clonar_wget(){
    wget -q -O - https://archive.kali.org/archive-key.asc | gpg --import
}
clonar_wget
adicionar_repositorio(){
    echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list.d/kali.list
}
adicionar_repositorio
export_gpg(){
    gpg --export ED444FF07D8D0BF6 > /etc/apt/trusted.gpg.d/kali-rolling.gpg
}
export_gpg 
sudo apt update 
sudo apt upgrade
