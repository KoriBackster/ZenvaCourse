extends Control

signal start_game

func _ready() -> void:
	
	self.visible = true


func _on_player_spawn() -> void:
	$StartTimer.start()


var currentTime : int = 2
func _on_start_timer_timeout() -> void:
	if currentTime > -1:
		$RemainingStartTimeDisplay.text = str((currentTime)) + "(s)"
		currentTime -= 1
		if currentTime == -1:
			$RemainingStartTimeDisplay.queue_free()
		return
	elif currentTime == -1:
		emit_signal("start_game")
		$StartTimer.stop()
		self.queue_free()
		return