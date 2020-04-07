#!/bin/bash

echo "~~~~~~~~START GAME~~~~~~~~~"

#Constant
START=0
NOPLAY=0
SNAKE=1
LADDER=2
WINNING=100

echo "Starting position of player : $START"
playerCurrentPosition=$START

function play() {
	while [ $playerCurrentPosition -lt $WINNING ]
	do
		diceValue=$((RANDOM%6 + 1))
		echo "Dice value is $diceValue"

		option=$((RANDOM % 3))
		case $option in
			$NOPLAY)
				echo "No Play...";;
			$SNAKE)
				echo "Snake..."
				((playerCurrentPosition-=$diceValue));;
			$LADDER)
				echo "Ladder..."
				((playerCurrentPosition+=$diceValue));;
		esac
		echo "Current position of player : $playerCurrentPosition"
	done
}
play
