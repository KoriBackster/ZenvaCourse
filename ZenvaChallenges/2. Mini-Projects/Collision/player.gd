extends RigidBody3D
@onready var timer = $Timer
@onready var timer2 = $Timer2
@export var move_speed : float = 6.0
var forward_dir = Vector3(0.35, 0.0, 0.0)
func _physics_process(delta: float) -> void:
	
	if Input.is_key_pressed(KEY_LEFT):
		linear_velocity.x = lerp(linear_velocity.x, move_speed, 0.5)
	elif Input.is_key_pressed(KEY_RIGHT):
		linear_velocity.x = lerp(linear_velocity.x, -move_speed, 0.5)
	else:
		linear_velocity.x = lerp(linear_velocity.x, 0.0, 0.05)


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Tree"):
		get_tree().reload_current_scene()
	if body.is_in_group("Ground"):
		timer.start()
	if body.is_in_group("Killzone"):
		get_tree().reload_current_scene()


func _on_body_exited(body: Node) -> void:
	if body.is_in_group("Ground"):
		timer2.start()


func _on_timer_timeout() -> void:
	print_debug("hello")


func _on_timer_2_timeout() -> void:
	print_debug("goodbye")
