extends Node2D

@export var pan_speed: float = 200.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x <= -800:
		position.x = 0
	
func _physics_process(delta: float) -> void:
	position.x -= pan_speed * delta
	# Uncomment the line below to see the background moving
	# print("Background position: ", position.x)
