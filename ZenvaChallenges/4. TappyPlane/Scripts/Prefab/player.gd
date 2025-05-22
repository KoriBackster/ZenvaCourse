class_name Player_Plane
extends RigidBody2D

var color : String

@export var impulse_force : float = 1800.0

func _process(delta: float) -> void:
	if gravity_scale == 0.0:
		return
	if Input.is_action_pressed(&"Click"):
		apply_impulse(Vector2.UP * impulse_force * delta)
		get_parent().emit_signal("player_boosting")
		$Rutter.emitting = true
	else:
		$Rutter.emitting = false


	
