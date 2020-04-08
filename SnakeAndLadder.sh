#!/bin/bash

echo "~~~~~~~~START GAME~~~~~~~~~"

#Constant
STARTING_POSITION=0
WINNING_POSITION=100
NOPLAY=1
SNAKE=2
LADDER=3

#Variables
rollCount=0
player=1
currentPositionPlayer1=$STARTING_POSITION
currentPositionPlayer2=$STARTING_POSITION

#Function show the current position of player
function showCurrentPosition {
	echo "Current Positions--> Player1: $currentPositionPlayer1 Player2: $currentPositionPlayer2"
}

function rollDice() {
	diceValue=$((RANDOM%6 + 1))
	option=$((RANDOM%3 + 1))
}

while [[ $currentPositionPlayer1 -ne $WINNING_POSITION && $currentPositionPlayer2 -ne $WINNING_POSITION ]]
do
	showCurrentPosition
	rollDice
	(( rollCount++ ))

	if [[ $player -eq 1 ]]
	then
		tempPosition=$currentPositionPlayer1
	else
		tempPosition=$currentPositionPlayer2
	fi

		case $option in
			$NOPLAY)
				echo "No play..."
				echo "Player $player stays at same position $tempPosition";;
			$SNAKE)
				echo "Snake..."
					if [[ $(( $"$tempPosition" - $diceValue )) -lt $STARTING_POSITION ]]
					then
						tempPosition=$STARTING_POSITION
						echo "Player $player has came back to starting position"
					else
						((tempPosition-=$diceValue))
						echo "Player $player moves backward by $diceValue positions"
					fi;;
			$LADDER)
				echo "Ladder..."
					if [ $(( $"$tempPosition" + $diceValue )) -le $WINNING_POSITION ]
					then
						((tempPosition+=$diceValue))
						echo "Player $player moves forward by $diceValue positions"
					else
						echo "Player$player stays at same position $tempPosition"
					fi;;
		esac
		if [[ $player -eq 1 ]]
		then
			currentPositionPlayer1=$tempPosition
		else
			currentPositionPlayer2=$tempPosition
		fi
		player=$(( 3 - $player))
done

if [[ $currentPositionPlayer1 -eq $WINNING_POSITION ]]
then
	echo "Player1 Won!"
else
	echo "Player2 Won!"
fi
echo "Turn required : $rollCount"
