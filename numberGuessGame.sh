#!/bin/bash


echo -e "\nWelcome to the Bash Number Guess Game!\n"

echo -e "\n--------------------------------------\n"

echo -e "\n RULES : Random number will be generated each round, the computer will guess a number, and you will guess a number, whoever guesses the correct number will score a point, depending on your point differential between the computer and you, you will be awared a medal\nEnter a number out of range and you will exit the game\n"

sleep 2


yourscore=0
computerscore=0

properVariables=1

while [ $properVariables -eq 1 ]; do
    read -p "Guess a random number between x and y, type in x : >>> " x
    read -p "Now Type in y : >>>  " y
    if [ $x -lt $y ]; then
        echo -e "\nProper variables assigned, exiting loop"
        break
    elif [ $x -gt $y ]; then
        echo -e "\nX is greater than y, x must be less than y"
    elif [ $x -eq $y ]; then
        echo "\nX is equal to Y, x must be less than y"
    fi
done

loopCondition=1


while [ $loopCondition -eq 1 ] ; do
    echo -e "\n\nGuessing number --- \n\n"
    sleep 2
    randomNumber=$(shuf -i ${x}-${y} -n 1)
    computerGuess=$(shuf -i ${x}-${y} -n 1)
    read -p "Your guess?     " your_guess
    if [ $your_guess -lt $x -o $your_guess -gt $y ]; then
        echo -e "\n\nExiting program\n\n"
        break
    fi
    if [ $your_guess -eq $randomNumber -a $computerGuess -eq $randomNumber ]; then
        ((yourscore++))
        ((computerscore++))
        echo -e "The random number was ${randomNumber}\n and you and the computer both scored!\n"
    elif [ $your_guess -eq $randomNumber -a $computerGuess -ne $randomNumber ]; then
        ((yourscore++))
        echo -e "The random number was ${randomNumber}\n and you scored!\n"
    elif [ $your_guess -ne $randomNumber -a $computerGuess -eq $randomNumber ]; then
        ((computerscore++))
        echo -e "\nThe random number was ${randomNumber}\n and the computer scored!\n"
    else
        echo -e "\nThe random number was ${randomNumber}\n"
    fi
done
