extends Node2D

@export var coin : PackedScene


func _on_coin_timer_timeout() -> void:
	var coin_instance : Area2D = coin.instantiate()
	add_child(coin_instance)
	coin_instance.position.x = TappyPlaneGame.spawned_objects_position_x
	coin_instance.position.y = 500

func _process(delta: float) -> void:
	for collectable in get_tree().get_nodes_in_group("Collectables"): 
		if collectable.position.x <= -100:
			collectable.queue_free()
			return
