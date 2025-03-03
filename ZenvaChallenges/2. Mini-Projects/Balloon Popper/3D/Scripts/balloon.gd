extends Area3D

var is_clickable = false
var delayToggle = true

func _process(delta: float) -> void:
	if is_clickable && Input.is_action_just_pressed("click"):
		scale += scale * randf()


func _on_mouse_entered() -> void:
	is_clickable = true


func _on_mouse_exited() -> void:
	is_clickable = false

func _on_timer_timeout() -> void:
	if delayToggle:
		scale += (scale * randf())

func _on_balloon_manager_delay_toggle() -> void:
	delayToggle = !delayToggle
