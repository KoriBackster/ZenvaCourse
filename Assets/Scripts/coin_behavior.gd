extends Area2D


func _process(delta: float) -> void:
	rotate(delta)

func _on_body_entered(body: Player) -> void:
	queue_free()

	body.scale += Vector2(0.1, 0.1)