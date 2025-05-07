extends StaticBody2D

@onready var collision_shape : CollisionShape2D = get_node("CollisionShape2D")
@onready var TEST_MODE : bool = TappyPlaneGame.test_mode
func _ready() -> void:
	
	collision_shape.set_disabled(!TEST_MODE)
		
