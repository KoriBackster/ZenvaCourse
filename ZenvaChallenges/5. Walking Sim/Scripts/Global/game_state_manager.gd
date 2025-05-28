extends Node
signal change_scene(scene_path: String, game_type: int)
func _physics_process(_delta: float) -> void:
	# Mouse lock toggle
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			get_tree().paused = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused = true

func _on_tree_2_interact() -> void:
	emit_signal("change_scene", "res://ZenvaChallenges/4. TappyPlane/Scenes/menu.tscn", 2)
