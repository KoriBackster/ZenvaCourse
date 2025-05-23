extends Control

signal start_game

func _on_player_spawn() -> void:
	$AnimationTree.play("EnableStartUI")
	$StartUI/StartTimer.start()

func _on_player_killed() -> void:
	$AnimationTree.play("EnableDeathUI")
	

var currentTime : int = 2
func _on_start_timer_timeout() -> void:
	if currentTime > -1:
		$StartUI/RemainingStartTimeDisplay.text = str((currentTime)) + "(s)"
		currentTime -= 1
		if currentTime == -1:
			$StartUI/RemainingStartTimeDisplay.queue_free()
			$AnimationTree.play("DisableStartUI")
		return
	elif currentTime == -1:
		emit_signal("start_game")
		$StartUI/StartTimer.stop()
		$StartUI.queue_free()
		return

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ZenvaChallenges/4. TappyPlane/Scenes/menu.tscn")

func _on_play_again_pressed() -> void:
	get_tree().reload_current_scene()

func _on_iterator_timeout() -> void:
	$DeathUI/CountDownLabel.text = str($DeathUI/CountDownLabel.text.to_int() - 1)
