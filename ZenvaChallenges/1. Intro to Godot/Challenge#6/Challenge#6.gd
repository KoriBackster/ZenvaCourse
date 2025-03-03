extends Node

var game_over : bool

func _ready() -> void:
	game_over = randi_range(0, 1) == 1
	if game_over:
		print("Go to menu.")
	else:
		print("Keep playing.")