#!/bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\nWelcome to My Salon, how can I help you?\n"

SERVICE_APPOINTMENT(){
  read SERVICE_TIME
  $PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID_RESULT, $SERVICE_ID_RESULT, '$SERVICE_TIME')"

  echo -e "\nI have put you down for a $SERVICE_ID_NAME at $SERVICE_TIME, $CUSTOMER_NAME_RESULT."

}

MAIN_MENU(){

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  $PSQL "select service_id, name from services"| while IFS="|" read id name
  do
  echo "$id) $name"
  done

  read SERVICE_ID_SELECTED 

  SERVICE_ID_RESULT=$($PSQL "select service_id from services where service_id = '$SERVICE_ID_SELECTED' ")
  SERVICE_ID_NAME=$($PSQL "select name from services where service_id = '$SERVICE_ID_SELECTED' ")

  if [[ -z $SERVICE_ID_RESULT ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"

  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_PHONE_RESULT=$($PSQL "select phone from customers where phone = '$CUSTOMER_PHONE' ")
    
    if [[ -z $CUSTOMER_PHONE_RESULT ]]
    then
      # new customer
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      $PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
      CUSTOMER_NAME_RESULT=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
      CUSTOMER_ID_RESULT=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")

      echo -e "\nWhat time would you like your $SERVICE_ID_NAME , $CUSTOMER_NAME_RESULT?"

      SERVICE_APPOINTMENT

    else
      # query customer name thru phone number
      CUSTOMER_NAME_RESULT=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
      CUSTOMER_ID_RESULT=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
     
      echo -e "\nWhat time would you like your $SERVICE_ID_NAME , $CUSTOMER_NAME_RESULT?"

      SERVICE_APPOINTMENT



    fi


  fi
}

MAIN_MENU


  