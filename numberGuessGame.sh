#!/bin/bash


echo -e "\nWelcome to the Bash Number Guess Game!\n"

echo -e "\n--------------------------------------\n"

echo -e "\n RULES : Random number will be generated each round, the computer will guess a number, and you will guess a number, whoever guesses the correct number will score a point, depending on your point differential between the computer and you, you will be awared a medal\n"


yourscore=0
computerscore=0

read -p "Guess a random number between x and y, type in x : >>> " x
read -p "Now Type in y : >>>  " y

loopCondition=1


while [ $loopCondition -eq 1 ] ; do
    echo -e "\n\nGuessing number --- \n\n"
    sleep 3
    randomNumber=$((x + $RANDOM % y))
    computerGuess=$((x + $RANDOM % y))
    read -p "Your guess?" your_guess
    if [ $your_guess -eq $randomNumber -a $computerGuess -eq $randomNumber ]; then
        ((yourscore++))
        ((computerscore++))
        echo -e "The random number was ${randomNumber}\n"
    elif [ $your_guess -eq $randomNumber -a $computerGuess -ne $randomNumber ]; then
        ((yourscore++))
        echo -e "The random number was ${randomnumber}\n"
    elif [ $your_guess -ne $randomNumber -a $computerGuess -eq $randomNumber ]; then
        ((computerscore++))
        echo -e "\nThe random number was ${randomnumber}\n"
    else
        echo "\nThe random number was ${randomNumber}\n"
    fi
done
