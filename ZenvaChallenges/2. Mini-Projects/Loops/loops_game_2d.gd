extends Node2D

@export var spawn_count : int = 200

@export var star_scene_a : PackedScene

var star_scene_b = preload("res://ZenvaChallenges/2. Mini-Projects/Loops/star.tscn")

func _ready():
	for i in spawn_count:
		var star = star_scene_b.instantiate()
		add_child(star)
		
		star.position.x = randi_range(-280,280)
		star.position.y = randi_range(150,-150)
	
