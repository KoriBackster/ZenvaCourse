extends RigidBody3D

var hit_force : float = 50.0

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var dir = global_position.direction_to(mouse)
		apply_impulse(dir * hit_force)
