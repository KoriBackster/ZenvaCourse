extends Node

@export var coin : PackedScene
var spawned_objects_position_x = 1700

func _on_coin_timer_timeout() -> void:
	var coin_instance : Area2D = coin.instantiate()
	add_child(coin_instance)
	coin_instance.position.x = spawned_objects_position_x
	coin_instance.position.y = 500

func _process(delta: float) -> void:
	for collectable in get_tree().get_nodes_in_group("Collectables"): 
		if collectable.position.x <= -100:
			collectable.queue_free()
			return
