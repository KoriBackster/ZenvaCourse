extends StaticBody2D

@onready var collision_shape : CollisionShape2D = get_node("CollisionShape2D")
@export var TEST_MODE : bool = false

func _ready() -> void:
	
	collision_shape.set_disabled(!TEST_MODE)
	
