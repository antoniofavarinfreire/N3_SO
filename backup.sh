#!/usr/bin/env bash

# Alex Kleber Leandro Carneiro
# Antonio Favarin Freire

clear
echo "Bem vindo $USER"
month=$(date "+%B")
name_zip=$(date +"%Y-%m-%d")

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
        if [ $choice != "y" ]
        then 
            if [ $choice != "N" ]
            then 
                echo "Comando não encontrado"
                exit 0
            fi
            
        fi
        case $choice in
            "y")
                echo "Substituindo pasta do mes de $month"
                echo
                rm -rf "/home/backups/$month" 
                mkdir "/home/backups/$month"
                    ;;
            "N")
                    echo "Encerrando o processo"
                    exit 0 
                    ;;
        esac
        
        else 
            echo "Criando pasta do mês de $month"
            echo
            mkdir "/home/backups/$month"
    fi
    # criar rotina para criar arquivo zip e mover para dentro da pasta backup
    zip "/home/backups/$month/"$name_zip "/home/$USER/projetos/"
    DIR=/home/backups/$month/
    if [ -e $DIR$name_zip.zip ]
    then 
        echo
        echo "Tudo certo backup feito !" 
        exit 0
    else 
        echo
        echo "Algo deu errado."
        echo "Por favor tente executar o script novamente."
        exit 0
    fi

else 
    echo "Esta pasta não existe, por favor crie a pasta."
    exit 0
fi