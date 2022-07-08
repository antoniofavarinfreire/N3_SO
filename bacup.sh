#!/usr/bin/env bash

# Alex Kleber Leandro Carneiro
# Antonio Favarin Freire

clear
echo "Bem vindo $USER"
month=$(date "+%B")
name_zip=$(date +"%Y-%m-%d")
echo "$name_zip"
if [ -d "/home/$USER/projetos" ] 
then
# echo "home/$USER/projetos"
    if [ -d "/home/backups" ] 
    then  
        echo "Acessando arquivo backup"
        echo
        else 
            echo "Criando pasta backups"
            echo
            sudo mkdir "/home/backups"
            sudo chmod u+x "/home/backups" 
            sudo chown $USER:$USER "/home/backups"
    fi
    if [ -d "/home/backups/$month" ]
    then
        echo "Pasta já existente."
        echo "Deseja sobrepor o backup [y,N]?"
        read choice
        case $choice in
            "y")
                echo "Substituindo pasta do mes de $month"
                echo
                mkdir "/home/backups/$month"
                    ;;
            "N")
                    echo "That's right!"
                    ;;
        esac
        else 
            echo "Criando pasta do mês de $month"
            echo
            mkdir "/home/backups/$month"
    fi
    # criar rotina para criar arquivo zip e mover para dentro da pasta backup
    zip "/home/backups/$month/"$name_zip "/home/$USER/projetos/"
    
else 
    echo "Esta pasta não existe, por favor crie a pasta."
fi