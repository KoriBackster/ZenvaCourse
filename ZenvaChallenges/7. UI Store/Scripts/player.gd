extends Sprite2D

# Function creates direction single reactions based on InputEvents
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# "if (input) is (A mouse button Input)" ->
			
			position = get_global_mouse_position()
