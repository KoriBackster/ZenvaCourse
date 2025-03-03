extends Node3D

@export var balloon_scene : PackedScene

@export var max_balloons = 1

var balloons = []

func _ready() -> void:
	for i in range(max_balloons):
		spawn_balloon()

func _process(delta: float) -> void:
	for balloon in balloons:
		if balloon.scale.x > 2:
			pop_balloon(balloon)


func spawn_balloon():
	var balloon = balloon_scene.instantiate()
	
	balloon.position = Vector3(randi_range(-45, 45), randi_range(-22, 22), 0)
	add_child(balloon)
	balloons.append(balloon)

func pop_balloon(balloon):
	queue_free()
	balloons.erase(balloon)
