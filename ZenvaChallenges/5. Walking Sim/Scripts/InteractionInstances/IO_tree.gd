extends InteractableObject

signal interact

func _interact():
	emit_signal("interact")
