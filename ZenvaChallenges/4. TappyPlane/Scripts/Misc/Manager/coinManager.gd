extends Node

signal coin_collected

@export var coin : PackedScene
var spawned_objects_position_x = 1700
var randi_max : int = 6
var last_obstacle_position : String

func _on_coin_timer_timeout() -> void:
	
	# Initialize random postion for coin + get last obstacle position
	var random_position : int = randi() % randi_max
	
	last_obstacle_position = get_parent().get_node("ObstacleManager").get("last_obstacle_position")
	
	# Check if the last obstacle position is the same as the random position
	# If so, dont spawn coin, if there is no obstacle spawned yet; spawn coin in the middle
	
	if last_obstacle_position == "top" and random_position < 2:
		return
	elif last_obstacle_position == "bottom" and random_position > 4:
		return
	elif last_obstacle_position == "null":
		random_position = randi_max / 2

	_spawn_coin(random_position)


func _process(_delta: float) -> void:
	for collectable in get_tree().get_nodes_in_group("Collectables"): 
		if collectable.position.x <= -100:
			collectable.queue_free()
			return

func _spawn_coin(coin_position: int):
	var coin_instance : Coin = coin.instantiate()
	add_child(coin_instance)
	coin_instance.position.x = spawned_objects_position_x
	coin_instance.position.y = 125  + coin_position * 125
