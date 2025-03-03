extends Node

var player_money : int = 10

func _ready():
	print("Player Money [start?]: ", player_money)

	player_money += 5
	print("Player Money [add 5?]: ", player_money)

	player_money *= 2
	print("Player Money [double?]: ", player_money)

	player_money -= 3
	print("Player Money [take 3?]: ", player_money)

	player_money /= 2
	print("Player Money [half?]: ", player_money)

	player_money = 27

	player_money %= 3
	print("Player Money [remainder 3?]: ", player_money)

	player_money = 26

	player_money %= 3
	print("Player Money [remainder 3?]: ", player_money)