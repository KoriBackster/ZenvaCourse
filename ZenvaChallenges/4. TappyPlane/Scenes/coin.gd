extends Area2D

@onready var player = TappyPlaneGame.player_instance

func _on_body_entered(body:Node2D) -> void:
	if body == player:
		print_debug("Coin!")
		
	
