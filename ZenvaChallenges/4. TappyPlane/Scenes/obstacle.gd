extends Area2D



func _on_body_entered(body:Node2D) -> void:
	emit_signal("body_entered", body)
