extends CharacterBody2D

func player_input():
	if Input.is_action_just_pressed("Right"):
		velocity = Vector2.RIGHT
	elif Input.is_action_just_pressed("Left"):
		velocity = Vector2.LEFT
	elif Input.is_action_just_pressed("Up_Forward"):
		velocity = Vector2.UP
	elif Input.is_action_just_pressed("Down_Backward"):
		velocity = Vector2.DOWN
	else:
		velocity = Vector2.ZERO

func move(direction : Vector2) -> void:
	pass