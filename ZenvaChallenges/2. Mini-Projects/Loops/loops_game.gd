extends Node2D
@export var spawn_count : int = 350
@export var max_x : int = 590
@export var max_y : int = 320
var star_scene = preload("res://ZenvaChallenges/2. Mini-Projects/Loops/star.tscn")
func _ready():
	for i in spawn_count:
		var star = star_scene.instantiate()
		add_child(star)
		star.position.x = randi_range(-max_x, max_x)
		star.position.y = randi_range(-max_y, max_y)
		var star_size = randf_range(.5,1.5)
		star.scale.x = star_size
		star.scale.y = star_size
