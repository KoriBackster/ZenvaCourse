extends Area2D

var is_clickable = false

func _process(delta: float) -> void:
	if is_clickable:
		if Input.is_action_just_pressed("click"):
			scale += scale * randf_range(0.05, 0.2)


func _on_mouse_entered() -> void:
	is_clickable = true


func _on_mouse_exited() -> void:
	is_clickable = false
