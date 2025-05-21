extends DirectionalLight3D

@export var time_multiplier: int = 1

func _ready():
	pass

func _process(delta):
	rotate_z(delta * 0.025 * time_multiplier) # Rotate the sun around the Z-axis for a simple effect.
