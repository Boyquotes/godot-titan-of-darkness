
extends PlayerState


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	var input_direction_x: float = (
			Input.get_action_strength("move_right")
			- Input.get_action_strength("move_left")
		) 
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y = 0.0
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)


func enter(_msg := {}) -> void:
	player.velocity.y = 0.0
	player.coyote_timer.start()


func _on_CoyoteTimer_timeout() -> void:
	state_machine.transition_to("Air")
