#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "select sum(winner_goals + opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "select avg(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "select round(avg(winner_goals), 2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "select avg(winner_goals + opponent_goals) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select greatest(max(winner_goals),  max(opponent_goals)) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "select count(*) from games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select name from games inner join teams on games.winner_id = teams.team_id where round = 'Final' and year = 2018")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select w.name 
from games g
inner join teams w
on g.winner_id = w.team_id
where g.round = 'Eighth-Final' and year = 2014

UNION

select o.name
from games g
inner join teams o
on g.opponent_id = o.team_id
where g.round = 'Eighth-Final' and year = 2014
order by name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct name from games inner join teams on games.winner_id = teams.team_id order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select year, name from games inner join teams on games.winner_id = teams.team_id where round = 'Final' order by year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select name from teams where name like 'Co%' order by name")"
