# Idle.gd
extends PlayerState


func enter(msg := {}) -> void:
	if msg.has("jump_buffer"):
		player.velocity.y = player.max_jump_velocity
	else:
		player.velocity = Vector2.ZERO
		player.sfx_player.play_land_sfx()
	
	
func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		player.anim_state.travel("attack")
	
	
func update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return
		
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Run")


func physics_update(delta: float) -> void:
	if player.taking_damage:
		state_machine.transition_to("Knockback")
	
	player.velocity.x = player.speed * 0
	player.velocity.y += player.gravity * delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
