extends RigidBody2D

@export var impulse_force : int = 700

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(&"Click"):
		apply_central_impulse(Vector2.UP * impulse_force)
