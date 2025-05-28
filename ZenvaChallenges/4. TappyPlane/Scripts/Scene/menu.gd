extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ZenvaChallenges/4. TappyPlane/Scenes/tappy_plane_game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
	
