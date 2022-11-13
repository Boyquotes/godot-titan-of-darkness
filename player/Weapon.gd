extends Node2D




func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		owner.anim_state.travel("attack")


#fun
#c next_animation() -> void:
#	owner.anim_state.travel("idle")
