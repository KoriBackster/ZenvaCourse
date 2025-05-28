extends RayCast3D

@onready var interaction_prompt_label : Label = $InteractionPrompt

func _process(_delta: float) -> void:
	var object = get_collider()
	interaction_prompt_label.text = ""
	
	if object and object is InteractableObject:
		if object.can_interact:
			interaction_prompt_label.text = object.interactable_text
			interaction_prompt_label.show()
		else:
			interaction_prompt_label.hide()
		
		if Input.is_action_just_pressed("Interact"):
			object._interact()
		
