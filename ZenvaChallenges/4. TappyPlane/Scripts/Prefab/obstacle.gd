class_name Obstacle
extends Area2D

func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("Player"):
		
		body.get_parent()._F__kill_player()
		return		
