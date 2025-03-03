extends Node3D
signal pop
signal delayToggle

@export var max_balloons : int = 10
@export var balloon_scene : PackedScene
@export var balloon_delay : bool = true
@onready var delay : Timer = $Delay
var max_scale = 2

var balloons = []
var open_slot
var can_spawn : bool = true

func _ready() -> void:
	delay.wait_time = 0.01
	
	for i in range(max_balloons):
		spawn_balloon()
	can_spawn = false

func _process(delta: float) -> void:
	for balloon in balloons:
		if balloon.scale.x > max_scale:
			pop_balloon(balloon)
	
	if balloon_delay:
		delay.wait_time = (randf() * randi_range(1,4))
	
	open_slot = balloons.size() < max_balloons
	
	if open_slot and can_spawn:
		spawn_balloon()

func spawn_balloon():
	var balloon = balloon_scene.instantiate()
	
	balloon.position = Vector3(randi_range(-45, 45), randi_range(-22, 22), 0)
	add_child(balloon)
	balloons.append(balloon)
	
	can_spawn = false
	if balloons.size() > 0:
		delay.start()
	else: can_spawn = true

func pop_balloon(balloon):
	balloon.queue_free()
	balloons.erase(balloon)
	pop.emit()
	

func _on_delay_timeout() -> void:
	can_spawn = true


func _on_play_toggle_pressed() -> void:
	balloon_delay = !balloon_delay
	delayToggle.emit()
