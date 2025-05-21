extends StaticBody2D

@onready var collision_shape : CollisionShape2D = get_child(0)
@onready var TEST_MODE : bool = get_parent().get("TEST_MODE")

func _ready() -> void:
	
	collision_shape.set_disabled(!TEST_MODE)
	
