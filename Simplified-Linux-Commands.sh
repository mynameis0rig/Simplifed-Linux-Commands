#!/bin/bash

clear
( echo "Welcome to the script that I play around with" ; echo " ")

Menu='Please enter the option you want: '
options=("Create a new user and password" "Check The IP Address" "Show Menu" "Show how much space is left in your home folder" "Quit") 
select opt in "${options[@]}"
do 
    case $opt in
        "Create a new user and password")
            read -p "Please Enter The User You Would Like To Create: " UA
            useradd $UA
            passwd $UA
            ;;
        "Check The IP Address")
            options1=("loopback" "Wifi" "Quit")
            select opts in "${options1[@]}"
            do
                case $opts in
                    "loopback")
                        ifconfig | grep -A 8 lo:
                    ;;
                    "Wifi")
                        ifconfig | grep -A 8 wlp1s0:
                    ;;
                    "Quit")
                        break
                        
                        ;;
                    *) echo "invalid option $REPLY";
                esac
            done
            ;;
        "Show Menu")
            ( echo "1) Create a new user and password" ; echo "2) Check The IP Address" ; echo "3) Show menu"; echo "4) Show how much space is left in your home folder"; echo "5) Quit")
            ;;
        "Show how much space is left in your home folder")
            df | grep /home/$USER
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
