extends Node

@export var obstacle : PackedScene
var spawned_objects_position_x = 1700
var last_obstacle_position : String = "null"

func _on_obstacles_timer_timeout() -> void:
	var random : int = randi() % 2
	var obstacle_instance : Obstacle = obstacle.instantiate()
	obstacle_instance.add_to_group("Obstacles")
	add_child(obstacle_instance)
	
	obstacle_instance.position.x = spawned_objects_position_x
	
	if random == 0:
		obstacle_instance.position.y = 970
		obstacle_instance.scale.y *= -1
		last_obstacle_position = "bottom"
		
	elif random == 1:
		obstacle_instance.position.y = 0
		last_obstacle_position = "top"

func _process(delta: float) -> void:
	for object in get_tree().get_nodes_in_group("Obstacles"): 
		if object.position.x <= -100:
			object.queue_free()
			return
