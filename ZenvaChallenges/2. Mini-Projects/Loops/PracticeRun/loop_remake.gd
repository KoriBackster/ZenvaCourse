extends Node2D

@export var star_count : int = 280
@export var max_x : int = 184
@export var max_y : int = 100

var star_scene = preload("res://ZenvaChallenges/2. Mini-Projects/Loops/PracticeRun/star.tscn")

func _ready():
	for i in star_count:
		var star = star_scene.instantiate()
		add_child(star)
		star.position.x = randi_range(max_x, -max_x)
		star.position.y = randi_range(max_y, -max_y)
		
		var star_scale = randf_range(.4,1.0)
		star.scale.x = star_scale
		star.scale.y = star_scale
