class_name Player_Plane
extends RigidBody2D

@export var impulse_force : int = 1
func _ready() -> void:
	self.gravity_scale = 0.0

func _process(delta: float) -> void:
	if gravity_scale == 0.0:
		return
	if Input.is_action_pressed(&"Click"):
		apply_impulse(Vector2.UP * impulse_force * .5)
		get_parent().emit_signal("player_boosting")


func _on_start_delay_timeout() -> void:
	self.gravity_scale = 0.8
