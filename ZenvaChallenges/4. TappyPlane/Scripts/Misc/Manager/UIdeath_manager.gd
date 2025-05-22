extends Control

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ZenvaChallenges/4. TappyPlane/Scenes/menu.tscn")



func _on_play_again_pressed() -> void:
	get_tree().reload_current_scene()


func _on_player_manager_player_killed() -> void:
	$PlayAgain.disabled = false
	get_parent().get_node("Quit").disabled = false
	get_parent().get_node("Quit").visible = true
	self.visible = true

func _on_iterator_timeout() -> void:
	$CountDownLabel.text = str($CountDownLabel.text.to_int() - 1)
