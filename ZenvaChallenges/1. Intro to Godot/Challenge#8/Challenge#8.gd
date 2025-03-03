extends Node2D

var time_elapsed : float = 0.0

func _process(delta: float) -> void:
	time_elapsed += delta
	print("Time Elasped: ", snappedf(time_elapsed, 0.01))