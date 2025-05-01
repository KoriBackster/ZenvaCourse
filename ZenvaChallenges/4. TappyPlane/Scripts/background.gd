extends Node2D

const screenWidth = 800*2

func _process(delta: float) -> void:
	if position.x <= -screenWidth:
		position.x = 0
		return
