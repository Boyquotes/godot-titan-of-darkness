extends PlayerState





func handle_input(event: InputEvent) -> void:
	pass


# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	pass


func enter(_msg := {}) -> void:
	player.anim_state.travel("attack")


func change_state_after_attack():
	if is_equal_approx(player.velocity.y, 0.0):
		state_machine.transition_to("Idle")
	else:
		state_machine.transition_to("Run")


func exit() -> void:
	pass
