class_name Coin
extends Area2D



func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("Player"):
		get_parent().emit_signal("coin_collected")
		$CoinCollected.play("CoinCollected")
		if self.modulate != Color(1, 1, 1, 1):
			print_debug("Rare coin: " + str(self.modulate) + " collected!")
		

func _on_coin_collected_animation_finished(anim_name:StringName) -> void:
		queue_free()
		return
