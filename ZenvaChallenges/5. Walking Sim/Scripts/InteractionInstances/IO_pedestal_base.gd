extends InteractableObject
@onready var light : Node3D = $LightBulb

func _interact():
	light.visible = !light.visible
