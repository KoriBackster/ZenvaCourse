extends Area2D

@onready var player = PlayerManager.player_instance

func _on_body_entered(body:Node2D) -> void:
	if body == player:
		PlayerManager._F__kill_player()
