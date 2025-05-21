class_name Coin
extends Area2D


func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("Player"):
		get_parent().emit_signal("coin_collected")
		queue_free()
		
		
	
