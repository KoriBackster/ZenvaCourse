extends Node2D
signal pop

@export var balloon_scene : PackedScene
@export var max_balloons = 10
@export var timeDelay : float = 3.0

@onready var delay = $BalloonDelay

var temp_bMax
var balloons = []

func _ready():
	for i in range(max_balloons):
		spawn_balloon()
	temp_bMax = max_balloons
	delay.wait_time = timeDelay

func _process(delta):
	for balloon in balloons:
		if balloon.scale.x > 2:
			pop_balloon(balloon)
			
			if balloons.size() > 0:
				delay.start()
			else:
				spawn_balloon()
	if temp_bMax != max_balloons:
		print_debug(max_balloons)
		temp_bMax = max_balloons

func spawn_balloon():
	var balloon = balloon_scene.instantiate()
	balloon.position = Vector2(randi() % 800, randi() % 600)
	add_child(balloon)
	balloons.append(balloon)

func pop_balloon(balloon):
	balloon.queue_free()
	balloons.erase(balloon)
	pop.emit()


func _on_balloon_delay_timeout() -> void:
	spawn_balloon()


func _on_score_tracker_level_up() -> void:
	max_balloons += 1
	spawn_balloon()
