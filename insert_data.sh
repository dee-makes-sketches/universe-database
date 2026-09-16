#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
tail -n +2 games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals 
do 
# fetch winner_id and opponent_id by checking if it exist in db
  winner_id=$($PSQL "select team_id from teams where name = '$winner'")
  opponent_id=$($PSQL "select team_id from teams where name = '$opponent'")

  if [[ -z $winner_id ]] # if winner_id is empty meaning it doesnt exist 
    then
    $PSQL "insert into teams(name) values('$winner')"
    winner_id=$($PSQL "select team_id from teams where name = '$winner'") 
  fi

  if [[ -z $opponent_id ]] # if opponent_id is empty meaning it doesnt exist 
    then
    $PSQL "insert into teams(name) values('$opponent')"
    opponent_id=$($PSQL "select team_id from teams where name = '$opponent'")

  fi

  game_insert=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($year,'$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals )")

done