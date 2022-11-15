# Run.gd
extends PlayerState

func enter(msg := {}) -> void:
	player.dust_particles.emitting = true
	
	if msg.has("jump_buffer"):
		player.velocity.y = player.max_jump_velocity
	
	player.anim_state.travel("run")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		state_machine.transition_to("Attack")


func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air", {was_on_floor = true})
		return
		
	if player.taking_damage:
		state_machine.transition_to("Knockback")

		
	var input_direction_x: float = (
		Input.get_action_strength("move_right") -
		Input.get_action_strength("move_left")
	)
	
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})
	elif is_equal_approx(input_direction_x, 0.0):
		state_machine.transition_to("Idle")


func exit() -> void:
	player.dust_particles.emitting = false
