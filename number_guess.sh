#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

secret_number=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read username

user_id=$($PSQL "SELECT user_id FROM users WHERE username = '$username'")

if [[ -n $user_id ]]
then
  result=$($PSQL "SELECT COUNT(*), MIN(guesses) FROM games WHERE user_id = $user_id")
  IFS='|' read games_played best_game <<< "$result"

  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
else
  echo "Welcome, $username! It looks like this is your first time here."
  
  insert_user_result=$($PSQL "INSERT INTO users(username) VALUES('$username')")
  user_id=$($PSQL "SELECT user_id FROM users WHERE username = '$username'")
fi

echo "Guess the secret number between 1 and 1000:"
read user_input
guess_count=1

while true
do
  # Check if input is a valid positive integer
  if [[ ! "$user_input" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read user_input
    continue
  fi 

  if [[ $user_input -eq $secret_number ]]
  then
    # Record game result before exiting
    insert_game_result=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($user_id, $guess_count)")
    echo "You guessed it in $guess_count tries. The secret number was $secret_number. Nice job!"
    break
  elif [[ $user_input -gt $secret_number ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi

  (( guess_count++ ))
  read user_input
done