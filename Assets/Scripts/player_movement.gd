extends CharacterBody2D

@export var speed: int = 150

func _ready():
	pass

func _physics_process(delta: float) -> void:
	
	velocity = Vector2(0,0)

	if Input.is_action_pressed("Right"):
		velocity.x = 1
	if Input.is_action_pressed("Left"):
		velocity.x = -1
	if Input.is_action_pressed("Down"):
		velocity.y = 1
	if Input.is_action_pressed("Up"):
		velocity.y = -1

	velocity = Vector2(velocity.x, velocity.y).normalized() * speed
	move_and_slide()

