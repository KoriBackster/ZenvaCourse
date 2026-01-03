extends Window


# Called when the node enters the scene tree for the first time.


func _on_close_requested() -> void:
	queue_free()
