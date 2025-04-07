extends Area3D

var delayToggle = true

func _on_timer_timeout() -> void:
	if !delayToggle:
		scale += (scale * randf())

func _on_balloon_manager_delay_toggle() -> void:
	delayToggle = !delayToggle


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		scale += scale * randf()
