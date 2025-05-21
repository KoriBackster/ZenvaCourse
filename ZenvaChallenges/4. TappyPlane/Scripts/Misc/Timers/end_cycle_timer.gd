extends Timer


func _on_player_manager_player_killed() -> void:
	$Iterator.start()
	self.start()
