extends Node2D



@export var obstacle : PackedScene


func _on_obstacles_timer_timeout() -> void:
	var random : int = randi() % 2
	var obstacle_instance : Area2D = obstacle.instantiate()
	add_child(obstacle_instance)
	
	obstacle_instance.position.x = TappyPlaneGame.spawned_objects_position_x
	
	if random == 0:
		obstacle_instance.position.y = 970
		obstacle_instance.scale.y *= -1
		
	elif random == 1:
		obstacle_instance.position.y = 0

func _process(delta: float) -> void:
	for object in get_tree().get_nodes_in_group("Obstacles"): 
		if object.position.x <= -100:
			object.queue_free()
			return
